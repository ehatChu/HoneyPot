package com.hp.app.point.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.page.vo.PageVo;
import com.hp.app.point.vo.PointVo;

public interface PointDao {

	// 회원
	
	// 관리자
	// 상벌점 전체 갯수
	int getPointCntAdmin(SqlSessionTemplate sst, Map<String,String> searchMap);
	
	// 상벌점 List 조회
	List<PointVo> getPointListAdmin(SqlSessionTemplate sst, PageVo pvo, Map<String,String> searchMap);
	
	// 상벌점 상세조회
	PointVo getPointByNo(SqlSessionTemplate sst, String pno);
	
	// 상벌점 삭제
	int deletePoint(SqlSessionTemplate sst, String pno);

	// 상벌점 수정
	int editPoint(SqlSessionTemplate sst, PointVo vo);
	
}
