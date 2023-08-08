package com.hp.app.meal.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.meal.vo.MealVo;
import com.hp.app.page.vo.PageVo;

public interface MealDao {

	List<MealVo> getMealList(SqlSessionTemplate sst, PageVo pv);

	List<MealVo> getMealList(SqlSessionTemplate sst);

	int getMealCnt(SqlSessionTemplate sst);

	int applyBreakFast(SqlSessionTemplate sst, Map<String, String> paramMap);

	int getApplyCnt(SqlSessionTemplate sst, Map<String, String> paramMap);

	MealVo selectMeal(SqlSessionTemplate sst, String no);

	int editMeal(SqlSessionTemplate sst, Map<String, String> paramMap);

	List<MealVo> getDietList(SqlSessionTemplate sst);

	List<MealVo> getApplyList(SqlSessionTemplate sst, String no, PageVo pv);

	int cancelApply(SqlSessionTemplate sst, String no);

	MealVo getTodayMeal(SqlSessionTemplate sst);

	int plusMeal(SqlSessionTemplate sst, Map<String, String> paramMap);


}
