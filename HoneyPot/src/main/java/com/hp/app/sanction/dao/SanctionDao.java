package com.hp.app.sanction.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.page.vo.PageVo;
import com.hp.app.sanction.vo.SanctionVo;

public interface SanctionDao {

	// 제재내역 전체 갯수 조회
	int getSanctionListCnt(SqlSessionTemplate sst, Map<String,String> searchMap);
	
	// 제재내역 List 조회
	List<SanctionVo> getSanctionList(SqlSessionTemplate sst, PageVo pvo, Map<String,String> searchMap);
	
	// 제재내역 상세조회
	SanctionVo getSanctionByNo(SqlSessionTemplate sst, String sno);
	
	// 제대내역 삭제
	int deleteSanction(SqlSessionTemplate sst, String sno);

	// 제재 자동으로 정지 풀어주기
	int releaseMember(SqlSessionTemplate sst);
	
	// 제재 완료 처리 해주기
	int releaseSanction(SqlSessionTemplate sst);
	
}
