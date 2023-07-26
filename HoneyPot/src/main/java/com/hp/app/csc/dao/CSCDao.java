package com.hp.app.csc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNACategoryVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportCategoryVo;
import com.hp.app.csc.vo.ReportVo;
import com.hp.app.csc.vo.SearchVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

public interface CSCDao {

	// 회원
	
	// FAQ
	// FAQ 카테고리 조회
	List<FAQCategoryVo> getFAQCatList(SqlSessionTemplate sst);
	
	// FAQ 모든 글 갯수
	int getFAQCnt(SqlSessionTemplate sst, Map<String, String> searchVo);
	
	// FAQ 모든 List 조회
	List<FAQVo> getFAQList(SqlSessionTemplate sst, PageVo pvo, Map<String, String> searchVo);
	
	// FAQ 상세 조회
	FAQVo getFAQByNo(SqlSessionTemplate sst, String fno);
	
	// FAQ 검색 List 조회
	List<FAQVo> getFAQListBySearch(SqlSessionTemplate sst, FAQVo vo);
	
	// FAQ 조회수 증가
	int increaseHit(SqlSessionTemplate sst, String fno);
	
	// 문의
	// 문의 카테고리 List 조회
	List<QNACategoryVo> getQNACatList(SqlSessionTemplate sst);
	
	// 문의 등록
	int insertInquiry(SqlSessionTemplate sst, QNAVo vo);
	
	// 문의 List 조회
	List<QNAVo> getMyQNAList(SqlSessionTemplate sst, String no);
	
	// 문의 상세 조회
	QNAVo getMyQNAByNo(SqlSessionTemplate sst, QNAVo vo);
	
	// 문의 내역 삭제
	int deleteMyInquiry(SqlSessionTemplate sst, QNAVo vo);
	
	// 신고
	// 신고 카테고리 List 조회
	List<ReportCategoryVo> getReportCatList(SqlSessionTemplate sst);
	
	// 신고 대상 회원 List 조회
	List<MemberVo> getMemberList(SqlSessionTemplate sst, SearchVo vo);
	
	// 신고 대상 회원 조회
	MemberVo getMemberByNo(SqlSessionTemplate sst, String mno);
	
	// 신고 등록
	int insertReport(SqlSessionTemplate sst, ReportVo vo);
	
	// 신고 List 조회
	List<ReportVo> getMyReportList(SqlSessionTemplate sst, String no);
	
	// 신고 상세 조회
	ReportVo getMyReportByNo(SqlSessionTemplate sst, ReportVo vo);
	
	// 신고 삭제
	int deleteMyReport(SqlSessionTemplate sst, ReportVo vo);

	//-------------------------------------------------------------------------------------------------------------
	
	// 관리자
	
	// 문의
	// 문의 List 검색 갯수
	int getQNACnt(SqlSessionTemplate sst, Map<String, String> searchMap);
	
	// 문의 List 검색 조회
	List<QNAVo> getQNAAllList(SqlSessionTemplate sst, Map<String, String> searchMap);
	
	// 문의 List 검색 조회(페이징)
	List<QNAVo> getQNAList(SqlSessionTemplate sst, PageVo pvo, Map<String, String> searchMap);
	
}
