package com.hp.app.delivery.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.delivery.vo.DeliveryVo;
import com.hp.app.delivery.vo.ParcelVo;

@Repository
public class DeliveryDaoImpl implements DeliveryDao{

	// 배달 삽입
	@Override
	public int insertDelivery(SqlSessionTemplate sst, List<DeliveryVo> receiveVo) {
		return sst.insert("delivery.insertDelivery", receiveVo);
	}

	// 택배 삽입
	@Override
	public int insertParcel(SqlSessionTemplate sst, List<DeliveryVo> receiveVo) {
		return sst.insert("delivery.insertParcel", receiveVo);
	}

	// 택배 알람 가져오기
	@Override
	public List<ParcelVo> getParcelList(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("delivery.getParcelList", memberNo);
	}

	// 택배 알림 삭제
	@Override
	public int deleteParcel(SqlSessionTemplate sst, String pno) {
		return sst.delete("delivery.deleteParcel", pno);
	}

	
	
}
