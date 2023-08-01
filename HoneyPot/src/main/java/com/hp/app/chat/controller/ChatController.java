package com.hp.app.chat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hp.app.chat.service.ChatService;
import com.hp.app.chat.vo.ChatFriendVo;
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
	public String chatList(HttpSession session, Model model,Map<String, String> paramMap) {
		
	   //MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
       //String mno = loginMember.getNo();
	   String mno = "1";
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
		log.info(cvoList.toString());
		model.addAttribute("cvoList", cvoList);
		
		return "/chat/detail";
	}
	
	// 채팅방 정보 수정
	//@PostMapping("chat/edit")
	
	// 1:1 채팅방 생성
	@GetMapping("chat/add")
	@ResponseBody
    public String createChat(ChatRoomVo room, String memberName, HttpSession session){
        
		
        UserMaster m = pService.getProductDetail(masterNickname);
        
        room.setUserEmail(userEmail);
        room.setUserName(userName);
        room.setMasterEmail(m.getEmail());
        room.setMasterName(m.getmNickname());
        room.setMasterPic(m.getmProPicRe());
 
        ChatRoom exist  = cService.searchChatRoom(room);
        
        // DB에 방이 없을 때
        if(exist == null) {
            System.out.println("방이 없다!!");
            int result = cService.createChat(room);
            if(result == 1) {
                System.out.println("방 만들었다!!");
                return "new";
            }else {
                return "fail";
            }
        }
        // DB에 방이 있을 때
        else{
            System.out.println("방이 있다!!");
            return "exist";
        }
    }

	
	
}
