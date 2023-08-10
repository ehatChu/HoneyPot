package com.hp.app.innerFac.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.innerFac.vo.InnerFacImgVo;
import com.hp.app.innerFac.vo.InnerFacInfoRsVo;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;
import com.hp.app.page.vo.PageVo;

public interface InnerFacDao {
	//리스트로 담을까 그냥 vo에 담기만할까? 모두다 조회해서 시간만 리턴하면 되는거 아님?
	List<InnerFacVo> getAllInnerFacInfo(SqlSessionTemplate sst);
	InnerFacVo getOpenCloseTime(SqlSessionTemplate sst,int no);
	int makeReservation(SqlSessionTemplate sst, InnerFacRsVo rsVo);
	List<InnerFacRsVo> getReservationTimeInfo(SqlSessionTemplate sst, InnerFacRsVo rsVo);
	int getReservedPeopleCntByTime(SqlSessionTemplate sst, Map<String, String> map);
	int getMaxPeopleCnt(SqlSessionTemplate sst ,String amenityNo);
//	int updateCancelStatus(SqlSessionTemplate sst, InnerFacRsVo rsVo);
	int delete(SqlSessionTemplate sst, InnerFacRsVo rsVo);
	InnerFacVo getInnerFacInfo(SqlSessionTemplate sst, int no);
	List<String> getInnerFacImg(SqlSessionTemplate sst, int no);
	//정보변경
	int updateInnerFacInfo(SqlSessionTemplate sst, Map<String, String> infoMap);
	//관리자이미지목록조회
	List<InnerFacImgVo> getInnerFacImgList(SqlSessionTemplate sst, String facNo);
	//사진추가
	int addInnerFacImg(SqlSessionTemplate sst, Map<String, String> infoMap);
	//사진삭제
	int deleteInnerFacImg(SqlSessionTemplate sst, int[] no);
	//개인모든일정조회
	List<InnerFacRsVo> getAllPersonalReservation(SqlSessionTemplate sst, String memberNo, PageVo pv);
	//개인조회갯수
	int getPersonalCnt(SqlSessionTemplate sst, String memberNo);
	//예약취소-버튼으로
	int deleteReservation(SqlSessionTemplate sst, String no);
	//관리자예약조회
	int getAllCnt(SqlSessionTemplate sst, Map<String, String> searchValueMap);
	//관리자예약조회
	List<InnerFacInfoRsVo> searchAllReservation(SqlSessionTemplate sst, Map<String, String> searchValueMap, PageVo pv);
}
