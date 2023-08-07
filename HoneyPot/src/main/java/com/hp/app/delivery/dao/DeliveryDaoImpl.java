package com.hp.app.delivery.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryDaoImpl implements DeliveryDao{

	// 배달 삽입
	@Override
	public int insertDelivery(SqlSessionTemplate sst, Map<String, Object> msgVo) {
		return sst.insert("delivery.insertDelivery", msgVo);
	}

	// 택배 삽입
	@Override
	public int insertParcel(SqlSessionTemplate sst, Map<String, Object> msgVo) {
		return sst.insert("delivery.insertParcel", msgVo);
	}

	
	
}
