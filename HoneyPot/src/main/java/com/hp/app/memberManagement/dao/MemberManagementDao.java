package com.hp.app.memberManagement.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.point.vo.PointVo;
import com.hp.app.restriction.vo.RestrictionVo;

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
	int insertPointMember(SqlSessionTemplate sst, PointVo vo);

	// 정규 회원 등록
	int regularMember(SqlSessionTemplate sst, String mno);

	// 일반 회원 정지 시키기
	int stopMember(SqlSessionTemplate sst, RestrictionVo vo);

	// 일반 회원 정지 상태로 바꾸기
	int updateMemberStatus(SqlSessionTemplate sst, String memberNo);
	
	// 관리자
	// 관리자 전체 갯수
	List<AdminVo> getAdminListCnt(SqlSessionTemplate sst, Map<String, String> searchMap);
	
	// 관리자 조회
	List<AdminVo> getAdminList(SqlSessionTemplate sst, Map<String,String> searchMap);
	
	// 관리자 상세 조회
	AdminVo getAdminByNo(SqlSessionTemplate sst, String ano);
	
	// 관리자 회원 삭제
	int deleteAdmin(SqlSessionTemplate sst, String ano);
	
	// 관리자 회원 정지
	int stopAdmin(SqlSessionTemplate sst, String ano);
	
	// 관리자 정규 회원 등록
	int regularAdmin(SqlSessionTemplate sst, String ano);
	
}
