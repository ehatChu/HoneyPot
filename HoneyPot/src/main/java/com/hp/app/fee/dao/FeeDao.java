package com.hp.app.fee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.fee.vo.MemberFeeVo;

public interface FeeDao {

	// 회원 관리비 조회
	List<MemberFeeVo> memberFeeList(SqlSessionTemplate sst, String mno);
	
	// 회원 관리비 총 금액 조회
	int totalMemberFee(SqlSessionTemplate sst, String mno);
}
