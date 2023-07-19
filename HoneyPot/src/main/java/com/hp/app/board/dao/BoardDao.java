package com.hp.app.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.board.vo.BoardVo;
import com.hp.app.page.vo.PageVo;

public interface BoardDao {
	
	//게시글 목록
	public abstract List<BoardVo> list(SqlSessionTemplate sst, PageVo pv);
	
	//전체 게시글 개수
	public abstract int cntBoard(SqlSessionTemplate sst);
	
	//게시글 작성
	public abstract int write(SqlSessionTemplate sst, BoardVo vo);
	
	//게시글 수정
	public abstract int edit(SqlSessionTemplate sst, BoardVo vo);
	
	//게시글 삭제
	public abstract int del(SqlSessionTemplate sst, BoardVo vo);
	
	//게시글 상세조회 (+ 조회수 증가)
	public abstract BoardVo detail(SqlSessionTemplate sst, BoardVo vo);
	
	//조회수 증가
	public abstract int plusHit(SqlSessionTemplate sst, String no);

}
