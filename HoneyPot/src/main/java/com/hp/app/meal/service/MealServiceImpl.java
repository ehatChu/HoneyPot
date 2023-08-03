package com.hp.app.meal.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.meal.dao.MealDao;
import com.hp.app.meal.vo.MealVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MealServiceImpl implements MealService{
	private final MealDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<MealVo> getMealList(PageVo pv) {
		return dao.getMealList(sst, pv);
	}
	
	@Override
	public List<MealVo> getMealList() {
		return dao.getMealList(sst);
	}

	@Override
	public int getMealCnt() {
		return dao.getMealCnt(sst);
	}

	@Override
	public int applyBreakFast(Map<String, String> paramMap) {
		int applyCnt = dao.getApplyCnt(sst, paramMap);
		if(applyCnt == 1) {
			return 0;
		}
		return dao.applyBreakFast(sst, paramMap);
	}

	@Override
	public MealVo selectMeal(String no) {
		return dao.selectMeal(sst, no);
	}

	@Override
	public int editMeal(Map<String, String> paramMap) {
		return dao.editMeal(sst, paramMap);
	}

	@Override
	public List<MealVo> getDietList() {
		return dao.getDietList(sst);
	}

	@Override
	public List<MealVo> getApplyList(String no, PageVo pv) {
		return dao.getApplyList(sst, no, pv);
	}

	@Override
	public int cancelApply(String no) {
		return dao.cancelApply(sst, no);
	}

}
