package com.hp.app.mine.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.mine.dao.MineDao;
import com.hp.app.mine.vo.MineVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MineServiceImpl implements MineService{
	private final SqlSessionTemplate sst;
	private final MineDao dao;
	@Override
	public int register(MineVo mvo) {
		return dao.register(sst, mvo); 
	}

}
