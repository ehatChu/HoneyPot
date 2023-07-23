package com.hp.app.account.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.account.dao.AccountDao;
import com.hp.app.account.vo.AccountVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class AccountServiceImpl implements AccountService{
	
	private final AccountDao dao;
	private final SqlSessionTemplate sst;

	@Override
	public List<AccountVo> list(PageVo pv,  Map<String, String> searchVo) {
		return dao.list(sst,pv, searchVo);
	}
	
	@Override
	public int listCnt(String mno,  Map<String, String> searchVo) {
		return dao.listCnt(sst, searchVo);
	}

	@Override
	public int add(AccountVo vo) {
		return dao.add(sst, vo);
	}

	@Override
	public AccountVo detail(String no) {
		return dao.detail(sst, no);
	}

	@Override
	public int edit(AccountVo vo) {
		return dao.edit(sst, vo);
	}

	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}

	@Override
	public List<AccountVo> calendarList(String mno) {
		return dao.calendarList(sst, mno);
	}

	@Override
	public List<AccountVo> getChart(String mno) {
		return dao.getChart(sst, mno);
	}
	

	
}
