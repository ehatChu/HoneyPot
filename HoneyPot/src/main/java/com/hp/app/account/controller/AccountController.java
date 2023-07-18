package com.hp.app.account.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.account.service.AccountService;
import com.hp.app.account.vo.AccountVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("account")
@RequiredArgsConstructor
public class AccountController {

	private final AccountService service;
	
	// 가계부 목록 조회 화면
	@GetMapping("list")
	public String list(int p, Model model, String no) {
		
		int listCount = service.list(no);
		int CurrentPage = p;
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageVo pv = new PageVo(listCount, CurrentPage, pageLimit, boardLimit);
		List<AccountVo> avoList = service.list(pv,no);
		
		model.addAttribute("avoList", avoList);
		
		return "redirect:/mypage/myInfo/accountBook";
	}
	
	
	// 가계부 등록
	@PostMapping("add")
	public String addAccount(AccountVo vo) {
		int result = service.add(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/mypage/myInfo/accountBook";
	}
	
}
