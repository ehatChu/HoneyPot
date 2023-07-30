package com.hp.app.meal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.meal.vo.MealVo;

@Repository
public class MealDaoImpl implements MealDao {

	@Override
	public List<MealVo> getMealList(SqlSessionTemplate sst) {
		return sst.selectList("meal.getMealList");
	}

}
