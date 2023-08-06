package com.hp.app.sanction.service;

import java.util.List;
import java.util.Map;

import com.hp.app.page.vo.PageVo;
import com.hp.app.sanction.vo.SanctionVo;

public interface SanctionService {

	// 제재내역 전체 갯수 조회
	int getSanctionListCnt(Map<String,String> searchMap);
	
	// 제재내역 List 조회
	List<SanctionVo> getSanctionList(PageVo pvo, Map<String,String> searchMap);
	
	// 제재내역 상세조회
	SanctionVo getSanctionByNo(String sno);
	
	// 제재내역 삭제
	int deleteSanction(String sno);
	
	// 제재 자동으로 정지 풀어주기
	int releaseMember();
	
}
