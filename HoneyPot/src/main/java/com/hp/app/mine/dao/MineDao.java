package com.hp.app.mine.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.mine.vo.MineVo;

public interface MineDao {
	int register(SqlSessionTemplate sst,MineVo mvo);
}
