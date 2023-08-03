package com.hp.app.myboard.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.board.dao.BoardDao;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MyboardServiceImpl implements MyboardService {
	
	private final SqlSessionTemplate sst;
	private final BoardDao dao;

	//내 게시글 조회
	@Override
	public List<BoardVo> getMyPost(PageVo pv, String writerNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//내 댓글 조회
	@Override
	public List<ReplyVo> getMyReply(PageVo pv, String writerNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//내 좋아요 조회
	@Override
	public List<BoardVo> getMyLove(PageVo pv, String memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//게시글 수 세기
	@Override
	public int countMyPost(String writerNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//댓글 수 세기
	@Override
	public int countMyReply(String writerNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//좋아요 글 수 세기
	@Override
	public int countMyLove(String memberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
