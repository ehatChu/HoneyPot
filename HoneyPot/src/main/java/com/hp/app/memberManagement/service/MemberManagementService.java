package com.hp.app.memberManagement.service;

import java.util.List;
import java.util.Map;

import com.hp.app.member.vo.MemberVo;

public interface MemberManagementService {

	
	// 회원
	// 일반 회원 전체 갯수
	List<MemberVo> getMemberListCnt(Map<String, String> searchMap);
	
	// 일반 회원 조회
	List<MemberVo> getMemberList(Map<String,String> searchMap);
	
	// 일반 회원 상세 조회
	MemberVo getMemberByNo(String mno);
	
	// 일반 회원 삭제
	int deleteMember(String mno);
	
	// 일반 회원 상벌점 주기
	int insertPointMember(String mno);
	
	// 일반 회원 정지 시키기

	// 관리자
	// 관리자 조회
	
	// 관리자 상세 조회
}
