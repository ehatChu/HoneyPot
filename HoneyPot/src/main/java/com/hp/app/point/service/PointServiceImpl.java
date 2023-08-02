package com.hp.app.point.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.page.vo.PageVo;
import com.hp.app.point.dao.PointDao;
import com.hp.app.point.vo.PointVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PointServiceImpl implements PointService{
	
	private final PointDao dao;
	private final SqlSessionTemplate sst;

	// 회원
	
	// 관리자
	// 상벌점 전체 갯수
	@Override
	public int getPointCntAdmin(Map<String, String> searchMap) {
		return dao.getPointCntAdmin(sst, searchMap);
	}
	
	// 상벌점 List 조회
	@Override
	public List<PointVo> getPointListAdmin(PageVo pvo, Map<String, String> searchMap) {
		return dao.getPointListAdmin(sst, pvo, searchMap);
	}

	// 상벌점 상세조회
	@Override
	public PointVo getPointByNo(String pno) {
		return dao.getPointByNo(sst, pno);
	}

	// 상벌점 삭제
	@Override
	public int deletePoint(String pno) {
		return dao.deletePoint(sst, pno);
	}

	// 상벌점 수정
	@Override
	public PointVo editPoint(PointVo vo) throws Exception {
		
		int result = dao.editPoint(sst, vo);
	
		if(result != 1) {
			throw new Exception("상벌점 수정 실패");
		}
		
		PointVo changeVo = dao.getPointByNo(sst, vo.getNo());
		
		return changeVo;
	}
	

}
