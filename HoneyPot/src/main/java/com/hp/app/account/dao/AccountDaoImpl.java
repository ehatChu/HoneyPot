package com.hp.app.account.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.account.vo.AccountVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class AccountDaoImpl implements AccountDao{

	@Override
	public List<AccountVo> list(SqlSessionTemplate sst,String mno, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		return sst.selectList("account.list", mno, rb);
	}
	
	@Override
	public int listCnt(SqlSessionTemplate sst, String mno) {
		return sst.selectOne("account.listCnt", mno);
	}
	
	@Override
	public int add(SqlSessionTemplate sst, AccountVo vo) {
		return sst.insert("account.add", vo);
	}

	@Override
	public AccountVo detail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("account.selectByNo", no);
	}

	@Override
	public int edit(SqlSessionTemplate sst, AccountVo vo) {
		return sst.update("account.edit", vo);
	}

	@Override
	public int delete(SqlSessionTemplate sst, AccountVo vo) {
		return sst.update("account.del", vo.getNo());
	}

	@Override
	public List<AccountVo> calendarList(SqlSessionTemplate sst, String mno) {
		return sst.selectList("account.list", mno);
	}

	@Override
	public List<AccountVo> getChart(SqlSessionTemplate sst, String mno) {
		return sst.selectList("account.selectByCategory" , mno);
	}



	
	

}
