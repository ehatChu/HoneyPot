package com.hp.app.delivery.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.hp.app.admin.vo.AdminVo;
import com.hp.app.delivery.service.DeliveryService;
import com.hp.app.delivery.vo.DeliveryVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class DeliverySocket extends TextWebSocketHandler{

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	
	@Autowired
	private DeliveryService service;
	
	// 커넥션 이후 동작
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
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
		AdminVo loginAdmin = (AdminVo) session.getAttributes().get("loginAdmin");

		String payload = message.getPayload().toString();
		ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode = objectMapper.readTree(payload);
	    
		String sendType = jsonNode.get("sendType").asText();
		
		List<DeliveryVo> receiveVo = new ArrayList<DeliveryVo>(); 
		for(int i = 0; i < jsonNode.get("noArr").size(); i++) {
			DeliveryVo vo = new DeliveryVo();
			vo.setSendType(sendType);
			vo.setMemberNo(jsonNode.get("noArr").get(i).asText());
			vo.setAdminNo(loginAdmin.getNo());
			
			receiveVo.add(vo);
		}
		
		if("DELIVERY".equals(sendType)) {
			service.insertDelivery(receiveVo);
		}else if("PARCEL".equals(sendType)) {
			service.insertParcel(receiveVo);
		}
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(receiveVo);
		
		for (WebSocketSession s : users.values()) {
            s.sendMessage(new TextMessage(jsonStr));
        }
		
	}



	// 메세지 에러 페이지
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log.info(session.getId() + " 예외 발생: " + exception.getMessage());
	}
	
	
}
