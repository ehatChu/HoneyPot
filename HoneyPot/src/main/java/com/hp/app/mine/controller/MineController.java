package com.hp.app.mine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.mine.service.MineService;
import com.hp.app.mine.vo.MineVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MineController {
	private final MineService service;
	//사유물 등록(화면)
	@RequestMapping("regi/mine/mypage")
	public String regiMine() {
		return "mypage/myInfo/mine/registration";
	}
	
	//사유물 등록
	@RequestMapping("mypage/register")
	public String regiMine(MineVo mvo) {
		
		int result = service.register(mvo);
		log.info("값이 잘 전달 되고 있는지 : {}",mvo.getName());
		log.info("result : {}",result);
		if(result!=1) {
			throw new RuntimeException();
		}
		return "redirect:/regi/mine/mypage";
	
	}
	
	// 사유물내역 (화면)
	@GetMapping("property-list")
	public String propertyList() {
		return "admin/member/property-list";
	}
		
}
