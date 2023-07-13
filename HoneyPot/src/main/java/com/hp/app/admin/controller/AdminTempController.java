package com.hp.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminTempController {

	// 제제내역 (화면)
	@GetMapping("sanction-list")
	public String sanctionList() {
		return "admin/member/sanction-list";
	}
	
	// 회원조회 (화면)
	@GetMapping("member-list")
	public String memberList() {
		return "admin/member/member-list";
	}
	
	// 상벌점내역 (화면)
	@GetMapping("point-list")
	public String pointList() {
		return "admin/member/point-list";
	}
	
	// 사유물내역 (화면)
	@GetMapping("property-list")
	public String propertyList() {
		return "admin/member/property-list";
	}
	
}
