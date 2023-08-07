package com.hp.app.delivery.service;

import java.util.Map;

public interface DeliveryService {

	// 배달 추가
	int insertDelivery(Map<String, Object> msgVo);
	
	// 택배 추가
	int insertParcel(Map<String, Object> msgVo);
}
