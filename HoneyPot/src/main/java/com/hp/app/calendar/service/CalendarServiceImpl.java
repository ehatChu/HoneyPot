package com.hp.app.calendar.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.calendar.dao.CalendarDao;
import com.hp.app.calendar.vo.AllCalendarVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Transactional
@Service
@RequiredArgsConstructor
@Slf4j
public class CalendarServiceImpl implements CalendarService {
	private final CalendarDao dao;
	private final SqlSessionTemplate sst;
	
	//멤버일정등록
	@Override
	public int regiMemberSchedule(Map<String, String> regiInfoMap) {
		return dao.regiMemberSchedule(sst,regiInfoMap);
	}

	//관리자일정등록
	@Override
	public int regiAdminSchedule(Map<String, String> regiInfoMap) {
		return dao.regiAdminSchedule(sst,regiInfoMap);
	}
	
	//멤버 선택한 일의 아파트 일정 조회
	@Override
	public List<NoticeCalendarVo> getNoticeCal(Map<String, String> infoMap) {
		return dao.getNoticeCal(sst,infoMap);
	}
	
	//달력표시,아파트일정, 모든일정, 해당동의
	@Override
	public List<AllCalendarVo> getAllNoticeCalByDong(String dongName) {
		
		//동대표 자르기 
		List<AllCalendarVo> noticeList = dao.getAllNoticeCalByDong(sst,dongName);
		log.info("Befor noticeList : {}",noticeList);
		for(int i=0;i<noticeList.size();i++) {
			if(noticeList.get(i).getWriterName().contains("동대표")) {
				noticeList.get(i).setWriterName("동대표");				
			}
		}
		log.info("After noticeList : {}",noticeList);
		
		return noticeList;
	}
	//달력표시 ,개인일정, 모든일정
	@Override
	public List<AllCalendarVo> getAllMemberCalByPerson(String memberNo) {
		return dao.getAllMemberCalByPerson(sst,memberNo);
	}
	
	//목록용, 개인 일정조회
	@Override
	public List<AllCalendarVo> getPersonalCal(Map<String, String> infoMap) {
		return dao.getPersonalCal(sst,infoMap);
	}
	
	
	//개인일정삭제
	@Override
	public int deletePersonal(String sNum) {
		return dao.deletePersonal(sst,sNum);
	}
	
	//관리자모든일정표시
	@Override
	public List<AllCalendarVo> getAllNoticeCal(String dongName) {
		return dao.getAllNoticeCal(sst,dongName);
	}
	
	//관리자일정삭제
	@Override
	public int deleteNotice(String sNum) {
		return dao.deleteNotice(sst,sNum);
	}
	
	

	//관리자일정조회
	
}
