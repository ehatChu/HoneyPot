package com.hp.app.calendar.service;

import java.util.List;
import java.util.Map;

import com.hp.app.calendar.vo.AllCalendarVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;

public interface CalendarService {
	//멤버일정등록
	int regiMemberSchedule(Map<String, String> regiInfoMap);

	//관리자일정등록
	int regiAdminSchedule(Map<String, String> regiInfoMap);
	
	//멤버 선택한 일의 아파트 일정 조회
	List<NoticeCalendarVo> getNoticeCal(Map<String, String> infoMap);
	
	//아파트일정, 모든일정, 해당동의
	List<AllCalendarVo> getAllNoticeCalByDong(String dongName);
	
	//개인일정, 모든일정
	List<AllCalendarVo> getAllMemberCalByPerson(String memberNo);
	
	//목록용, 개인 일정조회
	List<AllCalendarVo> getPersonalCal(Map<String, String> infoMap);

	//개인일정삭제
	int deletePersonal(String sNum);
	
	//관리자모든일정표시
	List<AllCalendarVo> getAllNoticeCal(String dongName);
	
	
	//관리자일정조회
	
	
}
