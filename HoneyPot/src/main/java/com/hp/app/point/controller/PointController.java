package com.hp.app.point.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class PointController {

	@GetMapping("mypage/act/point")
	public String myPoint() {
		return "mypage/point";
	}
	
	// 상벌점내역 (화면)
	@GetMapping("point-list")
	public String pointList() {
		return "admin/member/point-list";
	}
	
	
}
