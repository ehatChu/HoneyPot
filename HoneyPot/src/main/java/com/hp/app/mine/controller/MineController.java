package com.hp.app.mine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hp.app.mine.service.MineService;
import com.hp.app.mine.vo.MineVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MineController {
	private final MineService service;
	//사유물 등록(화면)
	@GetMapping("regi/mine/mypage")
	public String regiMine() {
		return "mypage/myInfo/mine/registration";
	}
	
	//사유물 등록
	@PostMapping("mypage/register")
	public String regiMine(MineVo mvo) {
		
		int result = service.register(mvo);
		
		if(result!=1) {
			throw new RuntimeException();
		}
		return "mypage/myInfo/mine/registration";
	
	}
	
	// 사유물내역 (화면)
	@GetMapping("property-list")
	public String propertyList() {
		return "admin/member/property-list";
	}
		
}
