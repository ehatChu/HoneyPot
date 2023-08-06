package com.hp.app.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.board.vo.BoardCategoryVo;
import com.hp.app.board.vo.BoardImgVo;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.LoveVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	//게시글 목록 조회 (검색조회)
	@Override
	public List<BoardVo> getList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchVo) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("board.getList", searchVo, rb);
	}

	//게시글 개수 (검색 게시글 개수)
	@Override
	public int countBoard(SqlSessionTemplate sst, Map<String, String> searchVo) {
		return sst.selectOne("board.countBoard", searchVo);
	}

	//게시글 작성
	@Override
	public int write(SqlSessionTemplate sst, BoardVo vo) {
		return sst.insert("board.write", vo);
	}

	//게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, BoardVo vo) {
		return sst.update("board.edit", vo);
	}

	//게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, Map<String, String> noMap) {
		return sst.delete("board.delete", noMap);
	}

	//게시글 상세조회 (+ 조회수 증가)
	@Override
	public BoardVo viewDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("board.viewDetail", no);
	}

	//조회수 증가
	@Override
	public int plusHit(SqlSessionTemplate sst, String no) {
		return sst.update("board.plusHit", no);
	}

	//게시글 카테고리 조회
	@Override
	public List<BoardCategoryVo> getCategory(SqlSessionTemplate sst) {
		return sst.selectList("board.getCategory");
	}

	//댓글 작성
	@Override
	public int writeReply(SqlSessionTemplate sst, ReplyVo rvo) {
		return sst.insert("board.writeReply", rvo);
	}
	
	//댓글 수정
	@Override
	public int editReply(SqlSessionTemplate sst, ReplyVo rvo) {
		return sst.update("board.editReply", rvo);
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(SqlSessionTemplate sst, ReplyVo rvo) {
		return sst.update("board.deleteReply", rvo);
	}
	
	//댓글 목록 조회
	@Override
	public List<ReplyVo> getReplyList(SqlSessionTemplate sst, String boardNo) {
		return sst.selectList("board.getReplyList", boardNo);
	}

	//사진 목록 조회
	@Override
	public List<BoardImgVo> getImgList(SqlSessionTemplate sst, String no) {
		return null;
	}

	//좋아요 개수
	@Override
	public int countLove(SqlSessionTemplate sst, LoveVo lvo) {
		return sst.selectOne("board.countLove", lvo);
	}

	//좋아요 여부
	@Override
	public int checkLoveYn(SqlSessionTemplate sst, LoveVo lvo) {
		return sst.selectOne("board.checkLoveYn", lvo);
	}

	//좋아요 삽입
	@Override
	public int insertLove(SqlSessionTemplate sst, LoveVo lvo) {
		return sst.insert("board.insertLove", lvo);
	}

	//좋아요 삭제
	@Override
	public int deleteLove(SqlSessionTemplate sst, LoveVo lvo) {
		return sst.delete("board.deleteLove", lvo);
	}

	//DB에 사진 저장
	@Override
	public int insertImgToDb(SqlSessionTemplate sst, BoardImgVo ivo) {
		return sst.insert("board.insertImgToDb", ivo);
	}
	

}
