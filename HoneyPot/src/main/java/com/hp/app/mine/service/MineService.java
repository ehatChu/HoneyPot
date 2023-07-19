package com.hp.app.mine.service;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.mine.vo.MineVo;

public interface MineService {
	int register(MineVo mvo);
}
