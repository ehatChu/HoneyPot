package com.hp.app.meal.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.meal.dao.MealDao;
import com.hp.app.meal.vo.MealVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MealServiceImpl implements MealService{
	private final MealDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<MealVo> getMealList() {
		return dao.getMealList(sst);
	}

}
