package com.hp.app.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("account")
public class AccountController {

	// 가계부 화면
	@GetMapping("view")
	public String account() {
		return "/mypage/accountBook";
	}
	
}
