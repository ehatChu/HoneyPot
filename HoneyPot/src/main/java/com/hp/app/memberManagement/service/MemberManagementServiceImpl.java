package com.hp.app.memberManagement.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.memberManagement.dao.MemberManagementDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
@RequiredArgsConstructor
public class MemberManagementServiceImpl implements MemberManagementService{
	
	private final MemberManagementDao dao;
	private final SqlSessionTemplate sst;

	// 회원
	// 일반 회원 전체 갯수
	@Override
	public List<MemberVo> getMemberListCnt(Map<String, String> searchMap) {
		return dao.getMemberListCnt(sst, searchMap);
	}
	
	// 일반 회원 조회
	@Override
	public List<MemberVo> getMemberList(Map<String, String> searchMap) {
		return dao.getMemberList(sst, searchMap);
	}
	
	// 일반 회원 상세 조회
	@Override
	public MemberVo getMemberByNo(String mno) {
		return dao.getMemberByNo(sst, mno);
	}
	
	// 일반 회원 삭제
	@Override
	public int deleteMember(String mno) {
		return 0;
	}
	
	// 일반 회원 상벌점 주기
	@Override
	public int insertPointMember(String mno) {
		return 0;
	}
	
}
