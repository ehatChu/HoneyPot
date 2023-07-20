package com.hp.app.main.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;

public interface MainDao {
	AdminVo getCaptain(SqlSessionTemplate sst, String name);

	int getCaptainLoveCnt(SqlSessionTemplate sst, String no);

	int getCaptainHateCnt(SqlSessionTemplate sst, String no);

	int voteCaptainLove(SqlSessionTemplate sst, String[] arr);
}
