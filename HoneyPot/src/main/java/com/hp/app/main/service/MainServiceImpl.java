package com.hp.app.main.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.main.dao.MainDao;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {
	private final MainDao dao;
	private final SqlSessionTemplate sst;

	@Override
	public AdminVo getCaptain(String name) {
		return dao.getCaptain(sst, name);
	}

	@Override
	public int getCaptainLoveCnt(String no) {
		return dao.getCaptainLoveCnt(sst, no);
	}

	@Override
	public int getCaptainHateCnt(String no) {
		return dao.getCaptainHateCnt(sst, no);
	}

	@Override
	public int voteCaptainLove(String[] arr) {
		return dao.voteCaptainLove(sst, arr);
	}

}
