package com.hp.app.account.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.account.service.AccountService;
import com.hp.app.account.vo.AccountVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AccountController {

	private final AccountService service;
	
	// 가계부 목록 조회 화면
	@RequestMapping("account/list")
	public String list(int p,Model model, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String mno = loginMember.getNo();
		int listCount = service.listCnt(mno);
		int CurrentPage = p;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, CurrentPage, pageLimit, boardLimit);
		log.info(pv.toString());
		System.out.println(pv.getMaxPage());
		System.out.println(pv.getListCount());
		System.out.println(pv.getStartPage());
		
		// 로그인한 회원 번호로 가계부 목록 조회
		List<AccountVo> avoList = service.list(mno,pv);
		log.info(avoList.toString());
		
		if(!avoList.isEmpty()) {
			model.addAttribute("pv", pv);
		}
		model.addAttribute("avoList", avoList);
		
		return "mypage/myInfo/accountBook";
		
	}
	
	//가계부 등록
	@PostMapping("add")
	public String addAccount(AccountVo vo) {
		int result = service.add(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/mypage/myInfo/accountBook";
	}
	
}
