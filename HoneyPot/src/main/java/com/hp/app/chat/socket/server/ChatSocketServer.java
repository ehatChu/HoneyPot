package com.hp.app.chat.socket.server;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.hp.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ChatSocketServer extends TextWebSocketHandler{
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	// 커넥션 이후 동작
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// session에서 id를 가져와서 로그에 남긴다(없어도 되는 과정)
        log(session.getId() + " 연결 됨");

        // 위에서 선언한 users라는 map에 user를 담는 과정(필수)
        // map에 담는 이유는 메세지를 일괄적으로 뿌려주기 위해서이다
        users.put(session.getId(), session);
        
	}

	// 커넥션 클로즈 이후 동작
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		 	log(session.getId() + " 연결 종료됨");

	        // map에서 세션에서 연결 종료된 유저를 없애는 이유는
	        // 더 이상 메세지를 보낼 필요가 없기 때문에 목록에서 지우는 것이다
	        users.remove(session.getId());
	}
	
	// 메세지 받았을 때 동작
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		log.info(users.toString());
		MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
		String name = loginMember.getName();
		String profile = loginMember.getProfile();
		log.info(profile);
		Gson gson = new Gson(); 
		
		HashMap<String, String> msgVo = new HashMap<String, String>();
		msgVo.put("name", name);
		msgVo.put("msg", message.getPayload());
		msgVo.put("profile", profile);
		
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    String currentTime = dateFormat.format(new Date());
	    msgVo.put("time", currentTime);
		
		String jsonStr = gson.toJson(msgVo);
		
		for(WebSocketSession s : users.values()) {
			s.sendMessage(new TextMessage(jsonStr));
		}
	}
	
	@Override
    public void handleTransportError(
            WebSocketSession session, Throwable exception) throws Exception {
        log(session.getId() + " 예외 발생: " + exception.getMessage());
    }

    private void log(String logmsg) {
        System.out.println(new Date() + " : " + logmsg);
    }

}
