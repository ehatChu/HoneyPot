package com.hp.app.friend.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.friend.service.FriendService;
import com.hp.app.friend.vo.FriendVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FriendController {

	private final FriendService service;
	private final HttpSession session;
	
	// 회원 목록 조회
	@GetMapping("/member/friends")
	public String friend(Model model,@RequestParam Map<String,String> searchMap) {
		
		int memberCnt = service.getMemberCnt();
		List<MemberVo> mvoList = service.memberList(searchMap);
		
		model.addAttribute("memberCnt", memberCnt);
		model.addAttribute("mvoList", mvoList);
		
		return "member/friend";
	}
	
	// 회원 상세 조회
	@PostMapping("/member/friends/detail")
	@ResponseBody
	public MemberVo getMemberByNo(String mno) throws Exception {
		 MemberVo vo = service.getMemberByNo(mno);
		 if(vo == null) {
			 throw new Exception("회원 상세조회 실패");
		 }
		 
		 return vo;
	}
	
	// 친구 목록 조회
	@GetMapping("member/getFriendList")
	@ResponseBody
	public List<FriendVo> getFriendList(){
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String loginNo = loginMember.getNo();
		List<FriendVo> fvoList = service.getFriendList(loginNo);
		log.info(fvoList.toString());
		return fvoList;
	}
	
	// 팔로우, 팔로우 취소
	@PostMapping("member/friend/follow")
	@ResponseBody
	public Map<String, Object> followYn(String friendNo) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String loginNo = loginMember.getNo();
		Map<String, Object> result = new HashMap<>();
		
		FriendVo vo = new FriendVo();
		vo.setMemberNo(loginNo);
		vo.setFriendNo(friendNo);
		// 이미 친구인지 확인하기 위해 서비스의 메서드를 호출합니다.
	    boolean isFriend = service.checkFriend(loginNo,friendNo);
	    
	    // 친구인 경우와 아닌 경우에 따라 처리합니다.
	    if (isFriend) {
	        // 이미 친구인 경우, 친구 삭제 처리를 실행합니다.
	    	 int deleteResult = service.deleteFriend(vo);
	         result.put("success", deleteResult > 0);
	    } else {
	        // 친구가 아닌 경우, 친구 추가 처리를 실행합니다.
	    	int insertResult = service.addFriend(vo);
	        result.put("success", insertResult > 0);
	    }
		
		return result;
	}
	
	
}

















