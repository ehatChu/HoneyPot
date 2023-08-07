package com.hp.app.delivery.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.delivery.dao.DeliveryDao;

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
	public int insertDelivery(Map<String, Object> msgVo) {
		return dao.insertDelivery(sst, msgVo);
	}

	// 택배 삽입
	@Override
	public int insertParcel(Map<String, Object> msgVo) {
		return dao.insertParcel(sst, msgVo);
	}

}
