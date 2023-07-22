package com.hp.app.account.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
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

@Slf4j
@Controller
@RequiredArgsConstructor
public class AccountController {

	private final AccountService service;
	
	// 가계부 목록 조회 화면
	@GetMapping("account/list")
	public String list(int p,Model model, HttpSession session) {
		
		//MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		//String mno = loginMember.getNo();
		String mno = "5";
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
		//MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		//String writerNo = loginMember.getNo();
		vo.setWriterNo("5");
		int result = service.add(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/account/list?p=1";
	}
	
	// 가계부 수정
	@PostMapping("account/edit")
	
	public int edit(AccountVo vo) {
		int result = service.edit(vo);
		System.out.println(result);
		if(result != 1) {
			throw new RuntimeException();
		}
		return result;
	}
	
	// 가계부 상세 조회
	@GetMapping("account/detail")
	@ResponseBody
	public String detail(String no) throws Exception {
		
		AccountVo vo = service.detail(no);
		ObjectMapper mapper = new ObjectMapper();
		String voJson = mapper.writeValueAsString(vo);
		
		log.info(voJson);
		return voJson;
	}

	// 가계부 캘린더 조회
	@GetMapping(path = "account/calendar", produces= "application/json")
	@ResponseBody
	public List<Map<String,Object>> getCalendar() throws Exception {
		String mno = "5";
	    List<AccountVo> cvoList = service.calendarList(mno);

	    List<Map<String, Object>> events = new ArrayList<>();

	    for (AccountVo cvo : cvoList) {
	        Map<String, Object> event = new HashMap<>();
	        event.put("title", cvo.getPrice());
	        event.put("start", cvo.getAccountDate());
	        events.add(event);
	    }

	    log.info("events: {}", events);
	    return events;
	}
	
	// 가계부 카테고리 검색
	
	
	// 가계부 내용 검색
	
	
	// 가계부 삭제
	
	// 가계부 통계
	// 회원번호 가지고 카테고리 별 금액 통계 
	@GetMapping(path = "account/chart", produces= "application/json")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getChart() {
		String mno = "5";
		List<AccountVo> tvoList = service.getChart(mno);
		
		List<String> labels = new ArrayList<>();
	    List<Integer> data = new ArrayList<>();

	    for (AccountVo accountVo : tvoList) {
	        String categoryName = accountVo.getCategoryName();
	        int priceCnt = Integer.parseInt(accountVo.getPriceCnt());

	        labels.add(categoryName);
	        data.add(priceCnt);
	    }

	    Map<String, Object> chartData = new HashMap<>();
	    chartData.put("labels", labels);
	    chartData.put("data", data);
	    chartData.put("backgroundColor", Arrays.asList("#f56954", "#00a65a", "#f39c12", "#00c0ef", "#3c8dbc", "#d2d6de"));
  
	    return ResponseEntity.ok(chartData);
	}
	
	
	
}










