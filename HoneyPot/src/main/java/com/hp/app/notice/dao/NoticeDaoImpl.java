package com.hp.app.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeVo;
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

	//공지사항 상세조회 (+ 조회수 증가)
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

}
