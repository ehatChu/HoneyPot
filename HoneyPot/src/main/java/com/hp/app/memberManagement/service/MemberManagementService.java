package com.hp.app.memberManagement.service;

import java.util.List;
import java.util.Map;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.point.vo.PointVo;
import com.hp.app.restriction.vo.RestrictionVo;

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
	int insertPointMember(PointVo vo);

	// 정규 회원 등록
	int regularMember(String mno);

	// 일반 회원 정지 시키기
	int stopMember(RestrictionVo vo)  throws Exception;

	// 관리자
	// 관리자 전체 갯수
	List<AdminVo> getAdminListCnt(Map<String, String> searchMap);
	
	// 관리자 조회
	List<AdminVo> getAdminList(Map<String,String> searchMap);
	
	// 관리자 상세 조회
	AdminVo getAdminByNo(String ano);
	
	// 관리자 회원 삭제
	int deleteAdmin(String ano);
	
	// 관리자 회원 정지
	int stopAdmin(String ano);
	
	// 관리자 정규 회원 등록
	int regularAdmin(String ano);
}
