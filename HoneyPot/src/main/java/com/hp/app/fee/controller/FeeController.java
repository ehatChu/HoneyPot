package com.hp.app.fee.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.fee.service.FeeService;
import com.hp.app.fee.vo.MemberFeeVo;

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
	public String MemberList(Model model) {
		
		// 현재 날짜 구하기
        LocalDate now = LocalDate.now();
        
        
        // 포맷 정의
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM");
        Calendar cal = Calendar.getInstance();
        //System.out.println(cal.add(Calendar.MONTH, -1));
        
        // 포맷 적용
        String thisMonth = now.format(formatter);
        
		
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
	@GetMapping(path = "fee/member/bar-chart", produces= "application/json")
	@ResponseBody
	public String getBarChart() {
		
		
		return "";
	} 
	
	//회원 납부 화면
	@GetMapping("fee/member/pay")
	public String payFee() {
		return "/mypage/myInfo/fee/pay";
	}
	
	// 관리자 조회
	@GetMapping("fee/admin")
	public String list() {
		return "/admin/fee/list";
	}
	
	// 관리자 등록
	
	
	
}
