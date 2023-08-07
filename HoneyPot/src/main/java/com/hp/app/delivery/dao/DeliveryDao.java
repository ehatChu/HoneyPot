package com.hp.app.delivery.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface DeliveryDao {

	// 배달 삽입
	int insertDelivery(SqlSessionTemplate sst, Map<String, Object> msgVo);
	
	// 택배 삽입
	int insertParcel(SqlSessionTemplate sst, Map<String, Object> msgVo);
	
}
