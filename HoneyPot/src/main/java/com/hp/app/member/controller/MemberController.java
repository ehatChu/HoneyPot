package com.hp.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {
	@GetMapping("mlogin")
	public String mlogin() {
		return "member/mlogin";
	}

	@GetMapping("alogin")
	public String alogin() {
		return "member/alogin";
	}
	
	@GetMapping("findId")
	public String findId() {
		return "member/findId";
	}
}
