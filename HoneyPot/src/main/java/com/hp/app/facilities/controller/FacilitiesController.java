package com.hp.app.facilities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("facilities")
public class FacilitiesController {
	
	@GetMapping("library/reserve")
	public String reserve() {
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

