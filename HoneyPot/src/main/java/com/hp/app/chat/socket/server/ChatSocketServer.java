package com.hp.app.chat.socket.server;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hp.app.chat.service.ChatService;
import com.hp.app.chat.vo.ChatMemberVo;
import com.hp.app.chat.vo.ChatMessageVo;
import com.hp.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ChatSocketServer extends TextWebSocketHandler{
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	@Autowired
	private ChatService service;
	
	// 커넥션 이후 동작
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// session에서 id를 가져와서 로그에 남긴다(없어도 되는 과정)
        users.put(session.getId(), session);
	}

	// 커넥션 클로즈 이후 동작
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	        users.remove(session.getId());
	}
	
	// 메세지 받았을 때 동작
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
		String payload = message.getPayload().toString();
    	ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode = objectMapper.readTree(payload);
	    log.info(jsonNode.toString());
	    String action = jsonNode.get("action").asText();
		MemberVo loginMember = (MemberVo) session.getAttributes().get("loginMember");
		String mno = loginMember.getNo();
		String name = loginMember.getName();
		String profile = loginMember.getProfile();
			// 웹소켓 메시지(JSON 문자열)에서 메시지 및 방 번호 추출
		    Map<String, String> msgVo = new HashMap<String, String>();
		    
		    // 클라이언트에서 메시지를 불러오는 요청을 받았을 때 처리
		    if (action.equals("loadMessages")) {
		    	String roomId = jsonNode.get("roomNo").asText();
		        JsonObject response = new JsonObject();
		        msgVo.put("roomNo", roomId);
		        
		        // 데이터베이스에서 메시지 목록을 불러오기
		        List<ChatMessageVo> cmList = service.getMsg(roomId);
		        
		        // 불러온 메시지 목록을 JSON 형태로 변환하고 클라이언트에게 전송
		        JsonArray messagesArray = new JsonArray();
		        for (int i = 0; i < cmList.size(); i++) {
		            JsonObject msgObj = new JsonObject();
		            msgObj.addProperty("name", cmList.get(i).getMemberName());
		            msgObj.addProperty("msg", cmList.get(i).getContent());
		            msgObj.addProperty("time", cmList.get(i).getSendTime());
		            msgObj.addProperty("profile", cmList.get(i).getMemberProfile());
		            messagesArray.add(msgObj);
		        }
		        response.add("messages", messagesArray);
		        
		        // 클라이언트에게 응답 전송
		        response.addProperty("action", "loadMessages"); 
		        String jsonResponse = response.toString();
		        for (WebSocketSession s : users.values()) {
		            s.sendMessage(new TextMessage(jsonResponse));
		        }
		        
		    }  else if (action.equals("sendMessage")) {
		        // 클라이언트에서 새로운 메시지를 보냈을 때 처리
		    	String senderMemberNo = jsonNode.get("memberNo").asText(); // senderMemberNo 추출
		        String messageContent = jsonNode.get("message").asText();
		        String rno = jsonNode.get("roomNo").asText();
		        
		        msgVo.put("memberNo", mno);
		        msgVo.put("name", name);
		        msgVo.put("msg", messageContent);
		        msgVo.put("profile", profile);
		        msgVo.put("sender", senderMemberNo);
		        msgVo.put("roomNo", rno);
		        log.info(msgVo.toString());
		        // 데이터베이스에 메시지 저장
		        int result = service.saveMessage(msgVo);
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		        String currentTime = dateFormat.format(new Date());
		        msgVo.put("time", currentTime);

		        Gson gson = new Gson();
		        String jsonStr = gson.toJson(msgVo);

		        for (WebSocketSession s : users.values()) {
		            s.sendMessage(new TextMessage(jsonStr));
		        }
		       
		    }else if(action.equals("updateReadTime")) {
		    	String roomId = jsonNode.get("roomNo").asText();
	            String memberId = jsonNode.get("memberId").asText();
	            
	            loginMember = (MemberVo) session.getAttributes().get("loginMember");
	            
	            ChatMemberVo mvo = new ChatMemberVo();
	            mvo.setChattingRoomNo(roomId);
	            mvo.setMemberNo(memberId);
	            if (loginMember.getNo().equals(memberId)) {
	                int result = service.updateReadTime(mvo);
	            }
		    }else if (action.equals("user_quit")) {
		        // 클라이언트에서 채팅방에서 나간 이벤트를 받았을 때 처리
		        String userName = jsonNode.get("userName").asText();
		        String quitMsg = String.format(userName + "님이 채팅방을 나갔습니다.");
		        String roomNo = jsonNode.get("roomNo").asText();
		        System.out.println("User quit event: " + jsonNode);

		        JsonObject quitMessage = new JsonObject();
		        quitMessage.addProperty("action", "user_quit");
		        quitMessage.addProperty("userName", userName);
		        quitMessage.addProperty("message", quitMsg);

		        System.out.println("Users:" + users); 
		        System.out.println("RoomNo from message: " + roomNo); 

		        // 나간 사용자가 속한 채팅방에 있는 모든 사용자에게 메시지 전송
		        for (WebSocketSession s : users.values()) {
		          System.out.println("Checking session: " + s + ", roomNo: " + s.getAttributes().get("roomNo")); 
		          if (s.getAttributes().get("roomNo").equals(roomNo)) {
		            System.out.println("Sending message to session: " + s); 
		            s.sendMessage(new TextMessage(quitMessage.toString()));
		          }
		        }
		      }
	       
	}
	
	@Override
    public void handleTransportError(
            WebSocketSession session, Throwable exception) throws Exception {
        log.info(session.getId() + " 예외 발생: " + exception.getMessage());
    }


}
