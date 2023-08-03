package com.hp.app.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.board.vo.BoardCategoryVo;
import com.hp.app.board.vo.BoardImgVo;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.LoveVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

public interface BoardDao {
	
	//게시글 목록 조회 (검색조회)
	public abstract List<BoardVo> getList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchVo);
	
	//게시글 개수 (검색 게시글 개수)
	public abstract int countBoard(SqlSessionTemplate sst, Map<String, String> searchVo);
	
	//게시글 작성
	public abstract int write(SqlSessionTemplate sst, BoardVo vo);
	
	//게시글 수정
	public abstract int edit(SqlSessionTemplate sst, BoardVo vo);
	
	//게시글 삭제
	public abstract int delete(SqlSessionTemplate sst, Map<String, String> noMap);
	
	//게시글 상세조회 (+ 조회수 증가)
	public abstract BoardVo viewDetail(SqlSessionTemplate sst, String no);
	
	//조회수 증가
	public abstract int plusHit(SqlSessionTemplate sst, String no);
	
	//게시글 카테고리 조회
	public abstract List<BoardCategoryVo> getCategory(SqlSessionTemplate sst);

	//댓글 작성
	public abstract int writeReply(SqlSessionTemplate sst, ReplyVo rvo);
	
	//댓글 수정
	public abstract int editReply(SqlSessionTemplate sst, ReplyVo rvo);

	//댓글 삭제
	public abstract int deleteReply(SqlSessionTemplate sst, ReplyVo rvo);
	
	//댓글 목록 조회
	public abstract List<ReplyVo> getReplyList(SqlSessionTemplate sst, String boardNo);
	
	//사진 목록 조회
	public abstract List<BoardImgVo> getImgList(SqlSessionTemplate sst, String no);
	
	//좋아요 개수
	public abstract int countLove(SqlSessionTemplate sst, LoveVo lvo);
	
	//좋아요 여부
	public abstract int checkLoveYn(SqlSessionTemplate sst, LoveVo lvo);
	
	//좋아요 삽입
	public abstract int insertLove(SqlSessionTemplate sst, LoveVo lvo);
	
	//좋아요 삭제
	public abstract int deleteLove(SqlSessionTemplate sst, LoveVo lvo);

	//DB에 사진 저장
	public abstract int insertImgToDb(SqlSessionTemplate sst, BoardImgVo ivo);


}
