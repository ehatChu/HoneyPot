package com.hp.app.fee.service;

import java.util.List;
import java.util.Map;

import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.page.vo.PageVo;

public interface FeeService {
	
	// 회원 관리비 목록 조회
	List<MemberFeeVo> memberFeeList(String mno);
	
	// 회원 관리비 총 금액&납부 일자 조회
	int totalMemberFee(String mno);
	
	// 회원 관리비 당월 총 금액
	int currentFee(Map<String , String> dateVo);
	
	// 회원 관리비 전 월 총 금액
	int prevFee(Map<String , String> dateVo);
	
	// 회원 관리비 전 년 총 금액
	int yearAgoFee(Map<String , String> dateVo);
	
	// 관리자 관리비 목록 개수 조회
	int adminListCnt(Map<String, String> paramMap);
	
	// 관리자 관리비 목록 조회
	List<AdminFeeVo> adminList(PageVo pv, Map<String , String> paramMap);
	
	// 관리자 관리비 등록
	int add(AdminFeeVo vo);
	
	// 관리지 관리비 수정
	int edit(AdminFeeVo vo);
	
	// 관리자 관리비 삭제
	int delete(String no);

	// 회원 관리비 당월 카테고리 조회
	List<MemberFeeVo> thisMonth(Map<String, String> dateVo);

	// 회원 관리비 전월 카테고리 조회
	List<MemberFeeVo> prevMonth(Map<String, String> dateVo);
	
}
