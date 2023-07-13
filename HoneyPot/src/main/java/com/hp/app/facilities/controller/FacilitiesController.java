package com.hp.app.facilities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("facilities")
public class FacilitiesController {
	@GetMapping("library/editInfo")
	public String editInfo() {
		return "admin/facilities/library-editInfo";
	}
	
	@GetMapping("library/reserve")
	public String reserve() {
		return "innerFacilities/makeLibraryReservation";
	}
	
	@GetMapping("outerFacilities/map")
	public String showMap() {
		return "outerFacilities/showMap";
	}
}
