package com.hp.app.innerFac.service;

import java.util.List;
import java.util.Map;

import com.hp.app.innerFac.vo.InnerFacImgVo;
import com.hp.app.innerFac.vo.InnerFacInfoRsVo;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;
import com.hp.app.page.vo.PageVo;

public interface InnerFacService {
	InnerFacVo getOpenCloseTime(int no);
	int makeReservation(InnerFacRsVo rsVo);
	List<InnerFacRsVo> getReservationTimeInfo(InnerFacRsVo rsVo);
	int getReservedPeopleCntByTime(Map<String, String> map);
//	int updateCancelStatus(InnerFacRsVo rsVo);
	//예약취소-예약페이지에서
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
	//개인모든일정조회
	List<InnerFacRsVo> getAllPersonalReservation(String memberNo, PageVo pv);
	//개인조회갯수
	int getPersonalCnt(String memberNo);
	//예약취소-버튼으로
	int deleteReservation(String no);
	//관리자예약조회
	int getAllCnt(Map<String, String> searchValueMap);
	//관리자예약조회
	List<InnerFacInfoRsVo> searchAllReservation(Map<String, String> searchValueMap, PageVo pv);

}
