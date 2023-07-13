package com.hp.app.fee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("fee")
public class FeeController {

	// 회원 조회
	@GetMapping("member")
	public String show() {
		return "/mypage/myInfo/fee/list";
	}
	
	//회원 납부 화면
	@GetMapping("member/pay")
	public String payFee() {
		return "/mypage/myInfo/fee/pay";
	}
	
	// 관리자 조회
	@GetMapping("admin")
	public String list() {
		return "/admin/fee/list";
	}
	
	// 관리자 등록
	
	
	
}
