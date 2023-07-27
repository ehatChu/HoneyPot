package com.hp.app.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.board.vo.BoardCategoryVo;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	//게시글 목록 조회 (검색조회)
	@Override
	public List<BoardVo> getList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchVo) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("board.getList", searchVo, rb);
	}

	//게시글 개수 (검색 게시글 개수)
	@Override
	public int countBoard(SqlSessionTemplate sst, Map<String, String> searchVo) {
		return sst.selectOne("board.countBoard", searchVo);
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
	public int delete(SqlSessionTemplate sst, Map<String, String> noMap) {
		return 0;
	}

	//게시글 상세조회 (+ 조회수 증가)
	@Override
	public BoardVo viewDetail(SqlSessionTemplate sst, String no) {
		return null;
	}

	//조회수 증가
	@Override
	public int plusHit(SqlSessionTemplate sst, String no) {
		return 0;
	}

	//게시글 카테고리 조회
	@Override
	public List<BoardCategoryVo> getCategory(SqlSessionTemplate sst) {
		return null;
	}

}
