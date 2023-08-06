package com.hp.app.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public MemberVo mlogin(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.mlogin", vo);
	}

	@Override
	public AdminVo alogin(SqlSessionTemplate sst, AdminVo vo) {
		return sst.selectOne("member.alogin", vo);
	}

	@Override
	public int mjoin(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("member.mjoin", vo);
	}

	@Override
	public int ajoin(SqlSessionTemplate sst, AdminVo vo) {
		return sst.insert("member.ajoin", vo);
	}

	@Override
	public int medit(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("member.medit", vo);
	}

	@Override
	public int aedit(SqlSessionTemplate sst, AdminVo vo) {
		return sst.update("member.aedit", vo);
	}

	@Override
	public int midDubCheck(SqlSessionTemplate sst, String id) {
		return sst.selectOne("member.midDubCheck", id);
	}
	
	@Override
	public int aidDubCheck(SqlSessionTemplate sst, String id) {
		return sst.selectOne("member.aidDubCheck", id);
	}

	@Override
	public int quit(SqlSessionTemplate sst, String no) {
		return sst.update("member.quit", no);
	}

	@Override
	public String findId(SqlSessionTemplate sst, String email) {
		return sst.selectOne("member.findId", email);
	}

	@Override
	public String findPwd(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("member.findPwd", vo);
	}

	@Override
	public int emailChangePwd(SqlSessionTemplate sst, MemberVo vo) {
		System.out.println(vo);
		return sst.update("member.emailChangePwd", vo);
	}

	
}
