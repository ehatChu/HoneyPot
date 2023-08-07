package com.hp.app.innerFac.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.innerFac.dao.InnerFacDao;
import com.hp.app.innerFac.vo.InnerFacImgVo;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Transactional
@Service
public class InnerFacServiceImpl implements InnerFacService {
	private final InnerFacDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public InnerFacVo getOpenCloseTime(int no) {
		
		InnerFacVo fvo = dao.getOpenCloseTime(sst, no);
		//문자를 다음에서 보내기
		//앞에 2글자만 전달되게 자르기
		
		
		fvo.setOpenTime(fvo.getOpenTime().substring(0,2));
		fvo.setCloseTime(fvo.getCloseTime().substring(0,2));
		
	
		
		return fvo;
	}
	//예약 insert
	@Override
	public int makeReservation(InnerFacRsVo rsVo) {
		//현재인원조회
		Map<String,String> map = new HashMap();
		map.put("amenityNo", rsVo.getAmenityNo());
		map.put("reserveTime", rsVo.getReserveTime());
		log.info("Map : {}",map);
		int nowNo =dao.getReservedPeopleCntByTime(sst,map);
	
		//max예약인원조회
		int maxNo = dao.getMaxPeopleCnt(sst,rsVo.getAmenityNo());
	
		log.info("nowNum :{} maxNum: {}",nowNo,maxNo);
		//인원에 따라 예약막기
		if(nowNo==maxNo) {
			throw new RuntimeException();
		}else {
			return dao.makeReservation(sst,rsVo);			
		}
		
	}
	
	//한사람의 한날짜의 예약내역 다가져오기
	@Override
	public List<String> getReservationTimeInfo(InnerFacRsVo rsVo) {
		return dao.getReservationTimeInfo(sst,rsVo);
	}

	//해당 시간에 해당 편의시설을 예약한 사람 수를 반환
	@Override
	public int getReservedPeopleCntByTime(Map<String, String> map) {
		return dao.getReservedPeopleCntByTime(sst,map);
	}
	//삭제
	@Override
	public int delete(InnerFacRsVo rsVo) {
		return dao.delete(sst,rsVo);
	}
	
	//시설정보
	@Override
	public InnerFacVo getInnerFacInfo(int no) {
		return dao.getInnerFacInfo(sst,no);
	}
	
	//시설이미지조회
	@Override
	public List<String> getInnerFacImg(int no) {
		return dao.getInnerFacImg(sst,no);
	}
	//정보변경
	@Override
	public int updateInnerFacInfo(Map<String, String> infoMap) {
		return dao.updateInnerFacInfo(sst,infoMap);
	}
	//관리자이미지목록조회
	@Override
	public List<InnerFacImgVo> getInnerFacImgList(String facNo) {
		return dao.getInnerFacImgList(sst, facNo);
	}
	//사진추가
	@Override
	public int addInnerFacImg(Map<String, String> infoMap) {
		return dao.addInnerFacImg(sst,infoMap);
	}
	//사진삭제
	@Override
	public int deleteInnerFacImg(int[] no) {
		return dao.deleteInnerFacImg(sst,no);
	}
	//개인모든일정조회
	@Override
	public List<InnerFacRsVo> getAllPersonalReservation(String memberNo, PageVo pv) {
		return dao.getAllPersonalReservation(sst,memberNo,pv);
	}
	//개인조회갯수
	@Override
	public int getPersonalCnt(String memberNo) {
		return dao.getPersonalCnt(sst,memberNo);
	}
	////예약취소-버튼으로
	@Override
	public int deleteReservation(String no) {
		return dao.deleteReservation(sst,no);
	}

	


}
