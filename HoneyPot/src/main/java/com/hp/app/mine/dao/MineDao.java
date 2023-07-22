package com.hp.app.mine.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;

public interface MineDao {
	int registerCar(SqlSessionTemplate sst,MineVo mvo);
	int registerBicycle(SqlSessionTemplate sst,MineVo mvo);
	List<MineVo> getCarList(SqlSessionTemplate sst, MemberVo loginMember);
	List<MineVo> getBicycleList(SqlSessionTemplate sst, MemberVo loginMember);

}
