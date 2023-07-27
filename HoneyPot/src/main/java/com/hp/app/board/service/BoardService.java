package com.hp.app.board.service;

import java.util.List;
import java.util.Map;

import com.hp.app.board.vo.BoardCategoryVo;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.page.vo.PageVo;

public interface BoardService {
	
	//게시글 목록 조회 (검색조회)
	public abstract List<BoardVo> getList(PageVo pv, Map<String, String> searchVo);
	
	//게시글 개수 (검색 게시글 개수)
	public abstract int countBoard(Map<String, String> searchVo);
	
	//게시글 작성
	public abstract int write(BoardVo vo);
	
	//게시글 수정
	public abstract int edit(BoardVo vo);
	
	//게시글 삭제
	public abstract int delete(Map<String, String> noMap);
	
	//게시글 상세조회
	public abstract BoardVo viewDetail(BoardVo vo);
	
	//게시글 카테고리 조회
	public abstract List<BoardCategoryVo> getCategory();

}
