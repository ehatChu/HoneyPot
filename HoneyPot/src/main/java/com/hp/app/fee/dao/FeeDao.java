package com.hp.app.fee.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.page.vo.PageVo;

public interface FeeDao {

	// 회원 관리비 조회
	List<MemberFeeVo> memberFeeList(SqlSessionTemplate sst, Map<String, String> paramMap);
	
	// 회원 관리비 총 금액 조회
	int totalMemberFee(SqlSessionTemplate sst, Map<String, String> mfMap);
	
	// 회원 관리비 당월 총 금액
	int currentFee(SqlSessionTemplate sst, Map<String, String> dateVo);
	
	// 회원 관리비 전 월 총 금액
	int prevFee(SqlSessionTemplate sst,Map<String, String> dateVo);
	
	// 회원 관리비 전 년 총 금액
	int yearAgoFee(SqlSessionTemplate sst,Map<String, String> dateVo);

	// 관리자 관리비 목록 개수 조회
	int adminListCnt(SqlSessionTemplate sst, Map<String , String> paramMap);
	
	// 관리자 관리비 목록 조회
	List<AdminFeeVo> adminList(SqlSessionTemplate sst, PageVo pv, Map<String , String> paramMap);
	
	// 관리자 관리비 등록
	int add(SqlSessionTemplate sst, AdminFeeVo vo);

	// 관리자 관리비 삭제
	int delete(SqlSessionTemplate sst, String no);

	// 관리자 수정
	int edit(SqlSessionTemplate sst, AdminFeeVo vo);

	// 회원 납부 관리비 당월 조회
	List<MemberFeeVo> thisMonth(SqlSessionTemplate sst ,Map<String, String> dateVo);

	// 회원 납부 관리비 전월 조회
	List<MemberFeeVo> prevMonth(SqlSessionTemplate sst, Map<String, String> dateVo);

	// 회원 카테고리 라인 차트
	List<MemberFeeVo> oneYearFee(SqlSessionTemplate sst, Map<String, String> dateVo);

	// 납부 완료 시 여부 전환
	int changePayStatus(SqlSessionTemplate sst, String memberName);

	
}
