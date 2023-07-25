package com.hp.app.fee.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.page.vo.PageVo;

public interface FeeDao {

	// 회원 관리비 조회
	List<MemberFeeVo> memberFeeList(SqlSessionTemplate sst, String mno);
	
	// 회원 관리비 총 금액 조회
	int totalMemberFee(SqlSessionTemplate sst, String mno);
	
	// 관리자 관리비 목록 개수 조회
	int adminListCnt(SqlSessionTemplate sst, Map<String , String> searchVo);
	
	// 관리자 관리비 목록 조회
	List<AdminFeeVo> adminList(SqlSessionTemplate sst, PageVo pv, Map<String , String> searchVo);
	
	// 관리자 관리비 등록
	int add(SqlSessionTemplate sst, AdminFeeVo vo);

	// 관리자 관리비 삭제
	int delete(SqlSessionTemplate sst, String no);
}
