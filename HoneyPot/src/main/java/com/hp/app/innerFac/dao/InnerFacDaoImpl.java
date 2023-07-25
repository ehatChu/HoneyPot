package com.hp.app.innerFac.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
