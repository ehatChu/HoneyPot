package com.hp.app.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping ("mypage")
public class MyPageController {
	@GetMapping("info/calendar")
	public String viewCalendar() {
		return "mypage/myInfo/calendar/view";
	}
	
	//내 게시글
	@GetMapping("act/board")
	public String myPost() {
		return "mypage/act/board";
	}
	
	//내 댓글
	@GetMapping("act/reply")
	public String myReply() {
		return "mypage/act/reply";
	}
	
	//좋아요한 글
	@GetMapping("act/like")
	public String myLike() {
		return "mypage/act/like";
	}
	
}
