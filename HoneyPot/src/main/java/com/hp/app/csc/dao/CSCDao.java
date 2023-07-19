package com.hp.app.csc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportVo;
import com.hp.app.page.vo.PageVo;

public interface CSCDao {

	// 회원
	
	// FAQ
	// FAQ 카테고리 조회
	List<FAQCategoryVo> getFAQCatList(SqlSessionTemplate sst);
	
	// FAQ 모든 글 갯수
	int getFAQCnt(SqlSessionTemplate sst);
	
	// FAQ 모든 List 조회
	List<FAQVo> getFAQList(SqlSessionTemplate sst, PageVo pvo);
	
	// FAQ 상세 조회
	FAQVo getFAQByNo(SqlSessionTemplate sst, String fno);
	
	// FAQ 검색 List 조회
	List<FAQVo> getFAQListBySearch(SqlSessionTemplate sst, FAQVo vo);
	
	// FAQ 조회수 증가
	int increaseHit(SqlSessionTemplate sst, String fno);
	
	// 문의
	// 문의 등록
	int write(SqlSessionTemplate sst, QNAVo vo);
	
	// 문의 List 조회
	List<QNAVo> getQNAList(SqlSessionTemplate sst, String no);
	
	// 문의 상세 조회
	QNAVo getQNAByNo(SqlSessionTemplate sst, QNAVo vo);
	
	// 문의 삭제
	int delete(SqlSessionTemplate sst, QNAVo vo);
	
	// 신고
	// 신고 등록
	int write(SqlSessionTemplate sst, ReportVo vo);
	
	// 신고 List 조회
	List<ReportVo> getReportList(SqlSessionTemplate sst, String no);
	
	// 신고 상세 조회
	ReportVo getReportByNo(SqlSessionTemplate sst, ReportVo vo);
	
	// 신고 삭제
	int delete(SqlSessionTemplate sst, ReportVo vo);
	
}
