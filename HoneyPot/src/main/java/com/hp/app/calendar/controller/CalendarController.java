package com.hp.app.calendar.controller;

import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hp.app.calendar.service.CalendarService;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class CalendarController {
	private final CalendarService service;
	
	//캘린더화면조회
	@GetMapping("calendar/schedule-list")
	public String viewCalendar() {
		return "mypage/myInfo/calendar/view";
	}
	//주민 캘린더 등록
	
	@PostMapping("calendar/regi-schedule")
	public String regiSchedule(@RequestParam Map<String,String> regiInfoMap,HttpSession session) {
		//받은 값 특히 날짜 어떻게 오는지 확인하기
		log.info("어떤형식으로 오는지 파악 이 map으로 DB에 전달 : {}",regiInfoMap);
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		regiInfoMap.put("writerNo", loginMember.getNo());
		
		int result = service.regiMemberSchedule(regiInfoMap);
		
		return "redirect:/calendar/schedule-list";
	}
	
	
	
	//이하 어드민================================
	
	//어드민 캘린더조회
	
	
	//어드민 캘린더 등록
	
}
