package com.hp.app.chat.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	public String chatList(HttpSession session, Model model, String searchValue) {
	   MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
       String mno = loginMember.getNo();
//	   String mno = "1";
       List<ChatRoomVo> voList = service.selectRoom(mno);
	   Map<String , String> paramMap = new HashMap<String, String>();
	   paramMap.put("memberNo", mno);
	   paramMap.put("searchValue", searchValue);
	   List<ChatFriendVo> fvoList = service.friendList(paramMap);
       model.addAttribute("rList", voList);
       model.addAttribute("fvoList",fvoList);
       return "/chat/list";
	}
	
	@GetMapping("chat/search")
	@ResponseBody
	public List<ChatFriendVo> getFreind(HttpSession session, Model model, String searchValue){
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
	       String mno = loginMember.getNo();
		   Map<String , String> paramMap = new HashMap<String, String>();
		   paramMap.put("memberNo", mno);
		   paramMap.put("searchValue", searchValue);
		   List<ChatFriendVo> fvoList = service.friendList(paramMap);
		return fvoList;
	}
	
	// 채팅방 상세 조회 화면
	@GetMapping("chat/detail/content")
	@ResponseBody
	public List<ChatRoomVo> chatDetail(ChatRoomVo vo, Model model, HttpSession session) {
		// 받은 채팅방 번호로 채팅방 회원 목록(이름, 프로필 사진), 채팅방 이름, 사진 조회
		List<ChatRoomVo> cvoList = service.chatDetailByNo(vo);
		return cvoList;
	}
	
	
	// 1:1 채팅방 생성
	@PostMapping("chat/add")
    @ResponseBody
    public String createChatRoom(@RequestBody String friendNo,HttpSession session) throws Exception {
        MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String mno = loginMember.getNo();
        String fno = friendNo.substring(friendNo.lastIndexOf("=")+1);
        // 친구 번호로 이름 가져오기
        String memberName = service.getFriendName(fno);
        System.out.println(memberName);
		Map<String , String> roomMap = new HashMap<String, String>(); 
		roomMap.put("masterNo", mno);
		roomMap.put("friendNo", fno);
		roomMap.put("roomName", memberName);
		
		// 1. 채팅방 정보 insert
		int result = service.addChatRoom(roomMap);
		System.out.println(result);
		// 채팅방 번호 select 하기
	    ChatRoomVo vo = service.selectRoomNo(roomMap);
	    String roomNo = vo.getNo();
	    log.info(roomNo);
	    roomMap.put("no", roomNo);
	    
        // 2. 채팅방 멤버 정보 insert
	    int result2 = service.insertChatMember(roomMap);
	    System.out.println(result2);
       
	    if(result == 1 &&  result2 == 2 ) {
	    	return "success";
	    }
	    throw new Exception("실패..");
    }
	
	// 채팅방 나가기
	@PostMapping("chat/delete")
	@ResponseBody
	public String quit(String roomNo, HttpSession session) {
		Map<String , String> roomMap = new HashMap<String, String>(); 
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String mno = loginMember.getNo();
		roomMap.put("memberNo", mno);
		roomMap.put("roomNo", roomNo);
		int result = service.quit(roomMap);
		
		return "success";
	}
	
	// 채팅 메세지 조회 (안 읽은 거)
	// 로그인 한 회원의 채팅 방들의send_time 과 read_time 조회 
	// send_time > read_time 인 메세지 내용과 보낸 사람, 시간 조회
	@GetMapping("chat/unreadMsg")
	@ResponseBody
	public List<ChatMessageVo> getAllLastMessages(HttpSession session) throws Exception {
		Map<String, ChatMessageVo> lastMessagesMap = null;
		List<ChatMessageVo> cmList = null;
		try {
			  MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
			    String memberNo = loginMember.getNo();
			    
			    // 현재 로그인한 회원이 참여하고 있는 모든 채팅방 목록 조회
			    List<ChatRoomVo> chatRooms = service.selectRoom(memberNo);
			    log.info(chatRooms.toString());
			    
			    // 각 채팅방마다 마지막 메시지와 읽음 상태를 저장할 맵 만들기
			    for (ChatRoomVo chatRoom : chatRooms) {
			        String roomNo = chatRoom.getNo();
			        Map<String , String> memberAndRoom = new HashMap<String, String>();
			        memberAndRoom.put("roomNo", roomNo);
			        memberAndRoom.put("memberNo", memberNo);
			        
			        // 로그인한 회원의 최근 읽은 시간 가져오기
			        String loginMemReadTime = service.getLastReadTime(memberAndRoom);
			        log.info(loginMemReadTime);
			        // 채팅방의 상대방 최근 읽은 시간 가져오기
			        String friendReadTime = service.getFLastReadTime(memberAndRoom);
			        log.info(friendReadTime);
			        memberAndRoom.put("friendReadTime", friendReadTime);
			        memberAndRoom.put("loginMemReadTime", loginMemReadTime);
			        
			        // 저 시간들을 기간으로 잡고 그 사이에 있는 메세지 목록 다 불러오기
			        cmList = service.getUnreadMsg(memberAndRoom);
			        log.info(cmList.toString());
			    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cmList;
	}
}