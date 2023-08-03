package com.hp.app.memberManagement.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.member.vo.MemberVo;

public interface MemberManagementDao {

	// 회원
	// 일반 회원 전체 갯수
	List<MemberVo> getMemberListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);
	
	// 일반 회원 조회
	List<MemberVo> getMemberList(SqlSessionTemplate sst, Map<String,String> searchMap);
	
	// 일반 회원 상세 조회
	MemberVo getMemberByNo(SqlSessionTemplate sst, String mno);
	
	// 일반 회원 삭제
	int deleteMember(SqlSessionTemplate sst, String mno);
	
	// 일반 회원 상벌점 주기
	int insertPointMember(SqlSessionTemplate sst, String mno);
	
}
