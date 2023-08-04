package com.hp.app.mine.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	//관리자 사유물조회
	@Override
	public List<MineVo> getAllList(PageVo pv) {
		List<MineVo>mvoList = new ArrayList<MineVo>();
		try {
			mvoList = dao.getAllList(sst, pv);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mvoList;
	}
	//개인사유물조회
	@Override
	public List<MineVo> getAllList(MemberVo loginMember) {
		return dao.getAllList(sst, loginMember);
	}
	
	@Override
	public int getAllCnt() {
		return dao.getAllCnt(sst);
	}
	//관리자 사유물 상세조회
	@Override
	public MineVo getDetailAdmin(int no) {
		return dao.getDetailAdmin(sst,no);
	}
	
	//전체검색
	@Override
	public List<MineVo> searchAllList(Map<String, String> searchValueMap) {
		return dao.searchAllList(sst,searchValueMap);
	}

}
