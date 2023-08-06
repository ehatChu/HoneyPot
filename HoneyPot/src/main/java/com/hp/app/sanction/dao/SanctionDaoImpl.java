package com.hp.app.sanction.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.page.vo.PageVo;
import com.hp.app.sanction.vo.SanctionVo;

@Repository
public class SanctionDaoImpl implements SanctionDao{

	// 제재내역 전체 갯수 조회
	@Override
	public int getSanctionListCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("sanction.getSanctionListCnt", searchMap);
	}

	// 제재내역 List 조회
	@Override
	public List<SanctionVo> getSanctionList(SqlSessionTemplate sst, PageVo pvo, Map<String, String> searchMap) {
		RowBounds rb = new RowBounds(pvo.getOffset(), pvo.getBoardLimit()); // (건널 뛸 갯수, 보여줄 갯수)
		return sst.selectList("sanction.getSanctionList", searchMap, rb);
	}

	// 제재내역 상세조회
	@Override
	public SanctionVo getSanctionByNo(SqlSessionTemplate sst, String sno) {
		return sst.selectOne("sanction.getSanctionByNo", sno);
	}

	// 제재내역 삭제
	@Override
	public int deleteSanction(SqlSessionTemplate sst, String sno) {
		return sst.delete("sanction.deleteSanction", sno);
	}

	// 제재 자동으로 정지 풀어주기
	@Override
	public int releaseMember(SqlSessionTemplate sst) {
		return sst.update("sanction.releaseMember");
	}
	
	// 제재 완료 처리 해주기
	public int releaseSanction(SqlSessionTemplate sst) {
		return sst.update("sanction.releaseSanction");
	}

	
	
}
