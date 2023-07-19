package com.hp.app.board.service;

import java.util.List;

import com.hp.app.board.vo.BoardVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

public interface BoardService {
	
	//게시글 목록
	public abstract List<NoticeVo> list(PageVo pv);
	
	//전체 게시글 개수
	public abstract int cntBoard();
	
	//게시글 작성
	public abstract int write(BoardVo vo);
	
	//게시글 수정
	public abstract int edit(BoardVo vo);
	
	//게시글 삭제
	public abstract int delete(BoardVo vo);
	
	//게시글 상세조회
	public abstract BoardVo detail(BoardVo vo);

}
