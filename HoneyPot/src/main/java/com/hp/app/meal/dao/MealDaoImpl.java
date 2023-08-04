package com.hp.app.meal.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.meal.vo.MealVo;
import com.hp.app.page.vo.PageVo;

@Repository
public class MealDaoImpl implements MealDao {

	@Override
	public List<MealVo> getMealList(SqlSessionTemplate sst, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		return sst.selectList("meal.getMealList", null, rb);
	}
	
	@Override
	public List<MealVo> getMealList(SqlSessionTemplate sst) {
		return sst.selectList("meal.getMealList");
	}

	@Override
	public int getMealCnt(SqlSessionTemplate sst) {
		return sst.selectOne("meal.getMealCnt");
	}

	@Override
	public int applyBreakFast(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.insert("meal.applyBreakFast", paramMap);
	}

	@Override
	public int getApplyCnt(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectOne("meal.getApplyCnt", paramMap);
	}

	@Override
	public MealVo selectMeal(SqlSessionTemplate sst, String no) {
		return sst.selectOne("meal.selectMeal", no);
	}

	@Override
	public int editMeal(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.update("meal.editMeal", paramMap);
	}

	@Override
	public List<MealVo> getDietList(SqlSessionTemplate sst) {
		return sst.selectList("meal.getDietList");
	}

	@Override
	public List<MealVo> getApplyList(SqlSessionTemplate sst, String no, PageVo pv) {
		RowBounds rb = new RowBounds(pv.getOffset() , pv.getBoardLimit());
		return sst.selectList("meal.getApplyList", no, rb);
	}

	@Override
	public int cancelApply(SqlSessionTemplate sst, String no) {
		return sst.delete("meal.cancelApply", no);
	}

}
