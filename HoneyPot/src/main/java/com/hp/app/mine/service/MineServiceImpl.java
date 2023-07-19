package com.hp.app.mine.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.mine.dao.MineDao;
import com.hp.app.mine.vo.MineVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class MineServiceImpl implements MineService{
	private final SqlSessionTemplate sst;
	private final MineDao dao;
	@Override
	public int register(MineVo mvo) {
		log.info("서비스 레지스터 전");
		return dao.register(sst, mvo); 
	}

}
