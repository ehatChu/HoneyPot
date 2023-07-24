package com.hp.app.fee.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.fee.dao.FeeDao;
import com.hp.app.fee.vo.MemberFeeVo;

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

}
