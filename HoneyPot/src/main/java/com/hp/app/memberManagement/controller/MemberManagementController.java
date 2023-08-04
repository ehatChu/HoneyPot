package com.hp.app.memberManagement.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.memberManagement.service.MemberManagementService;
import com.hp.app.point.vo.PointVo;
import com.hp.app.restriction.vo.RestrictionVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberManagementController {

	private final MemberManagementService service;
	
	// 회원조회 (화면)
	@GetMapping("admin/member/member-list")
	public String memberList(Model model,@RequestParam Map<String,String> searchMap) {
		
		try {
			List<MemberVo> nList = service.getMemberListCnt(searchMap);
			List<MemberVo> mList = service.getMemberList(searchMap);
			
			int sum = 0;
			int statusN = 0;
			int statusS = 0;
			
			for(MemberVo vo : nList) {
				if("N".equals(vo.getStatus())) {
					statusN++;
				}else if("S".equals(vo.getStatus())) {
					statusS++;
				}
				sum++;
			}
			
			Map<String,String> memberCntMap = new HashMap<String, String>();
			
			memberCntMap.put("sum", Integer.toString(sum));
			memberCntMap.put("statusN", Integer.toString(statusN));
			memberCntMap.put("statusS", Integer.toString(statusS));
			
			model.addAttribute("searchMap", searchMap);
			model.addAttribute("memberCntMap", memberCntMap);
			model.addAttribute("mList",mList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/member/member-list";
	}
	
	// 회원 상세조회
	@PostMapping("admin/member/member-list/detail")
	@ResponseBody
	public MemberVo detailMember(String mno) throws Exception {
	
		MemberVo vo = service.getMemberByNo(mno);
		
		if(vo == null) {
			throw new Exception("회원 상세 조회 에러");
		}
		
		return vo; 
	}
	
	// 회원 상벌점 부여
	@PostMapping("admin/member/member-list/point")
	@ResponseBody
	public String insertPointMember(PointVo vo) throws Exception {
		
		try {
			vo.setAdminNo("1");

			int result = service.insertPointMember(vo);
			
			if(result != 1) {
				throw new Exception("회원 상벌점 부여 에러");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "sccuess";
		
	}
	
	// 회원 정지
	@PostMapping("admin/member/member-list/stop")
	@ResponseBody
	public String stopMember(RestrictionVo vo) throws Exception {
		
		vo.setAdminNo("1");
		
		int result = service.stopMember(vo);
	
		if(result != 1) {
			throw new Exception("회원 정지 에러");
		}
		
		return "sccuess";
	}
	
	// 회원 삭제
	@PostMapping("admin/member/member-list/delete")
	public String deletMember(String mno) throws Exception {
	
		int result = service.deleteMember(mno);
		
		if(result != 1) {
			throw new Exception("회원 탈퇴 에러");
		}
		
		return "redirect:/admin/member/member-list";
	}
	
	// 정규 회원 등록
	@PostMapping("admin/member/member-list/regular")
	public String regularMember(String mno) throws Exception {
		int result = service.regularMember(mno);

		if(result != 1) {
			throw new Exception("정규 회원 등록 에러");
		}
		
		return "redirect:/admin/member/member-list";
		
	}
	
}
