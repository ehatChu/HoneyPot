package com.hp.app.fee.service;

import java.util.List;
import java.util.Map;

import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

public interface FeeService {
	
	// 회원 관리비 목록 조회
	List<MemberFeeVo> memberFeeList(Map<String, String> paramMap);
	
	// 회원 관리비 총 금액&납부 일자 조회
	int totalMemberFee(Map<String, String> paramMap);
	
	// 회원 관리비 당월 총 금액
	int currentFee(Map<String , String> dateVo);
	
	// 회원 관리비 전 월 총 금액
	int prevFee(Map<String , String> dateVo);
	
	// 회원 관리비 전 년 총 금액
	int yearAgoFee(Map<String , String> dateVo);
	
	// 회원 관리비 당월 카테고리 조회
	List<MemberFeeVo> thisMonth(Map<String, String> dateVo);

	// 회원 관리비 전월 카테고리 조회
	List<MemberFeeVo> prevMonth(Map<String, String> dateVo);

	// 회원 관리비 카테고리 라인 차트
	List<MemberFeeVo> oneYearFee(Map<String, String> dateVo);

	// 회원 관리비 납부 완료 시 여부
	int changePayStatus(String memberName);
	
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

	// 관리자 관리비 월별 조회
	List<AdminFeeVo> getAllFee(Map<String, String> monthMap);

	// 카테고리로 번호 가져오기
	String getCategoryNo(String categoryName);

	// 세대 별
	int insertMemberFee(MemberFeeVo feeVo);

	// 동호로 멤버 데려오기
	String getMemberNo(Map<String, String> dongHo);

	// 회원 동 조회
	List<MemberVo> getAllDong();

	// 회원 호 조회
	List<MemberVo> getAllHo();


	
	
}
