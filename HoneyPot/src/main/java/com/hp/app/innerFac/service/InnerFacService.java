package com.hp.app.innerFac.service;

import java.util.List;
import java.util.Map;

import com.hp.app.innerFac.vo.InnerFacImgVo;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;

public interface InnerFacService {
	InnerFacVo getOpenCloseTime(int no);
	int makeReservation(InnerFacRsVo rsVo);
	List<String> getReservationTimeInfo(InnerFacRsVo rsVo);
	int getReservedPeopleCntByTime(Map<String, String> map);
//	int updateCancelStatus(InnerFacRsVo rsVo);
	int delete(InnerFacRsVo rsVo);
	InnerFacVo getInnerFacInfo(int no);
	List<String> getInnerFacImg(int no);
	//정보변경
	int updateInnerFacInfo(Map<String, String> infoMap);
	//관리자이미지목록조회
	List<InnerFacImgVo> getInnerFacImgList(String facNo);
	//이미지 추가
	int addInnerFacImg(Map<String, String> infoMap);
	//이미지 삭제
	int deleteInnerFacImg(int[] no);
}
