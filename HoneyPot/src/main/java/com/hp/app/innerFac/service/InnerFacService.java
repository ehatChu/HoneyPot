package com.hp.app.innerFac.service;

import java.util.List;

import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;

public interface InnerFacService {
	InnerFacVo getOpenCloseTime(int no);
	int makeReservation(InnerFacRsVo rsVo);
	List<InnerFacRsVo> getReservationByMemberNo(String memberNo);
}
