package com.hp.app.fee.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.fee.vo.MemberFeeVo;


@Repository
public class FeeDaoImpl implements FeeDao{

	@Override
	public List<MemberFeeVo> memberFeeList(SqlSessionTemplate sst, String mno) {
		return sst.selectList("fee.selectMemberFeeList", mno);
	}

	@Override
	public int totalMemberFee(SqlSessionTemplate sst, String mno) {
		return sst.selectOne("fee.memeberTotalPrice", mno);
	}

}
