package com.hp.app.mine.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.dao.MineDao;
import com.hp.app.mine.vo.MineVo;
import com.hp.app.page.vo.PageVo;

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
	public List<MineVo> getAllList(PageVo pvo) {
		return dao.getAllList(sst, pvo);
	}
	
	@Override
	public List<MineVo> getAllList(MemberVo loginMember) {
		return dao.getAllList(sst, loginMember);
	}
	
	@Override
	public int getAllCnt() {
		return dao.getAllCnt(sst);
	}

}
