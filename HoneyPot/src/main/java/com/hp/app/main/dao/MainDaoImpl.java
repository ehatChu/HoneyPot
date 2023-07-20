package com.hp.app.main.dao;

import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;

@Repository
public class MainDaoImpl implements MainDao{
	
	@Override
	public AdminVo getCaptain(SqlSessionTemplate sst, String name) {
		return sst.selectOne("main.getCaptain", name);
	}

	@Override
	public int getCaptainLoveCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("main.getCaptainLoveCnt", no);
	}

	@Override
	public int getCaptainHateCnt(SqlSessionTemplate sst, String no) {
		return sst.selectOne("main.getCaptainHateCnt", no);
	}

	@Override
	public int voteCaptainLove(SqlSessionTemplate sst, String[] arr) {
		List<String> list = Arrays.asList(arr);
		return sst.update("main.voteCaptainLove", list);
	}

}
