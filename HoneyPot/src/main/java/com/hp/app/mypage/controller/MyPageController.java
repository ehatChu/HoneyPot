package com.hp.app.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping ("mypage")
public class MyPageController {
	@GetMapping("info/calendar")
	public String viewCalendar() {
		return "mypage/myInfo/calendar/view";
	}
}
