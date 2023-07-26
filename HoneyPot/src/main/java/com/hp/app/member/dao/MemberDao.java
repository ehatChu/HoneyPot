package com.hp.app.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;

public interface MemberDao {

	MemberVo mlogin(SqlSessionTemplate sst, MemberVo vo);

	AdminVo alogin(SqlSessionTemplate sst, AdminVo vo);

	int mjoin(SqlSessionTemplate sst, MemberVo vo);

	int ajoin(SqlSessionTemplate sst, AdminVo vo);

	int medit(SqlSessionTemplate sst, MemberVo vo);

	int aedit(SqlSessionTemplate sst, AdminVo vo);

	int idDubCheck(SqlSessionTemplate sst, String id);

}
