package com.hp.app.account.service;

import java.util.List;

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
	public List<AccountVo> list(String mno, PageVo pv) {
		return dao.list(sst,mno,pv);
	}
	
	@Override
	public int listCnt(String mno) {
		return dao.listCnt(sst, mno);
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
		try {
			dao.edit(sst, vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(AccountVo vo) {
		return dao.delete(sst, vo);
	}

	

	
}
