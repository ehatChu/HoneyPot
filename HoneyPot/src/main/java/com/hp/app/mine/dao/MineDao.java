package com.hp.app.mine.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;

public interface MineDao {
	int register(SqlSessionTemplate sst,MineVo mvo);
	List<MineVo> getMyCarList(SqlSessionTemplate sst, MemberVo loginMember);
}
