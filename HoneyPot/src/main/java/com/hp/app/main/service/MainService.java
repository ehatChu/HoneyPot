package com.hp.app.main.service;

import java.util.List;
import java.util.Map;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.calendar.vo.MemberCalendarVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

public interface MainService {

	AdminVo getCaptain(String name);

	int getCaptainLoveCnt(String no);

	int getCaptainHateCnt(String no);

	int voteCaptainLove(String[] arr);

	int getNoticeCnt();

	List<NoticeVo> getNoticeList(PageVo pv);

	String getMyCaptainLove(String[] paramArr);

	int getPopularCnt();

	List<NoticeVo> getPopularList(PageVo pv);

	List<MemberCalendarVo> getMemberCalendarList(String no);

	List<MemberVo> getMemberPointList();

	List<MemberVo> getDongPointList();

	List<NoticeCalendarVo> getNoticeCalendarList();

	int[] getParamCntArr();
}
