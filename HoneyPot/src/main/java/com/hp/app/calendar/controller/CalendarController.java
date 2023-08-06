package com.hp.app.calendar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.app.admin.vo.AdminVo;
import com.hp.app.calendar.service.CalendarService;
import com.hp.app.calendar.vo.AllCalendarVo;
import com.hp.app.calendar.vo.MemberCalendarVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.yerin.functions.YerinFunctions;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class CalendarController {
	private final CalendarService service;
	private final YerinFunctions y;
	//캘린더화면조회
	@GetMapping("calendar/schedule-list")
	public String viewCalendar() throws Exception {
		//일반회원은 본인이 속한 동대표가 작성한 일정과 관리소장의 일정을 아파트일정으로 볼 수 있다.
//		List<String> middleDays = y.getMiddleDays("2023-08-31", "2023-09-01");
//		log.info("middleDays :{}",middleDays);
		
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
	
	//ajax아파트 일정 조회 json형식으로..일단 문자만이라도보이게 
	@PostMapping(produces ="application/json; charset=UTF-8",value = "calendar/apart-schedule")
	@ResponseBody
	public String getNoticeCal(String selectedDate,HttpSession session) throws IOException {
		//날짜가공 뒤에 (목)짜르기
		selectedDate = selectedDate.substring(0, 10);
		
		log.info("selectedDate : {}",selectedDate);
		//로그인멤버의 호수 
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String dongNum = loginMember.getDongNum();
		
		//101 -> 101동대표
		dongNum = dongNum+"동대표";
		
		//맵생성
		Map<String,String> infoMap = new HashMap<String, String>();
		infoMap.put("selectedDate", selectedDate);
		infoMap.put("dongNum", dongNum);
		
		log.info("내가 어떤 정보를 넘기면서 ajax를 호출했는지 : {}",infoMap);
		
		//아파트 일정 들고오자~~~~~
		List<NoticeCalendarVo> noticeList =service.getNoticeCal(infoMap);
		
		log.info("noticeList : {}",noticeList);
		
		ObjectMapper om = new ObjectMapper();
		String noticeJsonStr = om.writeValueAsString(noticeList);
		
		return noticeJsonStr;
		
	}
	
	//ajax로 개인일정 추가하기 문자표시
	@PostMapping(produces ="application/json; charset=UTF-8",value = "calendar/personal-schedule")
	@ResponseBody
	public String getPersonalCal(String selectedDate,HttpSession session) throws IOException {
		//데이터 보내기 selectedDate, memberNo
		Map<String,String> infoMap = new HashMap<String, String>();
		selectedDate = selectedDate.substring(0, 10);
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo =loginMember.getNo();
		
		infoMap.put("selectedDate", selectedDate);
		infoMap.put("memberNo", memberNo);
		
		//서비스호출
		List<AllCalendarVo> personalList= service.getPersonalCal(infoMap);
		
		ObjectMapper om = new ObjectMapper();
		
		String personalJsonStr = om.writeValueAsString(personalList);
		
		return personalJsonStr;
		
	}
	
	
	
	//달력에 모든 스케줄 보여주기 (개인)
	@PostMapping("calendar/represent-schedule")
	@ResponseBody
	public String representSchedule(Model model,HttpSession session) throws Exception {
		log.info("캘린더통싯성공");
		//로그인멤버에서 dong추출해서 +"동대표"한 String 넘기기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String dongName = loginMember.getDongNum()+"동대표";
		String memberNo = loginMember.getNo();
		
		
		List<AllCalendarVo> allMemberSchedule = new ArrayList<>(); 
		List<AllCalendarVo> noticeList = service.getAllNoticeCalByDong(dongName);
		
		List<AllCalendarVo> personalList = service.getAllMemberCalByPerson(memberNo);
		allMemberSchedule.addAll(noticeList);
		allMemberSchedule.addAll(personalList);
		log.info("all : {}",allMemberSchedule);
		
		ObjectMapper om = new ObjectMapper();
		String all = om.writeValueAsString(allMemberSchedule);
		
		
		return all;
	}
	
	//개인스케줄 삭제
	@GetMapping("calendar/delete-personal")
	public String deletePersonal(String sNum) {
		//sNum삭제
		int result = service.deletePersonal(sNum);
		
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
