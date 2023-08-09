package com.hp.app.point.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;
import com.hp.app.point.service.PointService;
import com.hp.app.point.vo.PointVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PointController {
	
	private final PointService service;

	// 회원
	// 상벌점내역 (화면)
	@GetMapping("mypage/act/point-list")
	public String myPoint(Model model, @RequestParam Map<String,String> searchMap, HttpSession session) {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			session.setAttribute("alertMsg", "로그인 후 사용할 수 있는 서비스입니다.");
			return "redirect:/member/mlogin";
		}
		
		String no = loginMember.getNo();
		
		searchMap.put("no", no);
		List<PointVo> sList = service.getMyPointListScore(no);
		
		List<PointVo> pList = service.getMyPointList(searchMap);
		
		int sumPoint = 0;
		int plusPoint = 0;
		int minusPoint = 0;
		
		for(PointVo vo : sList) {
			int score = Integer.parseInt(vo.getScore());
			if(score > 0) {
				plusPoint += score;
			}else {
				minusPoint += score;
			}
		}
		
		sumPoint = plusPoint + minusPoint;
		Map<String, String> listCnt = new HashMap<String, String>();
		
		listCnt.put("sumPoint", Integer.toString(sumPoint));
		listCnt.put("plusPoint", Integer.toString(plusPoint));
		listCnt.put("minusPoint", Integer.toString(minusPoint));
		
		model.addAttribute("listCnt", listCnt);
		model.addAttribute("pList", pList);
		
		return "mypage/point";
	}
	
	// 관리자
	// 상벌점내역 (화면)
	@GetMapping("admin/member/point-list")
	public String pointList(Model model,@RequestParam(defaultValue = "1") String page, @RequestParam Map<String,String> searchMap, HttpSession session) {
		
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		
		if(loginAdmin == null) {
			session.setAttribute("alertMsg", "관리자 로그인 후 사용할 수 있는 서비스입니다.");
			return "redirect:/member/alogin";
		}
		
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
	@ResponseBody
	public PointVo editPoint(PointVo vo, HttpSession session) throws Exception {
		
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		
		vo.setAdminNo(loginAdmin.getNo());
		
		PointVo changeVo = service.editPoint(vo);
		
		if(changeVo == null) {
			throw new Exception("상벌점 수정 실패");
		}
		
		return changeVo; 
	}
	
	
}
