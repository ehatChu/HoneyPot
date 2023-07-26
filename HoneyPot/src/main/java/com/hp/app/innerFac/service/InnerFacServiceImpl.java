package com.hp.app.innerFac.service;

import java.util.List;

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

	@Override
	public int makeReservation(InnerFacRsVo rsVo) {
		return dao.makeReservation(sst,rsVo);
	}
	
	//한사람의 모든 예약현황 가져오기
	@Override
	public List<InnerFacRsVo> getReservationByMemberNo(String memberNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
