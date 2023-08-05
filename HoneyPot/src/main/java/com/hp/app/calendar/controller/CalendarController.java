package com.hp.app.calendar.controller;

import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hp.app.admin.vo.AdminVo;
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
	@GetMapping("admin/calendar/schedule-list")
	public String viewAdminCalendar() {
		//관리소장은 모든 동의 일정을 볼 수 있다.
		
		//일반회원은 본인이 속한 동대표가 작성한 일정과 관리소장의 일정을 아파트일정으로 볼 수 있다.
		
		
		return "admin/member/AdminCalendar-list";
	}
	
	//어드민 캘린더 등록
	@PostMapping("admin/calendar/regi-schedule")
	public String regiScheduleAdmin(@RequestParam Map<String,String> regiInfoMap,HttpSession session) {
		//받은 값 특히 날짜 어떻게 오는지 확인하기
		log.info("어떤형식으로 오는지 파악 이 map으로 DB에 전달 : {}",regiInfoMap);
		
		AdminVo loginAdmin = (AdminVo)session.getAttribute("loginAdmin");
		log.info("grede : {}",loginAdmin.getGrade());
		//로그인멤버의 등급이 D와 M만 글을 쓸 수 있다.
		if(loginAdmin.getGrade().equals("S")) {
			throw new RuntimeException();
		}
		
		
		regiInfoMap.put("writerNo", loginAdmin.getNo());
		log.info("map : {}",regiInfoMap);
		int result = service.regiAdminSchedule(regiInfoMap);
		
		return "redirect:/admin/calendar/schedule-list";
	}
	
	
}
