package com.hp.app.csc.service;

import java.util.List;

import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportVo;

public interface CSCService {

	// 회원
	
	// FAQ
	// FAQ 카테고리 조회
	List<FAQCategoryVo> getFAQCatList();
	
	// FAQ 모든 List 조회
	List<FAQVo> getFAQList();
	
	// FAQ 상세 조회
	FAQVo getFAQByNo(String fNo);
	
	// FAQ 검색 List 조회
	List<FAQVo> getFAQListBySearch(FAQVo vo);
	
	// 문의
	// 문의 등록
	int write(QNAVo vo);
	
	// 문의 List 조회
	List<QNAVo> getQNAList(String no);
	
	// 문의 상세 조회
	QNAVo getQNAByNo(QNAVo vo);
	
	// 문의 삭제
	int delete(QNAVo vo);
	
	// 신고
	// 신고 등록
	int write(ReportVo vo);
	
	// 신고 List 조회
	List<ReportVo> getReportList(String no);
	
	// 신고 상세 조회
	ReportVo getReportByNo(ReportVo vo);
	
	// 신고 삭제
	int delete(ReportVo vo);
	
	
}
