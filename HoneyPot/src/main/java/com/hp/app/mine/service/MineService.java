package com.hp.app.mine.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;
import com.hp.app.page.vo.PageVo;

public interface MineService {
	int register(MineVo mvo,int mineCno);
	List<MineVo> getAllList(MemberVo loginMember);
	List<MineVo> getAllList(PageVo pv);
	
	int getAllCnt();
	MineVo getDetailAdmin(int no);
	List<MineVo> searchAllList(Map<String, String> searchValueMap);
}
