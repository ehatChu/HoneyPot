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
			int statusNum = 0;
			
			for(MemberVo vo : nList) {
				if("N".equals(vo.getStatus())) {
					statusNum++;
				}
				sum++;
			}

			Map<String,String> memberCntMap = new HashMap<String, String>();
			
			memberCntMap.put("sum", Integer.toString(sum));
			memberCntMap.put("statusNum", Integer.toString(statusNum));
			
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
	
}
