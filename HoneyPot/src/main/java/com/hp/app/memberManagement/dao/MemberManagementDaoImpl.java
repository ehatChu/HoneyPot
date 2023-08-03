package com.hp.app.memberManagement.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.member.vo.MemberVo;

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
		return 0;
	}
	
	// 일반 회원 상벌점 주기
	@Override
	public int insertPointMember(SqlSessionTemplate sst, String mno) {
		return 0;
	}

}
