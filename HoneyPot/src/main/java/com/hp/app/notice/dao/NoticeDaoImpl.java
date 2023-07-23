package com.hp.app.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	//게시글 목록 조회 (검색조회)
	@Override
	public List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchVo) {
		RowBounds rb = new RowBounds(pv.getOffset(), pv.getBoardLimit());
		return sst.selectList("notice.getNoticeList", searchVo, rb);
	}

	//게시글 개수 (검색 게시글 개수)
	@Override
	public int countNotice(SqlSessionTemplate sst, Map<String, String> searchVo) {
		return sst.selectOne("notice.countNotice", searchVo);
	}

	//게시글 작성
	@Override
	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return 0;
	}

	//게시글 수정
	@Override
	public int edit(SqlSessionTemplate sst, NoticeVo vo) {
		return 0;
	}

	//게시글 삭제
	@Override
	public int delete(SqlSessionTemplate sst, NoticeVo vo) {
		return 0;
	}

	//게시글 상세조회 (+ 조회수 증가)
	@Override
	public NoticeVo viewNoticeDetail(SqlSessionTemplate sst, NoticeVo vo) {
		return null;
	}

	//조회수 증가
	@Override
	public int plusHit(SqlSessionTemplate sst, NoticeVo vo) {
		return 0;
	}

}
