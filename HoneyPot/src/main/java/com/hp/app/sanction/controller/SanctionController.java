package com.hp.app.sanction.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.page.vo.PageVo;
import com.hp.app.sanction.service.SanctionService;
import com.hp.app.sanction.vo.SanctionVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SanctionController {

	private final SanctionService service;
	
	// 제제내역 (화면)
	@GetMapping("admin/member/sanction-list")
	public String sanctionList(Model model, @RequestParam(defaultValue = "1") String page, @RequestParam Map<String,String> searchMap) {
		
		try {
			int listCount = service.getSanctionListCnt(searchMap);
			int currentPage = Integer.parseInt(page);
			int pageLimit = 5;
			int boardLimit = 6;
			
			PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			List<SanctionVo> sList = service.getSanctionList(pvo, searchMap);
			
			
			model.addAttribute("pvo", pvo);
			model.addAttribute("sList", sList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/member/sanction-list";
	}
	
	// 제재내역 상세 조회
	@PostMapping("admin/member/sanction-list/detail")
	@ResponseBody
	public SanctionVo getSanctionByNo(String sno) throws Exception {
		
		SanctionVo vo = service.getSanctionByNo(sno);
		
		if(vo == null) {
			throw new Exception("제재 내역 상세 조회 에러");
		}
		
		return vo;
	}
	
	// 제재내역 삭제
	@GetMapping("admin/member/sanction-list/delete")
	public String deleteSanction(String sno) throws Exception {
		
		int result = service.deleteSanction(sno);
		
		if(result != 1) {
			throw new Exception("제재내역 삭제 에러");
		}
		
		return "redirect:/admin/member/sanction-list";
	}
	
}
