package com.hp.app.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.account.vo.AccountVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

public interface AccountDao {
	
	// 가계부 목록 조회
	List<AccountVo> list(SqlSessionTemplate sst, String mno, PageVo pv);

	// 목록 개수
	int listCnt(SqlSessionTemplate sst, String mno);
	
	// 가계부 추가
	int add(SqlSessionTemplate sst,AccountVo vo);
	
	// 가계부 상세조회
	AccountVo detail(SqlSessionTemplate sst,String no);
	
	// 가계부 수정
	int edit(SqlSessionTemplate sst,AccountVo vo);
	
	// 가계부 삭제
	int delete(SqlSessionTemplate sst,AccountVo vo);

	// 가계부 캘린더
	List<AccountVo> calendarList(SqlSessionTemplate sst, String mno);

	// 가계부 차트
	List<AccountVo> getChart(SqlSessionTemplate sst, String mno);
	
	
}
