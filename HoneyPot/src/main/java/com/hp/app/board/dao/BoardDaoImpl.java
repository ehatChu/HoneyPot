package com.hp.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.board.vo.BoardVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	//게시글 목록
	@Override
	public List<NoticeVo> getList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("board.getList", null, rb);
	}
	
	//게시글 목록(검색조회)
	@Override
	public List<NoticeVo> getList(SqlSessionTemplate sst, PageVo pv, String searchType, String searchValue) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("board.getList", null, rb);
	}

	//전체 게시글 개수
	@Override
	public int countBoard(SqlSessionTemplate sst) {
		return sst.selectOne("board.countBoard");
	}

	//게시글 작성
	@Override
	public int write(SqlSessionTemplate sst, BoardVo vo) {
		return 0;
	}

	//게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, BoardVo vo) {
		return 0;
	}

	//게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, BoardVo vo) {
		return 0;
	}

	//게시글 상세조회 (+ 조회수 증가)
	@Override
	public BoardVo detail(SqlSessionTemplate sst, BoardVo vo) {
		return null;
	}

	//조회수 증가
	@Override
	public int plusHit(SqlSessionTemplate sst, String no) {
		return 0;
	}

}
