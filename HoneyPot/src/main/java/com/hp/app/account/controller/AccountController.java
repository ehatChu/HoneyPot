package com.hp.app.account.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.codec.json.Jackson2JsonEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.app.account.service.AccountService;
import com.hp.app.account.vo.AccountVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
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
		
		// 로그인한 회원 번호로 가계부 목록 조회
		List<AccountVo> avoList = service.list(mno,pv);
		
		if(!avoList.isEmpty()) {
			model.addAttribute("pv", pv);
		}
		model.addAttribute("avoList", avoList);
		
		return "mypage/myInfo/accountBook";
		
	}
	
	//가계부 등록
	@PostMapping("account/add")
	public String addAccount(AccountVo vo, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String writerNo = loginMember.getNo();
		vo.setWriterNo(writerNo);
		int result = service.add(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/account/list?p=1";
	}
	
	
	
	// 가계부 수정
	@RequestMapping("account/edit")
	public int edit(AccountVo vo) {
		int result = service.edit(vo);
		System.out.println(result);
		if(result != 1) {
			throw new RuntimeException();
		}
		return result;
	}
	
	// 가계부 상세 조회
	@RequestMapping("account/detail")
	@ResponseBody
	public String detail(String no) throws Exception {
		
		AccountVo vo = service.detail(no);
		ObjectMapper mapper = new ObjectMapper();
		String voJson = mapper.writeValueAsString(vo);
		
		log.info(voJson);
		return voJson;
	}

	
	
	
	
	
	
	
}










