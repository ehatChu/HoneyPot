package com.hp.app.fee.service;

import java.util.List;

import com.hp.app.fee.vo.MemberFeeVo;

public interface FeeService {
	
	// 회원 관리비 목록 조회
	List<MemberFeeVo> memberFeeList(String mno);
	
	// 회원 관리비 총 금액&납부 일자 조회
	int totalMemberFee(String mno);
}
