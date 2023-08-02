package com.hp.app.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.page.vo.PageVo;
import com.hp.app.point.vo.PointVo;

@Repository
public class PointDaoImpl implements PointDao{

	// 회원
	// 상벌점 전체 리스트 조회(점수용)
	@Override
	public List<PointVo> getMyPointListScore(SqlSessionTemplate sst, String no) {
		return sst.selectList("point.getMyPointListScore", no);
	}

	// 상벌점 전체 리스트 조회(검색용)
	@Override
	public List<PointVo> getMyPointList(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectList("point.getMyPointList", searchMap);
	}
	
	// 관리자
	// 상벌점 전체 갯수
	@Override
	public int getPointCntAdmin(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("point.getPointCntAdmin", searchMap);
	}

	// 상벌점 List 조회
	@Override
	public List<PointVo> getPointListAdmin(SqlSessionTemplate sst, PageVo pvo, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pvo.getOffset(), pvo.getBoardLimit()); // (건널 뛸 갯수, 보여줄 갯수)
		return sst.selectList("point.getPointListAdmin", searchMap, rb);
	}

	// 상벌점 상세조회
	@Override
	public PointVo getPointByNo(SqlSessionTemplate sst, String pno) {
		return sst.selectOne("point.getPointByNo", pno);
	}

	// 상벌점 삭제
	@Override
	public int deletePoint(SqlSessionTemplate sst, String pno) {
		return sst.delete("point.deletePoint", pno);
	}

	// 상벌점 수정
	@Override
	public int editPoint(SqlSessionTemplate sst, PointVo vo) {
		return sst.update("point.editPoint", vo);
	}




}
