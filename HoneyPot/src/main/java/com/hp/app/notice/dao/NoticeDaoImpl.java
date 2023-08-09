package com.hp.app.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.notice.vo.PersonalVoteVo;
import com.hp.app.notice.vo.VoteCandidateVo;
import com.hp.app.notice.vo.VoteVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	//공지사항 목록 조회 (검색조회)
	@Override
	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchVo) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("notice.getNoticeList", searchVo, rb);
	}

	//공지사항 개수 (검색 게시글 개수)
	@Override
	public int countNotice(SqlSessionTemplate sst, Map<String, String> searchVo) {
		return sst.selectOne("notice.countNotice", searchVo);
	}

	//공지사항 작성
	@Override
	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("notice.write", vo);
	}

	//공지사항 수정
	@Override
	public int edit(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("notice.edit", vo);
	}

	//공지사항 삭제
	@Override
	public int delete(SqlSessionTemplate sst, Map<String, String> noMap) {
		return sst.delete("notice.delete", noMap);
	}

	//공지사항 상세조회
	@Override
	public NoticeVo viewDetail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.viewDetail", no);
	}

	//조회수 증가
	@Override
	public int plusHit(SqlSessionTemplate sst, String no) {
		return sst.update("notice.plusHit", no);
	}

	//공지사항 카테고리 조회
	@Override
	public List<NoticeCategoryVo> getCategory(SqlSessionTemplate sst) {
		return sst.selectList("notice.getCategory");
	}

	//투표 생성
	@Override
	public int makeVote(SqlSessionTemplate sst, VoteVo vvo) {
		return sst.insert("notice.makeVote", vvo);
	}

	//투표항목 삽입
	@Override
	public int insertVoteArticle(SqlSessionTemplate sst, List<VoteCandidateVo> vcvoList) {
		return sst.insert("notice.insertVoteArticle", vcvoList);
	}

	//투표 불러오기
	@Override
	public VoteVo getVote(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.getVote", no);
	}

	//투표항목 불러오기
	@Override
	public List<VoteCandidateVo> getVoteCandidate(SqlSessionTemplate sst, String no) {
		return sst.selectList("notice.getVoteCandidate",no);
	}

	//총 투표 수
	@Override
	public int countVoteTotal(SqlSessionTemplate sst, String no) {
		return sst.selectOne("notice.countVoteTotal", no);
	}

	//항목별 득표 수
	@Override
	public List<Integer> countEachCandidate(SqlSessionTemplate sst, String no) {
		return sst.selectList("notice.countEachCandidate", no);
	}

	//투표 여부
	@Override
	public int checkVoteYn(SqlSessionTemplate sst, PersonalVoteVo pvvo) {
		return sst.selectOne("notice.checkVoteYn", pvvo);
	}

	//투표 제출
	@Override
	public int insertPersonalVote(SqlSessionTemplate sst, PersonalVoteVo pvvo) {
		return sst.insert("notice.insertPersonalVote", pvvo);
	}

	//투표 취소
	@Override
	public int deletePersonalVote(SqlSessionTemplate sst, PersonalVoteVo pvvo) {
		return sst.delete("notice.deletePersonalVote", pvvo);
	}

}
