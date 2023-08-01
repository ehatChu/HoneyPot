package com.hp.app.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.board.dao.BoardDao;
import com.hp.app.board.vo.BoardCategoryVo;
import com.hp.app.board.vo.BoardImgVo;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.LoveVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	private final SqlSessionTemplate sst;
	private final BoardDao dao;
	
	//게시글 목록 조회 (검색조회)
	@Override
	public List<BoardVo> getList(PageVo pv, Map<String, String> searchVo) {
		return dao.getList(sst, pv, searchVo);
	}

	//게시글 개수 (검색 게시글 개수)
	@Override
	public int countBoard(Map<String, String> searchVo) {
		return dao.countBoard(sst, searchVo);
	}

	//게시글 작성
	@Override
	public int write(BoardVo vo) {
//		return dao.write(sst, vo);
		return 0;
	}

	//게시글 수정
	@Override
	public int edit(BoardVo vo) {
//		return dao.edit(sst, vo);
		return 0;
	}

	//게시글 삭제
	@Override
	public int delete(Map<String, String> noMap) {
//		return dao.delete(sst, noMap);
		return 0;
	}

	//게시글 상세조회
	@Override
	public BoardVo viewDetail(String no) {
		int result = dao.plusHit(sst, no);
		return dao.viewDetail(sst, no);
	}

	//게시글 카테고리 조회
	@Override
	public List<BoardCategoryVo> getCategory() {
		return null;
	}

	//댓글 작성
	@Override
	public int writeReply(ReplyVo rvo) {
		return dao.writeReply(sst, rvo);
	}
	
	//댓글 목록 조회
	@Override
	public List<ReplyVo> getReplyList(String boardNo) {
		return dao.getReplyList(sst, boardNo);
	}

	//사진 목록 조회
	@Override
	public List<BoardImgVo> getImgList(String no) {
		return null;
	}

	//좋아요 개수
	@Override
	public int countLove(LoveVo lvo) {
		return dao.countLove(sst, lvo);
	}

	//좋아요 여부
	@Override
	public int checkLoveYn(LoveVo lvo) {
		return dao.checkLoveYn(sst, lvo);
	}

	//좋아요 삽입
	@Override
	public int insertLove(LoveVo lvo) {
		return dao.insertLove(sst, lvo);
	}

	//좋아요 삭제
	@Override
	public int deleteLove(LoveVo lvo) {
		return dao.deleteLove(sst, lvo);
	}


}
