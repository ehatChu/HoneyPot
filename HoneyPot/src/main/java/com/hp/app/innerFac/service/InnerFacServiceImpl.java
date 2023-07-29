package com.hp.app.innerFac.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.innerFac.dao.InnerFacDao;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;

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
	


}
