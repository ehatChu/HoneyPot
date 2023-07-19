package com.hp.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.dao.MemberDao;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final SqlSessionTemplate sst;
	private final MemberDao dao;
	private final BCryptPasswordEncoder pwdEncoder;

	@Override
	public MemberVo mlogin(MemberVo vo) {
		MemberVo loginMember = null;
		try {
			loginMember = dao.mlogin(sst, vo);
			if(loginMember == null) {
				return null;
			}
			
			boolean isMatch1 = pwdEncoder.matches(vo.getPwd(), loginMember.getPwd());
			boolean isMatch2 = (loginMember.getPwd().equals(vo.getPwd()));
			if (!(isMatch1 || isMatch2)) {
				throw new Exception();
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return loginMember;
	}
	
	@Override
	public AdminVo alogin(AdminVo vo) {
		AdminVo loginAdmin = null;
		try {
			loginAdmin = dao.alogin(sst, vo);
			if(loginAdmin == null) {
				return null;
			}
			
			boolean isMatch1 = pwdEncoder.matches(vo.getPwd(), loginAdmin.getPwd());
			boolean isMatch2 = (loginAdmin.getPwd().equals(vo.getPwd()));
			if (!(isMatch1 || isMatch2)) {
				throw new Exception();
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		
		return loginAdmin;
	}
	
	@Override
	public int mjoin(MemberVo vo) {
		String pwd = vo.getPwd();
		vo.setPwd(pwdEncoder.encode(pwd));
		return dao.mjoin(sst, vo);
	}

	@Override
	public int ajoin(AdminVo vo) {
		String pwd = vo.getPwd();
		vo.setPwd(pwdEncoder.encode(pwd));
		return dao.ajoin(sst, vo);
	}

	@Override
	public int medit(MemberVo vo) {
		return dao.medit(sst, vo);
	}

	@Override
	public int aedit(AdminVo vo) {
		return dao.aedit(sst, vo);
	}
}
