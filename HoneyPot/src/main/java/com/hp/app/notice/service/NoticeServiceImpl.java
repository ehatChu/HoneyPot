package com.hp.app.notice.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.notice.dao.NoticeDao;
import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.notice.vo.PersonalVoteVo;
import com.hp.app.notice.vo.VoteCandidateVo;
import com.hp.app.notice.vo.VoteVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final SqlSessionTemplate sst;
	private final NoticeDao dao;
	
	//공지사항 목록 조회 (검색조회)
	@Override
	public List<NoticeVo> getNoticeList(PageVo pv, Map<String, String> searchVo) {
		return dao.getNoticeList(sst, pv, searchVo);
	}

	//공지사항 개수 (검색 공지사항 개수)
	@Override
	public int countNotice(Map<String, String> searchVo) {
		return dao.countNotice(sst, searchVo);
	}

	//공지사항 작성
	@Override
	public int write(NoticeVo vo) {
		return dao.write(sst, vo);
	}

	//공지사항 수정
	@Override
	public int edit(NoticeVo vo) {
		return dao.edit(sst, vo);
	}

	//공지사항 삭제
	@Override
	public int delete(Map<String, String> noMap) {
		return dao.delete(sst, noMap);
	}

	//공지사항 상세조회 (+ 조회수 증가)
	@Override
	public NoticeVo viewDetail(String no) {
		dao.plusHit(sst, no);
		return dao.viewDetail(sst, no);
	}

	//공지사항 카테고리 조회
	@Override
	public List<NoticeCategoryVo> getCategory() {
		return dao.getCategory(sst);
	}

	//투표 생성
	@Override
	public int makeVote(VoteVo vvo) {
		return dao.makeVote(sst, vvo);
	}

	//투표항목 삽입
	@Override
	public int insertVoteArticle(List<VoteCandidateVo> vcvoList) {
		return dao.insertVoteArticle(sst, vcvoList);
	}

	//투표 불러오기
	@Override
	public VoteVo getVote(String no) {
		return dao.getVote(sst, no);
	}

	//투표항목 불러오기
	@Override
	public List<VoteCandidateVo> getVoteCandidate(String no) {
		return dao.getVoteCandidate(sst, no);
	}

	//총 투표 수
	@Override
	public int countVoteTotal(String no) {
		return dao.countVoteTotal(sst, no);
	}

	//항목별 득표 수
	@Override
	public List<PersonalVoteVo> countEachCandidate(String no) {
		return dao.countEachCandidate(sst, no);
	}

	//투표 여부
	@Override
	public int checkVoteYn(PersonalVoteVo pvvo) {
		return dao.checkVoteYn(sst, pvvo);
	}

	//투표 제출
	@Override
	public int insertPersonalVote(PersonalVoteVo pvvo) {
		return dao.insertPersonalVote(sst, pvvo);
	}

	//투표 취소
	@Override
	public int deletePersonalVote(PersonalVoteVo pvvo) {
		return dao.deletePersonalVote(sst, pvvo);
	}

}
