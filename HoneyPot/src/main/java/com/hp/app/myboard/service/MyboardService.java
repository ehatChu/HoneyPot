package com.hp.app.myboard.service;

import java.util.List;

import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

public interface MyboardService {
	
	//내 게시글 조회
	public abstract List<BoardVo> getMyPost(PageVo pv, String writerNo);
	
	//내 댓글 조회
	public abstract List<ReplyVo> getMyReply(PageVo pv, String writerNo);
	
	//내 좋아요 조회
	public abstract List<BoardVo> getMyLove(PageVo pv, String memberNo);
	
	//게시글 수 세기
	public abstract int countMyPost(String writerNo);
	
	//댓글 수 세기
	public abstract int countMyReply(String writerNo);
	
	//좋아요 글 수 세기
	public abstract int countMyLove(String memberNo);

}
