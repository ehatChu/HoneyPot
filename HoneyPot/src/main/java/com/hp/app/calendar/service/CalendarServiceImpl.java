package com.hp.app.calendar.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hp.app.calendar.dao.CalendarDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {
	private final CalendarDao dao;
	private final SqlSessionTemplate sst;
	
	//멤버일정등록
	@Override
	public int regiMemberSchedule(Map<String, String> regiInfoMap) {
		return dao.regiMemberSchedule(sst,regiInfoMap);
	}
	
	//관리자일정등록
	
	//멤버일정조회
	
	//관리자일정조회
	
}
