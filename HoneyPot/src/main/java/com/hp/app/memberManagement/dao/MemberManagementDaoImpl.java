package com.hp.app.memberManagement.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.point.vo.PointVo;
import com.hp.app.restriction.vo.RestrictionVo;

@Repository
public class MemberManagementDaoImpl implements MemberManagementDao{

	// 회원
	// 일반 회원 전체 갯수
	@Override
	public List<MemberVo> getMemberListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectList("memberManagement.getMemberListCnt", searchMap);
	}

	// 일반 회원 조회
	@Override
	public List<MemberVo> getMemberList(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectList("memberManagement.getMemberList", searchMap);
	}
	
	// 일반 회원 상세 조회
	@Override
	public MemberVo getMemberByNo(SqlSessionTemplate sst, String mno) {
		return sst.selectOne("memberManagement.getMemberByNo", mno);
	}
	
	// 일반 회원 삭제
	@Override
	public int deleteMember(SqlSessionTemplate sst, String mno) {
		return sst.update("memberManagement.deleteMember", mno);
	}
	
	// 일반 회원 상벌점 주기
	@Override
	public int insertPointMember(SqlSessionTemplate sst, PointVo vo) {
		return sst.insert("memberManagement.insertPointMember", vo);
	}

	// 정규 회원 등록
	@Override
	public int regularMember(SqlSessionTemplate sst, String mno) {
		return sst.update("memberManagement.regularMember", mno);
	}

	// 일반 회원 정지 시키기
	@Override
	public int stopMember(SqlSessionTemplate sst, RestrictionVo vo) {
		return sst.insert("memberManagement.stopMember", vo);
	}

	// 일반 회원 정지 상태로 바꾸기
	@Override
	public int updateMemberStatus(SqlSessionTemplate sst, String memberNo) {
		return sst.update("memberManagement.updateMemberStatus", memberNo);
	}

	// 관리자
	// 관리자 전체 갯수
	@Override
	public List<AdminVo> getAdminListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectList("memberManagement.getAdminListCnt", searchMap);
	}

	// 관리자 조회
	@Override
	public List<AdminVo> getAdminList(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectList("memberManagement.getAdminList", searchMap);
	}

	// 관리자 상세 조회
	@Override
	public AdminVo getAdminByNo(SqlSessionTemplate sst, String ano) {
		return sst.selectOne("memberManagement.getAdminByNo", ano);
	}

	// 관리자 회원 삭제
	@Override
	public int deleteAdmin(SqlSessionTemplate sst, String ano) {
		return sst.update("memberManagement.deleteAdmin", ano);
	}

	// 관리자 회원 정지
	@Override
	public int stopAdmin(SqlSessionTemplate sst, String ano) {
		return sst.update("memberManagement.stopAdmin", ano);
	}
	
	// 관리자 정규 회원 등록
	@Override
	public int regularAdmin(SqlSessionTemplate sst, String ano) {
		return sst.update("memberManagement.regularAdmin", ano);
	}


}
