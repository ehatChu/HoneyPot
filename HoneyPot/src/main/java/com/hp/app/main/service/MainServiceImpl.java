package com.hp.app.main.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.calendar.vo.MemberCalendarVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;
import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.main.dao.MainDao;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
	private final MainDao dao;
	private final SqlSessionTemplate sst;

	@Override
	public AdminVo getCaptain(String name) {
		return dao.getCaptain(sst, name);
	}

	@Override
	public int getCaptainLoveCnt(String no) {
		return dao.getCaptainLoveCnt(sst, no);
	}

	@Override
	public int getCaptainHateCnt(String no) {
		return dao.getCaptainHateCnt(sst, no);
	}

	@Override
	public int voteCaptainLove(String[] arr) {
		return dao.voteCaptainLove(sst, arr);
	}

	@Override
	public int getNoticeCnt() {
		return dao.getNoticeCnt(sst);
	}

	@Override
	public List<NoticeVo> getNoticeList(PageVo pv) {
		return dao.getNoticeList(sst, pv);
	}

	@Override
	public String getMyCaptainLove(String[] paramArr) {
		return dao.getMyCaptainLove(sst, paramArr);
	}

	@Override
	public int getPopularCnt() {
		return dao.getPopularCnt(sst);
	}

	@Override
	public List<NoticeVo> getPopularList(PageVo pv) {
		return dao.getPopularList(sst, pv);
	}

	@Override
	public List<MemberCalendarVo> getMemberCalendarList(String no) {
		return dao.getMemberCalendarList(sst, no);
	}

	@Override
	public List<MemberVo> getMemberPointList() {
		return dao.getMemberPointList(sst);
	}

	@Override
	public List<MemberVo> getDongPointList() {
		return dao.getDongPointList(sst);
	}

	@Override
	public List<NoticeCalendarVo> getNoticeCalendarList() {
		return dao.getNoticeCalendarList(sst);
	}

	@Override
	public int[] getParamCntArr() {
		int[] paramCntArr = new int[4];
		paramCntArr[0] = dao.getReportCnt(sst);
		paramCntArr[1] = dao.getQnaCnt(sst);
		paramCntArr[2] = dao.getNormalMemberCnt(sst);
		paramCntArr[3] = dao.getWaitMemberCnt(sst);

		return paramCntArr;
	}

	@Override
	public List<AdminFeeVo> getAdminFeeList() {
		return dao.getAdminFeeList(sst);
	}

}
