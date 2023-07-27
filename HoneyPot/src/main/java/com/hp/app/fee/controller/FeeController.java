package com.hp.app.fee.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.app.account.vo.AccountVo;
import com.hp.app.fee.service.FeeService;
import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FeeController {

	private final FeeService service;
	
	
	// 회원 관리비 조회
	// 회원 grade 가 'Y' 만 조회 가능 (세대주)
	@GetMapping("fee/member")
	public String MemberList(Model model) throws Exception {
		String mno = "1";
//		// 관리비 상세 목록 조회
		List<MemberFeeVo> mfvoList= service.memberFeeList(mno);
//		log.info(mfvoList.toString());
//		// 관리비 총 금액과 납부 일자 조회
		int mTotalFee = service.totalMemberFee(mno);
//		log.info("{total : }", mTotalFee);
		model.addAttribute("mfvoList", mfvoList);
		model.addAttribute("memberTotal", mTotalFee);
		return "/mypage/myInfo/fee/list";
	}
	
	// 회원 관리비 바 차트 데이터
	@GetMapping(path = "fee/member/bar-chart", produces= "application/json")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getBarChart(MemberFeeVo vo) {
		
		String mno = "1";
		//AccountVo voCurrent = service.getBarChart(mno);
		
		// 현재 날짜
	    LocalDate currentDate = LocalDate.now();

	    // 1. 현재 달
	    String currentMonth = currentDate.format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    // 2. 현재 달 바로 이전 달
	    String previousMonth = currentDate.minusMonths(1).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    // 3. 현재 달에서 1년을 뺀 달
	    String oneYearAgo = currentDate.minusYears(1).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    
	    // 서비스 전달하고 int 값으로 받아와서 data set
	    Map<String , String> dateVo = new HashMap<String, String>();
		dateVo.put("currentMonth", currentMonth);
		dateVo.put("previousMonth", previousMonth);
		dateVo.put("oneYearAgo", oneYearAgo);
		dateVo.put("no", mno);

		int currentFee = service.currentFee(dateVo);
		int prevFee = service.prevFee(dateVo);
		int yearAgoFee = service.yearAgoFee(dateVo);
	    
		List<String> labels = new ArrayList<>();
	    List<Integer> data = new ArrayList<>();
	    
	    data.add(currentFee);
	    data.add(prevFee);
	    data.add(yearAgoFee);

	    labels.add(currentMonth);
	    labels.add(oneYearAgo);
	    labels.add(previousMonth);
	    
	    Map<String, Object> chartData = new HashMap<>();
	    chartData.put("labels", labels);
	    chartData.put("data", data);
	    chartData.put("backgroundColor", Arrays.asList("#FF7EAD", "#C0FFFB", "#A1FFA5"));
  
	    return ResponseEntity.ok(chartData);
	} 
	
	//회원 납부 조회
	// 회원 번호랑 월 데이터로 셀렉트(카테고리 이름, 가격)
	@GetMapping("fee/member/pay")
	public String payFee(Model model) {
		String mno = "1";
		// 현재 날짜
	    LocalDate currentDate = LocalDate.now();

	    // 1. 현재 달
	    String currentMonth = currentDate.format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    // 2. 현재 달 바로 이전 달
	    String previousMonth = currentDate.minusMonths(1).format(DateTimeFormatter.ofPattern("YYYY-MM"));
	    
	    // 서비스 전달하고 int 값으로 받아와서 data set
	    Map<String , String> dateVo = new HashMap<String, String>();
		dateVo.put("currentMonth", currentMonth);
		dateVo.put("previousMonth", previousMonth);
		dateVo.put("no", mno);
		log.info(dateVo.toString());
		
		// 서비스
		List<MemberFeeVo> mvoList = service.thisMonth(dateVo);
		log.info(mvoList.toString());
		//List<MemberFeeVo> pvoList = service.prevMonth(dateVo);
		//log.info(pvoList.toString());
		
		model.addAttribute("mvoList", mvoList);
		
		return "/mypage/myInfo/fee/pay";
	}
	
	// 회원 납부
	
		
	// 관리자 조회
	@GetMapping("fee/admin")
	public String AdminList(@RequestParam(name = "p", defaultValue = "1")  int p,Model model, HttpSession session,@RequestParam Map<String, String> paramMap) {
		
		int listCount = service.adminListCnt(paramMap);
		log.info("{listCount :,}", listCount);
		int CurrentPage = p;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, CurrentPage, pageLimit, boardLimit);
		
		// 로그인한 회원 번호로 가계부 목록 조회
		List<AdminFeeVo> avoList = service.adminList(pv, paramMap);
		
		log.info(avoList.toString());
		if(!avoList.isEmpty()) {
			model.addAttribute("pv", pv);
		}
		model.addAttribute("avoList", avoList);
		model.addAttribute("paramMap", paramMap);
		
		return "/admin/fee/list";
	}
	
	// 관리자 관리비 등록
	@PostMapping("fee/admin/add")
	public String addFee(AdminFeeVo vo, HttpSession session) {
		//MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		//vo.setAdminNo(loginMember.getNo());
		vo.setAdminNo("1");
		int result = service.add(vo);
		
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/fee/admin?p=1";
	}
	
	// 관리자 관리비 수정
	@PostMapping(path="fee/admin/edit")
	@ResponseBody
	public String edit(AdminFeeVo vo) {
		log.info(vo.toString());
		int result = service.edit(vo);
		log.info("result : {}", result);
		if(result != 1) {
			throw new RuntimeException();
		}
		return "success";
	}
	
	// 관리자 관리비 삭제
	@PostMapping("fee/admin/del")
	public String del(String no) {
		log.info(no);
		int result = service.delete(no);
		if(result != 1) {
			throw new RuntimeException();
		}
		return "redirect:/fee/admin?p=1";
	}
	
	
	
	
}
