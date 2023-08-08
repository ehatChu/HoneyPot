package com.hp.app.around.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.around.service.AroundService;
import com.hp.app.around.vo.AroundEvaluationVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller 
@RequiredArgsConstructor
@RequestMapping("around")
@Slf4j
public class AroundController {
	private final AroundService as;
	
	@GetMapping("showMapBackUp")
	public String showMap() {
		return "outerFacilities/showMapBackUp";
	}
	
	
	@GetMapping("showMap")
	public String showMap(Model model, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/main/mmain";
		}
		
		List<AroundEvaluationVo> aroundList = as.getAroundList();
		List<AroundEvaluationVo> scoreList = as.getScoreList();
		List<AroundEvaluationVo> evaluationList = as.getEvaluationList();
		model.addAttribute("aroundList", aroundList);
		model.addAttribute("scoreList", scoreList);
		model.addAttribute("evaluationList", evaluationList);		
		return "outerFacilities/showMap";
	}
	
	@GetMapping("write")
	@ResponseBody
	public String writeReview(AroundEvaluationVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/main/mmain";
		}
		vo.setWriterNo(loginMember.getNo());
		
		int result = as.write(vo);
		log.info("result : {}", result);
		if (result != 1) {
			return "error";
		}
		return "success";
	}
	
	@GetMapping("enroll")
	@ResponseBody
	public String enrollFacility(AroundEvaluationVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/main/mmain";
		}

		int result = as.enrollFacility(vo);
		log.info("result : {}", result);
		if (result != 1) {
			return "error";
		}
		return "success";
	}
	
}
