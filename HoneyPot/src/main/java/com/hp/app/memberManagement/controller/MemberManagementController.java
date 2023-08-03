package com.hp.app.memberManagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hp.app.memberManagement.service.MemberManagementService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberManagementController {

	private final MemberManagementService service;
	
	// 회원조회 (화면)
	@GetMapping("admin/member/member-list")
	public String memberList() {
		return "admin/member/member-list";
	}
	
}
