package com.hp.app.fee.controller;

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
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.account.vo.AccountVo;
import com.hp.app.fee.service.FeeService;
import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class FeeController {

	private final FeeService service;
	
	// 회원 관리비 조회
	// 회원 grade 가 'Y' 만 조회 가능 (세대주)
	@RequestMapping("fee/member")
	public String MemberList(Model model) throws Exception {
		String mno = "1";
		// 관리비 상세 목록 조회
		List<MemberFeeVo> mfvoList= service.memberFeeList(mno);
		log.info(mfvoList.toString());
		// 관리비 총 금액과 납부 일자 조회
		int mTotalFee = service.totalMemberFee(mno);
		System.out.println(mTotalFee);
		model.addAttribute("mfvoList", mfvoList);
		model.addAttribute("memberTotal", mTotalFee);
		return "/mypage/myInfo/fee/list";
	}
	
	// 회원 관리비 바 차트 데이터
//	@GetMapping(path = "fee/member/bar-chart", produces= "application/json")
//	@ResponseBody
//	public ResponseEntity<Map<String,Object>> getBarChart() {
//		
//		String mno = "1";
//		//AccountVo voCurrent = service.getBarChart(mno);
//		
//		List<String> labels = new ArrayList<>();
//	    List<Integer> data = new ArrayList<>();

	    //for (AccountVo accountVo : tvoList) {
	       // String categoryName = accountVo.getCategoryName();
//	        int priceCnt = Integer.parseInt(accountVo.getPriceCnt());
//
//	        labels.add(categoryName);
//	        data.add(priceCnt);
//	    }
//
//	    Map<String, Object> chartData = new HashMap<>();
//	    chartData.put("labels", labels);
//	    chartData.put("data", data);
//	    chartData.put("backgroundColor", Arrays.asList("#FF7EAD", "#C0FFFB", "#A1FFA5", "#E7FFB5", "#FFC397", "#47C4EC","#FB92E4","#5F9961"));
//  
//	    return ResponseEntity.ok(chartData);
	//} 
	
	//회원 납부 화면
	@GetMapping("fee/member/pay")
	public String payFee() {
		return "/mypage/myInfo/fee/pay";
	}
	
	// 관리자 조회
	@GetMapping("fee/admin")
	public String AdminList(@RequestParam(name = "p", defaultValue = "1")  int p,Model model, HttpSession session,@RequestParam(name = "searchValue", required = false) String searchValue,@RequestParam(name = "searchType", required = false) String searchType) {
		
		Map<String , String> searchVo = new HashMap<String, String>();
		searchVo.put("searchType", searchType);
		searchVo.put("searchValue", searchValue);
		//searchVo.put("yearMonth", yearMonth);
		
		int listCount = service.adminListCnt(searchVo);
		log.info("{listCount :,}", listCount);
		int CurrentPage = p;
		int pageLimit = 5;
		int boardLimit = 10;
		PageVo pv = new PageVo(listCount, CurrentPage, pageLimit, boardLimit);
		
		// 로그인한 회원 번호로 가계부 목록 조회
		List<AdminFeeVo> avoList = service.adminList(pv, searchVo);
		
		log.info(avoList.toString());
		if(!avoList.isEmpty()) {
			model.addAttribute("pv", pv);
		}
		model.addAttribute("avoList", avoList);
		model.addAttribute("searchVo", searchVo);
		
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
