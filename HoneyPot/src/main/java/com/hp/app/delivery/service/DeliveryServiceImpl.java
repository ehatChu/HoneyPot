package com.hp.app.delivery.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.delivery.dao.DeliveryDao;
import com.hp.app.delivery.vo.DeliveryVo;
import com.hp.app.delivery.vo.ParcelVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class DeliveryServiceImpl implements DeliveryService{

	private final DeliveryDao dao;
	private final SqlSessionTemplate sst;
	
	// 배달 삽입
	@Override
	public int insertDelivery(List<DeliveryVo> receiveVo) {
		return dao.insertDelivery(sst, receiveVo);
	}

	// 택배 삽입
	@Override
	public int insertParcel(List<DeliveryVo> receiveVo) {
		return dao.insertParcel(sst, receiveVo);
	}

	// 택배 알람 가져오기
	@Override
	public List<ParcelVo> getParcelList(String memberNo) {
		return dao.getParcelList(sst, memberNo);
	}

	// 택배 알람 삭제
	@Override
	public List<ParcelVo> deleteParcel(String memberNo, String pno) throws Exception {
		
		int result = dao.deleteParcel(sst, pno);
		
		if(result != 1) {
			throw new Exception("알림 삭제 에러");
		}
		return dao.getParcelList(sst, memberNo);
	}

}
