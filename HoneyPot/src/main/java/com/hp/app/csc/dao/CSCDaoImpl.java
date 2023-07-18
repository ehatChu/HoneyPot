package com.hp.app.csc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class CSCDaoImpl implements CSCDao{
	
	// 회원
	
	// FAQ
	// FAQ 카테고리 조회
	@Override
	public List<FAQCategoryVo> getFAQCatList(SqlSessionTemplate sst) {
		return sst.selectList("csc.getFAQCatList");
	}
	
	// FAQ 모든 List 조회
	@Override
	public List<FAQVo> getFAQList(SqlSessionTemplate sst) {
		return sst.selectList("csc.getFAQList");
	}

	// FAQ 상세 조회
	@Override
	public FAQVo getFAQByNo(SqlSessionTemplate sst, String fNo) {
		return null;
	}

	// FAQ 검색 List 조회
	@Override
	public List<FAQVo> getFAQListBySearch(SqlSessionTemplate sst, FAQVo vo) {
		return null;
	}

	// 문의
	// 문의 등록
	@Override
	public int write(SqlSessionTemplate sst, QNAVo vo) {
		return 0;
	}

	// 문의 List 조회
	@Override
	public List<QNAVo> getQNAList(SqlSessionTemplate sst, String no) {
		return null;
	}

	// 문의 상세 조회
	@Override
	public QNAVo getQNAByNo(SqlSessionTemplate sst, QNAVo vo) {
		return null;
	}

	// 문의 삭제
	@Override
	public int delete(SqlSessionTemplate sst, QNAVo vo) {
		return 0;
	}

	// 신고
	// 신고 등록
	@Override
	public int write(SqlSessionTemplate sst, ReportVo vo) {
		return 0;
	}

	// 신고 List 조회
	@Override
	public List<ReportVo> getReportList(SqlSessionTemplate sst, String no) {
		return null;
	}

	// 신고 상세 조회
	@Override
	public ReportVo getReportByNo(SqlSessionTemplate sst, ReportVo vo) {
		return null;
	}

	// 신고 삭제
	@Override
	public int delete(SqlSessionTemplate sst, ReportVo vo) {
		return 0;
	}



}
