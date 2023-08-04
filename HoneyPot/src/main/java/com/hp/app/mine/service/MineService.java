package com.hp.app.mine.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;
import com.hp.app.page.vo.PageVo;

public interface MineService {
	int register(MineVo mvo,int mineCno);
	
	//개인 사윺물 조회
	List<MineVo> getCarList(MemberVo loginMember);
	//관리자 사유물 조회
	List<MineVo> getCarList(PageVo pv);
	
	int getCarCnt();
	MineVo getDetailAdmin(Map<String, String> map);
	List<MineVo> searchAllList(Map<String, String> searchValueMap);

	int deleteProperty(Map<String, String> map);
}
