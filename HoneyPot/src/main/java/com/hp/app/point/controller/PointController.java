package com.hp.app.point.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.page.vo.PageVo;
import com.hp.app.point.service.PointService;
import com.hp.app.point.vo.PointVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PointController {
	
	private final PointService service;

	@GetMapping("mypage/act/point")
	public String myPoint() {
		return "mypage/point";
	}
	
	// 관리자
	// 상벌점내역 (화면)
	@GetMapping("admin/member/point-list")
	public String pointList(Model model,@RequestParam(defaultValue = "1") String page, @RequestParam Map<String,String> searchMap) {
		
		int listCount = service.getPointCntAdmin(searchMap);
		int currentPage = Integer.parseInt(page);
		int pageLimit = 5;
		int boardLimit = 6;
		
		PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);

		List<PointVo> pList = service.getPointListAdmin(pvo, searchMap);
		
		model.addAttribute("pList", pList);
		model.addAttribute("searchVo", searchMap);
		model.addAttribute("pvo", pvo);
		
		return "admin/member/point-list";
	}
	
	// 상벌점 상세조회
	@PostMapping("admin/member/point-list/detail")
	@ResponseBody
	public PointVo detailPoint(String pno) throws Exception {
	
		PointVo vo = service.getPointByNo(pno);
		
		if(vo == null) {
			throw new Exception("상벌점 상세조회 실패");
		}
		
		return vo;
	}
	
	// 상벌점 내역 삭제
	@GetMapping("admin/member/point-list/delete")
	public String deletePoint(String pno) throws Exception {
		
		int result = service.deletePoint(pno);
		
		if(result != 1) {
			throw new Exception("상벌점 삭제 실패");
		}
	
		return "redirect:/admin/member/point-list";
	}
	
	// 상벌점 내역 수정
	@PostMapping("admin/member/point-list/edit")
	public PointVo editPoint(PointVo vo) throws Exception {
		
		PointVo changeVo = service.editPoint(vo);
		
		if(changeVo == null) {
			throw new Exception("상벌점 수정 실패");
		}
		
		return changeVo; 
	}
	
	
}
