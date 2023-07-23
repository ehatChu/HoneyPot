package com.hp.app.notice.service;

import java.util.List;
import java.util.Map;

import com.hp.app.notice.vo.NoticeVo;
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
	public abstract int delete(NoticeVo vo);
	
	//공지사항 상세조회
	public abstract NoticeVo viewNoticeDetail(NoticeVo vo);

}
