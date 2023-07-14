package com.hp.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {
	@GetMapping("mlogin")
	public String mlogin() {
		return "member/mlogin";
	}

	@GetMapping("alogin")
	public String alogin() {
		return "member/alogin";
	}

	@GetMapping("mjoin")
	public String mjoin() {
		return "member/mjoin";
	}

	@GetMapping("ajoin")
	public String ajoin() {
		return "member/ajoin";
	}

	@GetMapping("medit")
	public String medit() {
		return "member/medit";
	}

	@GetMapping("aedit")
	public String aedit() {
		return "member/aedit";
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
