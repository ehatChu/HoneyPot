package com.hp.app.csc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("csc")
public class CSCController {

	// 회원
	
	// FAQ 조회(화면)
	@GetMapping("faq")
	public String getListFAQ() {
		return "csc/member/faq";
	}
	
	// 문의하기(화면)
	@GetMapping("inquiry")
	public String inquiry() {
		return "csc/member/inquiry";
	}
	
	// 신고하기(화면)
	@GetMapping("report")
	public String report() {
		return "csc/member/report";
	}
	
	// 문의목록 (화면)
	@GetMapping("inquiry-list")
	public String inquiryList() {
		return "csc/member/inquiry-list";
	}
	
	// 신고목록 (화면)
	@GetMapping("report-list")
	public String reportList() {
		return "csc/member/report-list";
	}
	
	// 관리자
	
	// 1대1 상담내역(화면)
	@GetMapping("admin/inquiry-list")
	public String adminInquiryList() {
		return "csc/admin/inquiry-list";
	}
	
	// 신고내역(화면)
	@GetMapping("admin/report-list")
	public String adminReportList() {
		return "csc/admin/report-list";
	}
	
	// 제재내역(화면)
	@GetMapping("admin/faq")
	public String adminFAQ() {
		return "csc/admin/faq";
	}
	
}
