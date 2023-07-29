package com.hp.app.innerFac.service;

import java.util.List;
import java.util.Map;

import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;

public interface InnerFacService {
	InnerFacVo getOpenCloseTime(int no);
	int makeReservation(InnerFacRsVo rsVo);
	List<String> getReservationTimeInfo(InnerFacRsVo rsVo);
	int getReservedPeopleCntByTime(Map<String, String> map);
//	int updateCancelStatus(InnerFacRsVo rsVo);
	int delete(InnerFacRsVo rsVo);
}
