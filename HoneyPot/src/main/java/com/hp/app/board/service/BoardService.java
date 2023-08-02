package com.hp.app.board.service;

import java.util.List;
import java.util.Map;

import com.hp.app.board.vo.BoardCategoryVo;
import com.hp.app.board.vo.BoardImgVo;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.LoveVo;
import com.hp.app.board.vo.ReplyVo;
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
	public abstract BoardVo viewDetail(String no);
	
	//게시글 카테고리 조회
	public abstract List<BoardCategoryVo> getCategory();

	//댓글 작성
	public abstract int writeReply(ReplyVo rvo);
	
	//댓글수정
	public abstract int editReply(ReplyVo rvo);
	
	//댓글 목록 조회
	public abstract List<ReplyVo> getReplyList(String boardNo);
	
	//사진 목록 조회
	public abstract List<BoardImgVo> getImgList(String no);

	//좋아요 개수
	public abstract int countLove(LoveVo lvo);
	
	//좋아요 여부
	public abstract int checkLoveYn(LoveVo lvo);
	
	//좋아요 삽입
	public abstract int insertLove(LoveVo lvo);
	
	//좋아요 삭제
	public abstract int deleteLove(LoveVo lvo);
		

}
