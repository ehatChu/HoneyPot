package com.hp.app.facilities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.innerFac.service.InnerFacService;
import com.hp.app.innerFac.vo.InnerFacVo;

import lombok.RequiredArgsConstructor;

@Controller 
@RequestMapping("facilities")
@RequiredArgsConstructor
public class FacilitiesController {
	private final InnerFacService service;
	//예약 화면 보여주기
	@GetMapping("library/reserve")
	public String reserve(int no,Model model) {
		
		//편의시설마다 시간이 다르므로 조회해와야함.
		InnerFacVo fvo = service.getOpenCloseTime(no);
		model.addAttribute("innerFacVo",fvo);
		
		return "innerFacilities/makeLibraryReservation";
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

