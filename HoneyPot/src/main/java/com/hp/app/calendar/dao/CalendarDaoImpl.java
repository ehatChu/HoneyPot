package com.hp.app.calendar.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CalendarDaoImpl implements CalendarDao {
	//멤버일정등록
	@Override
	public int regiMemberSchedule(SqlSessionTemplate sst, Map<String, String> regiInfoMap) {
		int result = 0;
		try {
			result = sst.insert("calendar.regiMemberSchedule",regiInfoMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//관리자일정등록
	@Override
	public int regiAdminSchedule(SqlSessionTemplate sst, Map<String, String> regiInfoMap) {
		int result = 0;
		try {
			result = sst.insert("calendar.regiAdminSchedule",regiInfoMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("result : {} ",result);
		return result;
	}
	
	//멤버일정조회
	
	//관리자 일정조회

}
