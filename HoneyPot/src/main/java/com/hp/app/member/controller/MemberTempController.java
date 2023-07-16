package com.hp.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberTempController {

	@GetMapping("myactivity/point")
	public String myPoint() {
		return "mypage/point";
	}
	
	@GetMapping("friends")
	public String friend() {
		return "member/friend";
	}
	
}
