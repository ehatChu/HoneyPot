package com.hp.app.facilities.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.innerFac.service.InnerFacService;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.yerin.functions.YerinFunctions;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller 
@RequestMapping("facilities")
@RequiredArgsConstructor
@Slf4j
public class FacilitiesController {
	private final InnerFacService service;
	private final YerinFunctions y;
	//예약 화면 보여주기
	//no=1이면 도서관 관련
	@GetMapping("library/reserve")
	public String reserve(int no,Model model,HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String MemberNo = loginMember.getNo();
		
		//편의시설마다 시간이 다르므로 조회해와야함. 
		InnerFacVo fvo = service.getOpenCloseTime(no);
		
		List<InnerFacRsVo> rsvList = service.getReservationByMemberNo(MemberNo);
		
		//예린함수를 거쳐서 openTime, closeTime전달...
		int opentime = y.changeInt(fvo.getOpenTime());
		int closetime = y.changeInt(fvo.getCloseTime());
		
		
		model.addAttribute("openTime",opentime);
		model.addAttribute("closeTime",closetime);
		
		return "innerFacilities/makeLibraryReservation";
	}
	
	//도서관 예약시 DB에 insert하기
	@PostMapping("reserve")
	public String reserve(String amenityNo, String date, String startTime,HttpSession session,Model model) {
		//값이 잘 전달 되는거 확인 했다
		//전달된 값으로 에약일시 구하기 두 값을 전달하여 합친 예약일시를 구하는 함수 호출 및 메서드 실행ㅇ
		
		String combinedDate = y.getCombinedDate(date,startTime);
		
		//세션에서 꺼내기 loginMember
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//RsVo에 값들 집어넣기
		InnerFacRsVo rsVo =  new InnerFacRsVo();
		rsVo.setAmenityNo(amenityNo);
		rsVo.setMemberNo(loginMember.getNo());
		rsVo.setReserveTime(combinedDate);
		
		//rsVo를 전달하면서 service호출
		int result = service.makeReservation(rsVo);
		
		if(result!=1) {
			throw new RuntimeException("rsVo를 DB에 전달하는 과정에서 에러발생");
		}
		
		//예약이 완료되었다는 표시를 해줘야하기 때문에 Model에 값을 넣어 전달 모델에 해당 시작시간을 넣자
		model.addAttribute("selectedTime",startTime);
		
		
		
		return "redirect:/facilities/library/reserve?no=1";
		
	}
	
	
	@GetMapping("outerFacilities/map")
	public String showMap() {
		return "outerFacilities/showMap";
	}
	@GetMapping("outer/review-list")
	public String reviewList() {
		return "mypage/act/reviewOuterFacilities";
	}
	
	//관리자 편의시설 정보변경
	@GetMapping("admin/library/editInfo")
	public String editInfo() {
		return "admin/facilities/library-editInfo";
	}
	
	//관리자 편의시설 관리
	@GetMapping("admin/reserve-list")
	public String manageReservation() {
		return "admin/facilities/reserveList";
	}
}

