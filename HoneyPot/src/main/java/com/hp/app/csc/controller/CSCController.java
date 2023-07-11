package com.hp.app.csc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("csc")
public class CSCController {

	// FAQ 조회(화면)
	@GetMapping("faq")
	public String getListFAQ() {
		return "csc/faq";
	}
	
	// 문의하기(화면)
	@GetMapping("inquiry")
	public String inquiry() {
		return "csc/inquiry";
	}
	
	// 신고하기(화면)
	@GetMapping("report")
	public String report() {
		return "csc/report";
	}
	
	// 문의목록 (화면)
	@GetMapping("inquiry-list")
	public String inquiryList() {
		return "csc/inquiry-list";
	}
	
	// 신고목록 (화면)
	@GetMapping("report-list")
	public String reportList() {
		return "csc/report-list";
	}
	
}
