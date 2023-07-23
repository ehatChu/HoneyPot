package com.hp.app.mine.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.dao.MineDao;
import com.hp.app.mine.vo.MineVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class MineServiceImpl implements MineService{
	private final SqlSessionTemplate sst;
	private final MineDao dao;
	
	@Override
	public int register(MineVo mvo,int mineCno) {
		if(mineCno==10) {
			return dao.registerCar(sst, mvo); 
			
		}else if(mineCno==20) {
			return dao.registerBicycle(sst, mvo);
		}else {
			throw new RuntimeException();
		}
	}
	@Override
	public List<MineVo> getCarList(MemberVo loginMember) {
		return dao.getCarList(sst, loginMember);
	}
	@Override
	public List<MineVo> getBicycleList(MemberVo loginMember) {
		
		return dao.getBicycleList(sst, loginMember);
	}
	@Override
	public List<MineVo> getAllList() {
		List<MineVo> mvoList = new ArrayList<MineVo>();
		//carList 호출하기
		mvoList.addAll(dao.getCarList(sst, null));
		
		//bicycle리스트 호출하기
		mvoList.addAll(dao.getBicycleList(sst, null));
		
		
		return mvoList;
	}

}
