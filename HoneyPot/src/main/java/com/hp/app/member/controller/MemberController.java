package com.hp.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.service.MemberService;
import com.hp.app.member.vo.MemberVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {
	private final MemberService service;
	
	@GetMapping("mlogin")
	public String mlogin() {
		return "member/mlogin";
	}
	
	@PostMapping("mlogin")
	public String mlogin(MemberVo vo, HttpSession session) {
		MemberVo loginMember = service.mlogin(vo);
		session.setAttribute("loginMember", loginMember);
		log.info("loginMember : {}", loginMember);
		if (loginMember == null) {
			throw new IllegalStateException("로그인 실패");
		}
		return "redirect:/main/mmain";
	}
	
	@GetMapping("alogin")
	public String alogin() {
		return "member/alogin";
	}

	@PostMapping("alogin")
	public String alogin(AdminVo vo, HttpSession session) {
		AdminVo loginAdmin = service.alogin(vo);
		session.setAttribute("loginAdmin", loginAdmin);
		log.info("loginAdmin : {}", loginAdmin);
		if (loginAdmin == null) {
			throw new IllegalStateException("관리자 로그인 실패");
		}
		return "redirect:/main/amain";
	}

	@GetMapping("mjoin")
	public String mjoin() {
		return "member/mjoin";
	}
	
	@PostMapping("mjoin")
	public String mjoin(MemberVo vo) {
		int result = service.mjoin(vo);
		log.info("result : {}", result);
		if (result != 1) {
			throw new IllegalStateException("회원가입 실패");
		}
		return "redirect:/main/mmain";
	}

	@GetMapping("ajoin")
	public String ajoin() {
		return "member/ajoin";
	}
	
	@PostMapping("ajoin")
	public String ajoin(AdminVo vo) {
		int result = service.ajoin(vo);
		log.info("result : {}", result);
		if (result != 1) {
			throw new IllegalStateException("관리자 회원가입 실패");
		}
		return "redirect:/main/amain";
	}

	@GetMapping("medit")
	public String medit() {
		return "member/medit";
	}
	
	@PostMapping("medit")
	public String medit(MemberVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		loginMember.setPwd(vo.getPwd());
		loginMember.setPhone(vo.getPhone());
		loginMember.setEmail(vo.getEmail());
		int result = service.medit(loginMember);
		log.info("result : {}", result);
		if (result != 1) {
			throw new IllegalStateException("회원 정보 수정 실패");
		}
		session.setAttribute("loginMember", loginMember);
		
		return "redirect:/main/mmain";
	}

	@GetMapping("aedit")
	public String aedit() {
		return "member/aedit";
	}
	
	@PostMapping("aedit")
	public String aedit(AdminVo vo, HttpSession session) {
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		loginAdmin.setPwd(vo.getPwd());
		loginAdmin.setName(vo.getName());
		int result = service.aedit(loginAdmin);
		log.info("result : {}", result);
		if (result != 1) {
			throw new IllegalStateException("관리자 정보 수정 실패");
		}
		session.setAttribute("loginAdmin", loginAdmin);
		
		return "redirect:/main/amain";
	}

	@GetMapping("findId")
	public String findId() {
		return "member/findId";
	}

	@GetMapping("findPwd")
	public String findPwd() {
		return "member/findPwd";
	}

	@GetMapping("changePwd")
	public String pwdChange() {
		return "member/changePwd";
	}

	@GetMapping("quit")
	public String quit() {
		return "member/quit";
	}
}
