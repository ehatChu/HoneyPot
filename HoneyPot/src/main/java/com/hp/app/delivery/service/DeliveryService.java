package com.hp.app.delivery.service;

import java.util.List;
import java.util.Map;

import com.hp.app.delivery.vo.DeliveryVo;
import com.hp.app.delivery.vo.ParcelVo;

public interface DeliveryService {

	// 배달 추가
	int insertDelivery(List<DeliveryVo> receiveVo);
	
	// 택배 추가
	int insertParcel(List<DeliveryVo> receiveVo);

	// 택배 알람 가져오기
	List<ParcelVo> getParcelList(String memberNo);

	// 택배 알람 삭제
	List<ParcelVo> deleteParcel(String memberNo, String pno) throws Exception;
}
