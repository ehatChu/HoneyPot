package com.hp.app.myboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

public interface MyboardDao {
	
	//내 게시글 조회
	public abstract List<BoardVo> getMyPost(SqlSessionTemplate sst, PageVo pv, String writerNo);
	
	//게시글 수 세기
	public abstract int countMyPost(SqlSessionTemplate sst, String writerNo);
	
	//내 댓글 조회
	public abstract List<ReplyVo> getMyReply(SqlSessionTemplate sst, PageVo pv, String writerNo);
	
	//댓글 수 세기
	public abstract int countMyReply(SqlSessionTemplate sst, String writerNo);
	
	//내 좋아요 조회
	public abstract List<BoardVo> getMyLove(SqlSessionTemplate sst, PageVo pv, String memberNo);
	
	//좋아요 글 수 세기
	public abstract int countMyLove(SqlSessionTemplate sst, String memberNo);

}
