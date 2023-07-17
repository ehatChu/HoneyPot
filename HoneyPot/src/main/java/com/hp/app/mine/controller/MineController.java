package com.hp.app.mine.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class MineController {
	//사유물 등록
	@GetMapping("regi/mine/mypage")
	public String regiMine() {
		return "mypage/myInfo/mine/registration";
	}
	
	// 사유물내역 (화면)
	@GetMapping("property-list")
	public String propertyList() {
		return "admin/member/property-list";
	}
		
}
