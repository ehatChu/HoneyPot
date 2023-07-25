package com.hp.app.fee.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.fee.vo.AdminFeeVo;
import com.hp.app.fee.vo.MemberFeeVo;
import com.hp.app.page.vo.PageVo;


@Repository
public class FeeDaoImpl implements FeeDao{

	@Override
	public List<MemberFeeVo> memberFeeList(SqlSessionTemplate sst, String mno) {
		return sst.selectList("fee.selectMemberFeeList", mno);
	}

	@Override
	public int totalMemberFee(SqlSessionTemplate sst, String mno) {
		return sst.selectOne("fee.memberTotalPrice", mno);
	}

	@Override
	public int adminListCnt(SqlSessionTemplate sst, Map<String, String> searchVo) {
		return sst.selectOne("fee.adminFeeCnt", searchVo);
	}

	@Override
	public List<AdminFeeVo> adminList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchVo) {
		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		return sst.selectList("fee.adminFeeList", searchVo, rb);
	}

	@Override
	public int add(SqlSessionTemplate sst, AdminFeeVo vo) {
		return sst.insert("fee.addFee", vo);
	}

	@Override
	public int delete(SqlSessionTemplate sst,String no) {
		return sst.delete("fee.delete",no);
	}

}
