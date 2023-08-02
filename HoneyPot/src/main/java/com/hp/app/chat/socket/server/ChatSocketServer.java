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
		MemberVo loginMember = (MemberVo)session.getAttributes().get("loginMember");
		log.info(loginMember.toString());

        // 위에서 선언한 users라는 map에 user를 담는 과정(필수)
        users.put(session.getId(), session);
        
	}

	// 커넥션 클로즈 이후 동작
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		 	log(session.getId() + " 연결 종료됨");

	        users.remove(session.getId());
	}
	
	// 메세지 받았을 때 동작
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
		log.info(users.toString());
        // 수신한 하나의 메세지를 users 맵에 있는 모든 유저(세션)들에게
        // 맵을 반복으로 돌면서 일일이 보내주게 되도록 처리
		MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
		String name = loginMember.getName();
		String profile = loginMember.getProfile();
		log.info(profile);
		Gson gson = new Gson(); 
		
		// 맵 만들어서 key : value 형태로 준비
		// 발신 시각, 발신자 이름, 발신 메세지, 읽은 시간 체크 
		HashMap<String, String> msgVo = new HashMap<String, String>();
		msgVo.put("name", name);
		msgVo.put("msg", message.getPayload());
		msgVo.put("profile", profile);
		
		// 현재 시간을 "yyyy-MM-dd HH:mm" 형식으로 포맷팅하여 추가
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    String currentTime = dateFormat.format(new Date());
	    msgVo.put("time", currentTime);
		
		// 맵을 json 으로 변환
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
