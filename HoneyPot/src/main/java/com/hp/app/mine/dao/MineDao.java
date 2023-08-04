package com.hp.app.mine.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.vo.MineVo;
import com.hp.app.page.vo.PageVo;

public interface MineDao {
	int registerCar(SqlSessionTemplate sst,MineVo mvo);
	int registerBicycle(SqlSessionTemplate sst,MineVo mvo);
	List<MineVo> getAllList(SqlSessionTemplate sst,PageVo pv);
	List<MineVo> getAllList(SqlSessionTemplate sst, MemberVo loginMember);
	int getAllCnt(SqlSessionTemplate sst);
	MineVo getDetailAdmin(SqlSessionTemplate sst, int no);
	List<MineVo> searchAllList(SqlSessionTemplate sst, Map<String, String> searchValueMap);
}
