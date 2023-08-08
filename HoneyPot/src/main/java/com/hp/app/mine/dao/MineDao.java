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
	List<MineVo> getCarList(SqlSessionTemplate sst,PageVo pv);
	List<MineVo> getCarList(SqlSessionTemplate sst, MemberVo loginMember);
	int getCarCnt(SqlSessionTemplate sst,Map<String, String> map);
	MineVo getDetailAdmin(SqlSessionTemplate sst, Map<String, String> map);
	List<MineVo> searchAllList(SqlSessionTemplate sst, Map<String, String> searchValueMap, PageVo pv);
	int deleteProperty(SqlSessionTemplate sst,Map<String, String> map);
	//승인
	int acceptPropertyList(SqlSessionTemplate sst, Map<String, Object> infoMap);
}
