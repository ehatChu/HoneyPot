package com.hp.app.csc.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.csc.dao.CSCDao;
import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class CSCServiceImpl implements CSCService {

	private final CSCDao dao;
	private final SqlSessionTemplate sst;
	// 회원

	// FAQ
	// FAQ 카테고리 조회
	@Override
	public List<FAQCategoryVo> getFAQCatList() {
		return dao.getFAQCatList(sst);
	}
	
	// FAQ 모든 글 갯수
	@Override
	public int getFAQCnt() {
		return dao.getFAQCnt(sst);
	}

	
	// FAQ 모든 List 조회
	@Override
	public List<FAQVo> getFAQList(PageVo pvo) {
		return dao.getFAQList(sst, pvo);
	}

	// FAQ 상세 조회
	@Override
	public FAQVo getFAQByNo(String fno) throws Exception {
		FAQVo vo = dao.getFAQByNo(sst, fno);
		
		int result = dao.increaseHit(sst, fno);
		
		if(result != 1) {
			throw new Exception();
		}
		
		return vo;
	}
	
	// FAQ 검색 List 조회
	@Override
	public List<FAQVo> getFAQListBySearch(FAQVo vo) {
		return null;
	}

	// 문의
	// 문의 등록
	@Override
	public int write(QNAVo vo) {
		return 0;
	}

	// 문의 List 조회
	@Override
	public List<QNAVo> getQNAList(String no) {
		return null;
	}

	// 문의 상세 조회
	@Override
	public QNAVo getQNAByNo(QNAVo vo) {
		return null;
	}

	// 문의 삭제
	@Override
	public int delete(QNAVo vo) {
		return 0;
	}

	// 신고
	// 신고 등록
	@Override
	public int write(ReportVo vo) {
		return 0;
	}

	// 신고 List 조회
	@Override
	public List<ReportVo> getReportList(String no) {
		return null;
	}

	// 신고 상세 조회
	@Override
	public ReportVo getReportByNo(ReportVo vo) {
		return null;
	}

	// 신고 삭제
	@Override
	public int delete(ReportVo vo) {
		return 0;
	}



}
