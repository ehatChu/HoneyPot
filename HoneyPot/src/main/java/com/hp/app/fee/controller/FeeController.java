package com.hp.app.fee.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.hp.app.fee.service.FeeService;
import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
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
	
	// 회원 관리비 라인 차트 데이터
		@GetMapping(path = "fee/member/line-chart", produces= "application/json")
		@ResponseBody
		public ResponseEntity<Map<String,Object>> getLineChart(MemberFeeVo vo) {
			
			String mno = "1";
			//AccountVo voCurrent = service.getBarChart(mno);
			// 현재 날짜
		    LocalDate currentDate = LocalDate.now();
		    // 1. 현재 달
		    String currentYear = currentDate.format(DateTimeFormatter.ofPattern("YYYY"));
		    // 서비스 전달하고 int 값으로 받아와서 data set
		    Map<String , String> dateVo = new HashMap<String, String>();
			dateVo.put("currentYear", currentYear);
			dateVo.put("no", mno);

			List<MemberFeeVo> cfList = service.oneYearFee(dateVo);
		    
			List<String> labels = new ArrayList<>();
			List<String> data = new ArrayList<>();
			for(MemberFeeVo cvo : cfList) {
				labels.add(cvo.getPaymentDate());
				data.add(cvo.getTotalPrice());
			}
			
			
			Map<String, Object> chartData = new HashMap<>();
			
			chartData.put("labels", labels);
			chartData.put("data", data);
			chartData.put("backgroundColor", Arrays.asList("#FF7EAD", "#C0FFFB", "#A1FFA5", "#E7FFB5", "#FFC397", "#47C4EC","#FB92E4","#5F9961"));
			
			return ResponseEntity.ok(chartData);
	  
		} 
	
	
	
	
	//회원 납부 조회
	// 회원 번호랑 월 데이터로 셀렉트(카테고리 이름, 가격)
	@GetMapping("fee/member/pay")
	public String payFee(Model model) throws Exception {
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
		
		// 서비스
		List<MemberFeeVo> mvoList = service.thisMonth(dateVo);
		log.info(mvoList.toString());
		
		// 총 금액
		int totalPrice = service.currentFee(dateVo);
		
		List<MemberFeeVo> currentMonthData = new ArrayList<>();
		List<MemberFeeVo> previousMonthData = new ArrayList<>();

		// 당월 , 전월에 해당하는 데이터를 분리하여 리스트에 추가
		for (MemberFeeVo memberFeeVo : mvoList) {
		    if (memberFeeVo.getPaymentDate().equals(currentMonth)) {
		        currentMonthData.add(memberFeeVo);
		    } else if (memberFeeVo.getPaymentDate().equals(previousMonth)) {
		        previousMonthData.add(memberFeeVo);
		    }
		}
		
	    model.addAttribute("currentMonthData", currentMonthData);
	    model.addAttribute("previousMonthData", previousMonthData);
	    model.addAttribute("mvoList", mvoList);
	    model.addAttribute("totalPrice", totalPrice);
	    
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
