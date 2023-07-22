package com.hp.app.mine.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;

public interface MineService {
	int register(MineVo mvo,int mineCno);
	List<MineVo> getCarList(MemberVo loginMember);
	List<MineVo> getBicycleList(MemberVo loginMember);
}
