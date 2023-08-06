package com.hp.app.main.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.calendar.vo.MemberCalendarVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;
import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

public interface MainDao {
	AdminVo getCaptain(SqlSessionTemplate sst, String name);

	int getCaptainLoveCnt(SqlSessionTemplate sst, String no);

	int getCaptainHateCnt(SqlSessionTemplate sst, String no);

	int voteCaptainLove(SqlSessionTemplate sst, String[] arr);

	int getNoticeCnt(SqlSessionTemplate sst);

	List<NoticeVo> getNoticeList(SqlSessionTemplate sst, PageVo pv);

	String getMyCaptainLove(SqlSessionTemplate sst, String[] paramArr);

	int getPopularCnt(SqlSessionTemplate sst);

	List<NoticeVo> getPopularList(SqlSessionTemplate sst, PageVo pv);

	List<MemberCalendarVo> getMemberCalendarList(SqlSessionTemplate sst, String no);

	List<MemberVo> getMemberPointList(SqlSessionTemplate sst);

	List<MemberVo> getDongPointList(SqlSessionTemplate sst);

	List<NoticeCalendarVo> getNoticeCalendarList(SqlSessionTemplate sst);

	int getReportCnt(SqlSessionTemplate sst);

	int getQnaCnt(SqlSessionTemplate sst);

	int getNormalMemberCnt(SqlSessionTemplate sst);

	int getWaitMemberCnt(SqlSessionTemplate sst);

	List<AdminFeeVo> getAdminFeeList(SqlSessionTemplate sst);
}
