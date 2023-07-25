package com.hp.app.notice.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.notice.dao.NoticeDao;
import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final SqlSessionTemplate sst;
	private final NoticeDao dao;
	
	//공지사항 목록 조회 (검색조회)
	@Override
	public List<NoticeVo> getNoticeList(PageVo pv, Map<String, String> searchVo) {
		return dao.getNoticeList(sst, pv, searchVo);
	}

	//공지사항 개수 (검색 공지사항 개수)
	@Override
	public int countNotice(Map<String, String> searchVo) {
		return dao.countNotice(sst, searchVo);
	}

	//공지사항 작성
	@Override
	public int write(NoticeVo vo) {
		return dao.write(sst, vo);
	}

	//공지사항 수정
	@Override
	public int edit(NoticeVo vo) {
		return dao.edit(sst, vo);
	}

	//공지사항 삭제
	@Override
	public int delete(NoticeVo vo) {
		return dao.delete(sst, vo);
	}

	//공지사항 상세조회
	@Override
	public NoticeVo viewDetail(String no) {
		dao.plusHit(sst, no);
		return dao.viewDetail(sst, no);
	}

	//공지사항 카테고리 조회
	@Override
	public List<NoticeCategoryVo> getCategory() {
		return dao.getCategory(sst);
	}

}
