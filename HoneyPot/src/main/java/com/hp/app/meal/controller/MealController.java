package com.hp.app.meal.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hp.app.meal.service.MealService;
import com.hp.app.meal.vo.MealVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("meal")
@RequiredArgsConstructor
@Slf4j
public class MealController<V> {
	private final MealService ms;

	@GetMapping("mmeal")
	public String mmain(HttpSession session, Model model, @RequestParam(defaultValue = "1") int p) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/main/mmain";
		}

		int listCount = ms.getMealCnt();
		int currentPage = p;
		int pageLimit = 5;
		int boardLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<MealVo> mealList = ms.getMealList(pv);
		List<MealVo> mealListTotal = ms.getMealList();
		model.addAttribute("mealList", mealList);
		model.addAttribute("mealListTotal", mealListTotal);
		model.addAttribute("pv", pv);
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
	
	@GetMapping("breakFastApply")
	@ResponseBody
	public String applyBreakFast(@RequestParam Map<String, String> paramMap) {
		int result = ms.applyBreakFast(paramMap);
		log.info("result : {}", result);
		if (result == 0) {
			return "error";
		}
		return "success";
	}
}
