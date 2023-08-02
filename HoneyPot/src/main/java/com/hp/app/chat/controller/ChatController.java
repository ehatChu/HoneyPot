package com.hp.app.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hp.app.chat.service.ChatService;
import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatMemberVo;
import com.hp.app.chat.vo.ChatMessageVo;
import com.hp.app.chat.vo.ChatRoomVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ChatController {

	private final ChatService service;
	
	// 채팅방 목록 화면
	@GetMapping("chat/list")
	public String chatList(HttpSession session, Model model,Map<String, String> paramMap) {
		
	   //MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
       //String mno = loginMember.getNo();
	   String mno = "5";
       paramMap.put("memberNo", mno);
       List<ChatRoomVo> voList = service.selectRoom(mno);
       List<ChatFriendVo> fvoList = service.friendList(paramMap);
       model.addAttribute("rList", voList);
       model.addAttribute("fvoList", fvoList);
		return "/chat/list";
	}
	
	// 채팅방 상세 조회 화면
	@GetMapping("chat/detail")
	//@ResponseBody
	public String chatDetail(ChatRoomVo vo, Model model, HttpSession session) {

		//MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		vo.setMasterNo("1");
		log.info(vo.toString());
		// 받은 채팅방 번호로 채팅방 회원 목록(이름, 프로필 사진), 채팅방 이름, 사진 조회
		List<ChatRoomVo> cvoList = service.chatDetailByNo(vo);
		List<ChatMessageVo> mvoList = service.chatMsg(vo);
		model.addAttribute("cvoList", cvoList);
		model.addAttribute("mvoList", mvoList);
		log.info(mvoList.toString());
		return "/chat/detail";
	}
	
	// 채팅방 정보 수정
	//@PostMapping("chat/edit")
	
	// 1:1 채팅방 생성
	@PostMapping("chat/add")
    @ResponseBody
    public String createChatRoom(String friendNo, String friendName,HttpSession session) {
//        MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
//		String mno = loginMember.getNo();
        String mno = "1";
		
		Map<String , String> roomMap = new HashMap<String, String>(); 
		roomMap.put("masterNo", mno);
		roomMap.put("friendName", friendName);
		// 1. 채팅방 정보 insert
		int result = service.addChatRoom(roomMap);
		
		// 채팅방 번호 select 하기
	    ChatRoomVo vo = service.selectRoomNo(roomMap);
	    String roomNo = vo.getNo();
	    roomMap.put("no", roomNo);
	    roomMap.put("friendNo", friendNo);
	    log.info(roomMap.toString());
        // 2. 채팅방 멤버 정보 insert
	    int result2 = service.insertChatMember(roomMap);
	    System.out.println(result2);
        // 2. 채팅방 멤버 정보 insert
	    List<MemberVo> memberList = new ArrayList<MemberVo>();
	     
//	    
//	    for (Long memberNo : members) {
//        }
        
        return "Chat room created successfully!";
    }

	
	
}
