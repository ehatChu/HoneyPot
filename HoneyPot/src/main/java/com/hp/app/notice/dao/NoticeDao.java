package com.hp.app.notice.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.notice.vo.PersonalVoteVo;
import com.hp.app.notice.vo.VoteCandidateVo;
import com.hp.app.notice.vo.VoteVo;
import com.hp.app.page.vo.PageVo;

public interface NoticeDao {
	
	//공지사항 목록 조회 (검색조회)
	public abstract List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchVo);
	
	//공지사항 개수 (검색 게시글 개수)
	public abstract int countNotice(SqlSessionTemplate sst, Map<String, String> searchVo);
	
	//공지사항 작성
	public abstract int write(SqlSessionTemplate sst, NoticeVo vo);
	
	//공지사항 수정
	public abstract int edit(SqlSessionTemplate sst, NoticeVo vo);
	
	//공지사항 삭제
	public abstract int delete(SqlSessionTemplate sst, String no);
	
	//공지사항 상세조회 (+ 조회수 증가)
	public abstract NoticeVo viewDetail(SqlSessionTemplate sst, String no);
	
	//조회수 증가
	public abstract int plusHit(SqlSessionTemplate sst, String no);

	//공지사항 카테고리 조회
	public abstract List<NoticeCategoryVo> getCategory(SqlSessionTemplate sst);

	//투표 생성
	public abstract int makeVote(SqlSessionTemplate sst, VoteVo vvo);

	//투표항목 삽입
	public abstract int insertVoteArticle(SqlSessionTemplate sst, List<VoteCandidateVo> vcvoList);

	//투표 불러오기
	public abstract VoteVo getVote(SqlSessionTemplate sst, String no);

	//투표항목 불러오기
	public abstract List<VoteCandidateVo> getVoteCandidate(SqlSessionTemplate sst, String no);
	
	//총 투표 수
	public abstract int countVoteTotal(SqlSessionTemplate sst, String no);
	
	//항목별 득표 수
	public abstract List<Integer> countEachCandidate(SqlSessionTemplate sst, String no);
	
	//투표 여부
	public abstract int checkVoteYn(SqlSessionTemplate sst, PersonalVoteVo pvvo);
	
	//투표 제출
	public abstract int insertPersonalVote(SqlSessionTemplate sst, PersonalVoteVo pvvo);
	
	//투표 취소
	public abstract int deletePersonalVote(SqlSessionTemplate sst, PersonalVoteVo pvvo);

}
