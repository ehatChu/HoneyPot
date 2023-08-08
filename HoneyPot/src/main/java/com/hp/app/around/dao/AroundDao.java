package com.hp.app.around.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.around.vo.AroundEvaluationVo;

public interface AroundDao {

	int write(SqlSessionTemplate sst, AroundEvaluationVo vo);

	int enrollFacility(SqlSessionTemplate sst, AroundEvaluationVo vo);

	List<AroundEvaluationVo> getEvaluationList(SqlSessionTemplate sst);

	List<AroundEvaluationVo> getAroundList(SqlSessionTemplate sst);

	List<AroundEvaluationVo> getScoreList(SqlSessionTemplate sst);

}
