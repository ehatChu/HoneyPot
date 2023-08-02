package com.hp.app.point.service;

import java.util.List;
import java.util.Map;

import com.hp.app.page.vo.PageVo;
import com.hp.app.point.vo.PointVo;

public interface PointService {

	// 회원
	
	// 관리자
	// 상벌점 전체 갯수
	int getPointCntAdmin(Map<String,String> searchMap);
	
	// 상벌점 List 조회
	List<PointVo> getPointListAdmin(PageVo pvo, Map<String,String> searchMap);

	// 상벌점 상세조회
	PointVo getPointByNo(String pno);

	// 상벌점 삭제
	int deletePoint(String pno);

	// 상벌점 수정
	PointVo editPoint(PointVo vo) throws Exception;
	
}
