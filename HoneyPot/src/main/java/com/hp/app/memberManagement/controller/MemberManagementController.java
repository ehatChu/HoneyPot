package com.hp.app.memberManagement.controller;

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
	public String memberList(Model model,@RequestParam Map<String,String> searchMap, HttpSession session) {
		
		try {
			
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
			
			if(loginAdmin == null) {
				session.setAttribute("alertMsg", "관리자 로그인 후 사용할 수 있는 서비스입니다.");
				return "redirect:/member/alogin";
			}
			
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
	public String insertPointMember(PointVo vo, HttpSession session) throws Exception {
		
		
		try {
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
			vo.setAdminNo(loginAdmin.getNo());

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
	public String stopMember(RestrictionVo vo, HttpSession session) throws Exception {

		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		
		vo.setAdminNo(loginAdmin.getNo());
		
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
	
	// 관리자
	
	// 회원조회 (화면)
	@GetMapping("admin/member/admin-list")
	public String getadminList(Model model,@RequestParam Map<String,String> searchMap, HttpSession session) {
		
		try {
			
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
			
			if(loginAdmin == null) {
				session.setAttribute("alertMsg", "관리자 로그인 후 사용할 수 있는 서비스입니다.");
				return "redirect:/member/alogin";
			}
			
			if(!"M".equals(loginAdmin.getGrade())) {
				session.setAttribute("alertMsg", "관리소장만 사용할 수 있는 서비스입니다.");
				return "redirect:/main/amain";
			}
			List<AdminVo> nList = service.getAdminListCnt(searchMap);
			List<AdminVo> aList = service.getAdminList(searchMap);
			
			int sum = 0;
			int statusN = 0;
			int statusS = 0;
			int gradeD = 0;
			int gradeS = 0;
			
			for(AdminVo vo : nList) {
				if("N".equals(vo.getStatus())) {
					statusN++;
				}else if("S".equals(vo.getStatus())) {
					statusS++;
				}
				
				if("D".equals(vo.getGrade())) {
					gradeD++;
				}else if("S".equals(vo.getGrade())) {
					gradeS++;
				}
				sum++;
			}
			
			Map<String,String> adminCntMap = new HashMap<String, String>();
			
			adminCntMap.put("sum", Integer.toString(sum));
			adminCntMap.put("statusN", Integer.toString(statusN));
			adminCntMap.put("statusS", Integer.toString(statusS));
			adminCntMap.put("gradeD", Integer.toString(gradeD));
			adminCntMap.put("gradeS", Integer.toString(gradeS));
			
			model.addAttribute("searchMap", searchMap);
			model.addAttribute("adminCntMap", adminCntMap);
			model.addAttribute("aList",aList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/member/admin-list";
	}
	
	// 관리자 상세 조회
	@PostMapping("admin/member/admin-list/detail")
	@ResponseBody
	public AdminVo getAdminByNo(String ano) throws Exception {
		AdminVo vo = service.getAdminByNo(ano);
		
		if(vo == null) {
			throw new Exception("관리자 상세조회 에러");
		}
		
		return vo;
	}
	
	// 관리자 회원 정지
	@PostMapping("admin/member/admin-list/delete")
	public String deleteAdmin(String ano) throws Exception {
		int result = service.deleteAdmin(ano);
		
		if(result != 1) {
			throw new Exception("관리자 삭제 에러");
		}
		
		return "redirect:/admin/member/admin-list";
		
	}
	
	// 관리자 회원 정지
	@PostMapping("admin/member/admin-list/stop")
	public String stopAdmin(String ano) throws Exception {
		int result = service.stopAdmin(ano);
		
		if(result != 1) {
			throw new Exception("관리자 정지 에러");
		}
		
		return "redirect:/admin/member/admin-list";
		
	}
	
	// 관리자 정규 등록
	@PostMapping("admin/member/admin-list/regular")
	public String regularAdmin(String ano) throws Exception {
		int result = service.regularAdmin(ano);
	
		if(result != 1) {
			throw new Exception("정규 관리자 등록 에러");
		}
		
		return "redirect:/admin/member/admin-list";
		
	}
	
	
}
