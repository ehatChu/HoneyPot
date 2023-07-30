package com.hp.app.meal.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.meal.service.MealService;
import com.hp.app.meal.vo.MealVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("meal")
@RequiredArgsConstructor
@Slf4j
public class MealController {
	private final MealService ms;
	
	@GetMapping("mmeal")
	public String mmain(HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/main/mmain";
		}
		
		List<MealVo> mealList = ms.getMealList();
		model.addAttribute("mealList", mealList);
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
