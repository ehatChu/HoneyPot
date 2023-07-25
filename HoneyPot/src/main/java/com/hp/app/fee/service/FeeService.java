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
	
	// 관리자 관리비 목록 개수 조회
	int adminListCnt(Map<String , String> searchVo);
	
	// 관리자 관리비 목록 조회
	List<AdminFeeVo> adminList(PageVo pv, Map<String , String> searchVo);
	
	// 관리자 관리비 등록
	int add(AdminFeeVo vo);
	
	// 관리자 관리비 삭제
	int delete(String no);
	
}
