package com.hp.app.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hp.app.chat.service.ChatService;
import com.hp.app.chat.vo.ChatRoomVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ChatController {

	private final ChatService service;
	
	// 채팅방 목록 화면
	@GetMapping("chat/list")
	public String chatList(HttpSession session, Model model) {
		
	   //MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
       //String mno = loginMember.getNo();
		String mno = "1";
       List<ChatRoomVo> voList = service.selectRoom(mno);
		
       model.addAttribute("rList", voList);
       
		return "/chat/list";
	}
	
	// 채팅방 상세 조회 화면
	@GetMapping("chat/detail")
	//@ResponseBody
	public String chatDetail(ChatRoomVo vo, Model model, HttpSession session) {

		log.info(vo.toString());
		// 받은 채팅방 번호로 채팅방 회원 목록(이름, 프로필 사진), 채팅방 이름, 사진 조회
		List<ChatRoomVo> cvoList = service.chatDetailByNo(vo);
		log.info(cvoList.toString());
		model.addAttribute("cvoList", cvoList);
		
		return "/chat/detail";
	}
	
	
}
