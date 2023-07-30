package com.hp.app.meal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.meal.vo.MealVo;

public interface MealDao {

	List<MealVo> getMealList(SqlSessionTemplate sst);

}
