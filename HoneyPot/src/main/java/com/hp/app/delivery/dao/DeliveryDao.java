package com.hp.app.delivery.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.delivery.vo.DeliveryVo;
import com.hp.app.delivery.vo.ParcelVo;

public interface DeliveryDao {

	// 배달 삽입
	int insertDelivery(SqlSessionTemplate sst, List<DeliveryVo> receiveVo);
	
	// 택배 삽입
	int insertParcel(SqlSessionTemplate sst, List<DeliveryVo> receiveVo);

	// 택배 알람 가져오기
	List<ParcelVo> getParcelList(SqlSessionTemplate sst, String memberNo);

	// 택배 알람 삭제
	int deleteParcel(SqlSessionTemplate sst, String pno);
	
}
