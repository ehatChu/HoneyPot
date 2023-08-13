package com.hp.app.notice.service;

import java.util.List;
import java.util.Map;

import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.notice.vo.PersonalVoteVo;
import com.hp.app.notice.vo.VoteCandidateVo;
import com.hp.app.notice.vo.VoteVo;
import com.hp.app.page.vo.PageVo;

public interface NoticeService {
	
	//공지사항 목록 조회 (검색조회)
	public abstract List<NoticeVo> getNoticeList(PageVo pv, Map<String, String> searchVo);
	
	//공지사항 개수 (검색된 공지사항 개수)
	public abstract int countNotice(Map<String, String> searchVo);
	
	//공지사항 작성
	public abstract int write(NoticeVo vo);
	
	//공지사항 수정
	public abstract int edit(NoticeVo vo);
	
	//공지사항 삭제
	public abstract int delete(String no);
	
	//공지사항 상세조회
	public abstract NoticeVo viewDetail(String no);

	//공지사항 카테고리 조회
	public abstract List<NoticeCategoryVo> getCategory();

	//투표 생성
	public abstract int makeVote(VoteVo vvo);

	//투표항목 삽입
	public abstract int insertVoteArticle(List<VoteCandidateVo> vcvoList);

	//투표 불러오기
	public abstract VoteVo getVote(String no);

	//투표항목 불러오기
	public abstract List<VoteCandidateVo> getVoteCandidate(String no);
	
	//총 투표 수
	public abstract int countVoteTotal(String no);
	
	//항목별 득표 수
	public abstract List<Integer> countEachCandidate(String no);
	
	//투표 여부
	public abstract int checkVoteYn(PersonalVoteVo pvvo);
	
	//투표 제출
	public abstract int insertPersonalVote(PersonalVoteVo pvvo);
	
	//투표 취소
	public abstract int deletePersonalVote(PersonalVoteVo pvvo);

}
