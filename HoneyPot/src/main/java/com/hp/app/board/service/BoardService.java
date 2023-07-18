package com.hp.app.board.service;

import java.util.List;

import com.hp.app.board.vo.BoardVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

public interface BoardService {
	
	//공지사항
	//공지사항 목록
	public abstract List<BoardVo> noticeList(PageVo pv);
	
	//전체 공지사항 개수
	public abstract int cntNotice();
	
	//공지사항 작성
	public abstract int write(NoticeVo vo);
	
	//공지사항 수정
	public abstract int edit(NoticeVo vo);
	
	//공지사항 삭제
	public abstract int del(NoticeVo vo);
	
	//공지사항 상세조회
	public abstract BoardVo detail(NoticeVo vo);
	
	
	
	// !공지사항
	//게시글 목록
	public abstract List<BoardVo> list(PageVo pv);
	
	//게시글 작성
	public abstract int write(BoardVo vo);
	
	//게시글 수정
	public abstract int edit(BoardVo vo);
	
	//게시글 삭제
	public abstract int del(BoardVo vo);
	
	//게시글 상세조회
	public abstract BoardVo detail(BoardVo vo);
	
	

}
