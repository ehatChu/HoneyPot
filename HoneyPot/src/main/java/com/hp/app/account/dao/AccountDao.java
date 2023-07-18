package com.hp.app.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.account.vo.AccountVo;
import com.hp.app.page.vo.PageVo;

public interface AccountDao {
	
	// 가계부 목록 조회
	List<AccountVo> list(SqlSessionTemplate sst, PageVo pv, String no);
	
	// 회원별 가계부 개수
	int list(SqlSessionTemplate sst, String no);
	
	// 가계부 추가
	int add(SqlSessionTemplate sst,AccountVo vo);
	
	// 가계부 상세조회
	AccountVo detail(SqlSessionTemplate sst,String no);
	
	// 가계부 수정
	int edit(SqlSessionTemplate sst,AccountVo vo);
	
	// 가계부 삭제
	int delete(SqlSessionTemplate sst,AccountVo vo);

}
