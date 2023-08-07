package com.hp.app.innerFac.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.innerFac.vo.InnerFacImgVo;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;

@Repository
public class InnerFacDaoImpl implements InnerFacDao {
	//모든정보조회 쿼리문 실행
	@Override
	public List<InnerFacVo> getAllInnerFacInfo(SqlSessionTemplate sst) {
		return sst.selectList("innerFac.getAllInnerFacInfo");
	}
	
	//오픈마감시간 구하는 쿼리문 실행
	@Override
	public InnerFacVo getOpenCloseTime(SqlSessionTemplate sst, int no) {
		return sst.selectOne("innerFac.getOpenCloseTime",no);
	}

	//예약하기 sql실행
	@Override
	public int makeReservation(SqlSessionTemplate sst, InnerFacRsVo rsVo) {
		int result=0;
		try {
			result = sst.insert("innerFac.makeReservation",rsVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//한사람의 해당날짜의 예약현황가져오기
	@Override
	public List<String> getReservationTimeInfo(SqlSessionTemplate sst, InnerFacRsVo rsVo) {
		return sst.selectList("innerFac.getReservationTimeInfo",rsVo);
	}

	//선택한 시간에 해당 시설에 예약한 사람의 수를 반환
	@Override
	public int getReservedPeopleCntByTime(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("innerFac.getReservedPeopleCntBytime",map);
	}
	
	//최대인원조회, 시설번호를 매개변수로하는
	@Override
	public int getMaxPeopleCnt(SqlSessionTemplate sst,String amenityNo) {
		return sst.selectOne("innerFac.getMaxPeopleCnt",amenityNo);
	}

	//삭제
	@Override
	public int delete(SqlSessionTemplate sst, InnerFacRsVo rsVo) {
		return sst.delete("innerFac.delete",rsVo);
	}
	
	//시설정보조회
	@Override
	public InnerFacVo getInnerFacInfo(SqlSessionTemplate sst, int no) {
		return sst.selectOne("innerFac.getInnerFacInfo",no);
	}
	//시설이지미 조회
	@Override
	public List<String> getInnerFacImg(SqlSessionTemplate sst, int no) {
		return sst.selectList("innerFac.getInnerFacImg",no);
	}
	//정보변경
	@Override
	public int updateInnerFacInfo(SqlSessionTemplate sst, Map<String, String> infoMap) {
		int result =0;
		try {
			result = sst.update("innerFac.updateInnerFacInfo",infoMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
