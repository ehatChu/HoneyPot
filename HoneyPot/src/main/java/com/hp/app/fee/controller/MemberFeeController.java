package com.hp.app.fee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("fee")
public class MemberFeeController {

	// 조회
	@GetMapping("member")
	public String show() {
		return "/mypage/fee";
	}
	
	
}
