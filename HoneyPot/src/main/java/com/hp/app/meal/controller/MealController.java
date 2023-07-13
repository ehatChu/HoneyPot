package com.hp.app.meal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("meal")
public class MealController {
	@GetMapping("mmeal")
	public String mmain() {
		return "meal/mmeal";
	}
	
	@GetMapping("ameal")
	public String amain() {
		return "meal/ameal";
	}
	
	@GetMapping("mypage")
	public String mypage() {
		return "meal/mypage";
	}
}
