package com.hp.app.sanction.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.page.vo.PageVo;
import com.hp.app.sanction.dao.SanctionDao;
import com.hp.app.sanction.vo.SanctionVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class SanctionServiceImpl implements SanctionService{
	
	private final SanctionDao dao;
	private final SqlSessionTemplate sst;
	
	// 제재내역 전체 갯수 조회
	@Override
	public int getSanctionListCnt(Map<String, String> searchMap) {
		return dao.getSanctionListCnt(sst, searchMap);
	}

	// 제재내역 List 조회
	@Override
	public List<SanctionVo> getSanctionList(PageVo pvo, Map<String, String> searchMap) {
		// TODO Auto-generated method stub
		return dao.getSanctionList(sst, pvo, searchMap);
	}

	// 제재내역 상세조회
	@Override
	public SanctionVo getSanctionByNo(String sno) {
		return dao.getSanctionByNo(sst, sno);
	}

	// 제대내역 삭제
	@Override
	public int deleteSanction(String sno) {
		return dao.deleteSanction(sst, sno);
	}

	// 제재 자동으로 정지 풀어주기
	@Override
	public int releaseMember() {
//		System.out.println("정지 해제 호출됨");
		int result = dao.releaseMember(sst);
		dao.releaseSanction(sst);
		return result;
		
	}

	
	
}
