package com.hp.app.point.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PointController {

	@GetMapping("mypage/act/point")
	public String myPoint() {
		return "mypage/point";
	}
	
	// 상벌점내역 (화면)
	@GetMapping("admin/member/point-list")
	public String pointList() {
		return "admin/member/point-list";
	}
	
	
}
