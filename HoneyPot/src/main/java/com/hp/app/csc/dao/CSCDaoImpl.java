package com.hp.app.csc.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNACategoryVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportCategoryVo;
import com.hp.app.csc.vo.ReportVo;
import com.hp.app.csc.vo.SearchVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

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

	// FAQ 모든 글 갯수
	@Override
	public int getFAQCnt(SqlSessionTemplate sst) {
		return sst.selectOne("csc.getFAQCnt");
	}
	
	// FAQ 모든 List 조회
	@Override
	public List<FAQVo> getFAQList(SqlSessionTemplate sst, PageVo pvo) {
		RowBounds rb = new RowBounds(pvo.getOffset(), pvo.getBoardLimit()); // (건널 뛸 갯수, 보여줄 갯수)
		return sst.selectList("csc.getFAQList", null, rb);
	}

	// FAQ 상세 조회
	@Override
	public FAQVo getFAQByNo(SqlSessionTemplate sst, String fno) {
		return sst.selectOne("csc.getFAQByNo", fno);
	}

	// FAQ 검색 List 조회
	@Override
	public List<FAQVo> getFAQListBySearch(SqlSessionTemplate sst, FAQVo vo) {
		return null;
	}
	
	// FAQ 조회수 증가
	@Override
	public int increaseHit(SqlSessionTemplate sst, String fno) {
		return sst.update("csc.increaseHit", fno);
	}
	
	// 문의
	// 문의 카테고리 List 조회
	@Override
	public List<QNACategoryVo> getQNACatList(SqlSessionTemplate sst) {
		return sst.selectList("csc.getQNACatList");
	}
	
	// 문의 등록
	@Override
	public int insertInquiry(SqlSessionTemplate sst, QNAVo vo) {
		return sst.insert("csc.insertInquiry", vo);
	}

	// 문의 List 조회
	@Override
	public List<QNAVo> getQNAList(SqlSessionTemplate sst, String no) {
		return sst.selectList("csc.getQNAList", no);
	}

	// 문의 상세 조회
	@Override
	public QNAVo getQNAByNo(SqlSessionTemplate sst, QNAVo vo) {
		return sst.selectOne("csc.getQNAByNo", vo);
	}

	// 문의 삭제
	@Override
	public int delete(SqlSessionTemplate sst, QNAVo vo) {
		return 0;
	}

	// 신고
	// 신고 카테고리 List 조회
	@Override
	public List<ReportCategoryVo> getReportCatList(SqlSessionTemplate sst) {
		return sst.selectList("csc.getReportCatList");
	}
	
	// 신고 대상 회원 List 조회
	@Override
	public List<MemberVo> getMemberList(SqlSessionTemplate sst, SearchVo vo) {
		return sst.selectList("csc.getMemberList", vo);
	}
	
	// 신고 대상 회원 조회
	@Override
	public MemberVo getMemberByNo(SqlSessionTemplate sst, String mno) {
		return sst.selectOne("csc.getMemberByNo", mno);
	}
	
	// 신고 등록
	@Override
	public int insertReport(SqlSessionTemplate sst, ReportVo vo) {
		return sst.insert("csc.insertReport",vo);
	}

	// 신고 List 조회
	@Override
	public List<ReportVo> getReportList(SqlSessionTemplate sst, String no) {
		return sst.selectList("csc.getReportList", no);
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




} // class
