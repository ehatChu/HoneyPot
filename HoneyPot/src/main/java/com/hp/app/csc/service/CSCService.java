package com.hp.app.csc.service;

import java.util.List;
import java.util.Map;

import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNACategoryVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportCategoryVo;
import com.hp.app.csc.vo.ReportVo;
import com.hp.app.csc.vo.SearchVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

public interface CSCService {

	// 회원
	
	// FAQ
	// FAQ 카테고리 조회
	List<FAQCategoryVo> getFAQCatList();
	
	// FAQ 모든 글 갯수
	int getFAQCnt(Map<String, String> searchVo);
	
	// FAQ 모든 List 조회
	List<FAQVo> getFAQList(PageVo pvo, Map<String, String> searchVo);
	
	// FAQ 상세 조회
	FAQVo getFAQByNo(String fNo) throws Exception;
	
	// FAQ 검색 List 조회
	List<FAQVo> getFAQListBySearch(FAQVo vo);
	
	// 문의
	// 문의 카테고리 List 조회
	List<QNACategoryVo> getQNACatList();
	
	// 문의 등록
	int insertInquiry(QNAVo vo);
	
	// 문의 List 조회
	List<QNAVo> getMyQNAList(String no);
	
	// 문의 상세 조회
	QNAVo getMyQNAByNo(QNAVo vo);
	
	// 문의 내역 삭제
	int deleteMyInquiry(QNAVo vo);
	
	// 신고
	// 신고 카테고리 List 조회
	List<ReportCategoryVo> getReportCatList();
	
	// 신고 대상 회원 List 조회
	List<MemberVo> getMemberList(SearchVo vo);
	
	// 신고 대상 회원 조회
	MemberVo getMemberByNo(String mno);
	
	// 신고 등록
	int insertReport(ReportVo vo);
	
	// 신고 List 조회
	List<ReportVo> getMyReportList(String no);
	
	// 신고 상세 조회
	ReportVo getMyReportByNo(ReportVo vo);
	
	// 신고 삭제
	int deleteMyReport(ReportVo vo);

	//-------------------------------------------------------------------------------------------------------------
	
	// 관리자
	
	// 문의
	// 문의 카테고리 조회
	// getQNACatList 사용
	
	// 문의 List 검색 갯수
	int getQNACnt(Map<String, String> searchMap);
	
	// 문의 List 검색 조회
	List<QNAVo> getQNAAllList(Map<String, String> searchMap);
	
	// 문의 List 검색 조회(페이징)
	List<QNAVo> getQNAList(PageVo pvo, Map<String, String> searchMap);

	// 문의내역 상세조회
	QNAVo getQNAByNo(String qno);
	
	// 문의내역 삭제
	int deleteInquiry(String qno);
	
	// 문의 답변
	
}
