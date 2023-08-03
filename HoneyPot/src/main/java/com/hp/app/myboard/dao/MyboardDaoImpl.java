package com.hp.app.myboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class MyboardDaoImpl implements MyboardDao {

	//내 게시글 조회
	@Override
	public List<BoardVo> getMyPost(SqlSessionTemplate sst, PageVo pv, String writerNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//내 댓글 조회
	@Override
	public List<ReplyVo> getMyReply(SqlSessionTemplate sst, PageVo pv, String writerNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//내 좋아요 조회
	@Override
	public List<BoardVo> getMyLove(SqlSessionTemplate sst, PageVo pv, String memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//게시글 수 세기
	@Override
	public int countMyPost(SqlSessionTemplate sst, String writerNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//댓글 수 세기
	@Override
	public int countMyReply(SqlSessionTemplate sst, String writerNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//좋아요 글 수 세기
	@Override
	public int countMyLove(SqlSessionTemplate sst, String memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
