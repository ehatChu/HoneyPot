package com.hp.app.mine.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;

@Repository
public class MineDaoImpl implements MineDao {

	@Override
	public int register(SqlSessionTemplate sst,MineVo mvo) {
		return sst.insert("mine.registerCar",mvo);
	}

	@Override
	public List<MineVo> getMyCarList(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.selectList("mine.getMyCarList",loginMember);
	}
	 
	
	
}