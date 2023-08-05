package com.hp.app.calendar.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface CalendarDao {

	int regiMemberSchedule(SqlSessionTemplate sst, Map<String, String> regiInfoMap);
	
}
