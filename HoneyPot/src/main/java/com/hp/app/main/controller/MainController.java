package com.hp.app.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class MainController {
	@GetMapping("mmain")
	public String mmain() {
		return "main/mmain";
	}
	
	@GetMapping("amain")
	public String amain() {
		return "main/amain";
	}
}
