package com.hp.app.fee.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.fee.dao.FeeDao;
import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class FeeServiceImpl implements FeeService{
	
	private final FeeDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<MemberFeeVo> memberFeeList(String mno) {
		return dao.memberFeeList(sst, mno);
	}

	@Override
	public int totalMemberFee(String mno) {
		return dao.totalMemberFee(sst, mno);
	}

	@Override
	public int adminListCnt(Map<String, String> searchVo) {
		return dao.adminListCnt(sst, searchVo);
	}

	@Override
	public List<AdminFeeVo> adminList(PageVo pv, Map<String, String> searchVo) {
		return dao.adminList(sst, pv, searchVo);
	}

	@Override
	public int add(AdminFeeVo vo) {
		return dao.add(sst, vo);
	}

	@Override
	public int delete(String no) {
		return dao.delete(sst,no);
	}

}
