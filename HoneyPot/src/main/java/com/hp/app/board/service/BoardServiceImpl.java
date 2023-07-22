package com.hp.app.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.board.dao.BoardDao;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final SqlSessionTemplate sst;
	private final BoardDao dao;
	
	//게시글 목록 조회 (검색조회)
	@Override
	public List<NoticeVo> getList(PageVo pv, Map<String, String> searchVo) {
		return dao.getList(sst, pv, searchVo);
	}

	//게시글 개수 (검색 게시글 개수)
	@Override
	public int countBoard(Map<String, String> searchVo) {
		return dao.countBoard(sst, searchVo);
	}

	//게시글 작성
	@Override
	public int write(BoardVo vo) {
		return dao.write(sst, vo);
	}

	//게시글 수정
	@Override
	public int edit(BoardVo vo) {
		return dao.edit(sst, vo);
	}

	//게시글 삭제
	@Override
	public int delete(BoardVo vo) {
		return dao.delete(sst, vo);
	}

	//게시글 상세조회
	@Override
	public BoardVo detail(BoardVo vo) {
		return dao.detail(sst, vo);
	}

}
