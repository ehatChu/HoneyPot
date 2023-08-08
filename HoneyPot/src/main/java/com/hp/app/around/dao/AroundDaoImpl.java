package com.hp.app.around.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.around.vo.AroundEvaluationVo;

@Repository
public class AroundDaoImpl implements AroundDao{

	@Override
	public int write(SqlSessionTemplate sst, AroundEvaluationVo vo) {
		return sst.insert("around.write", vo);
	}

	@Override
	public int enrollFacility(SqlSessionTemplate sst, AroundEvaluationVo vo) {
		return sst.insert("around.enroll", vo);
	}

	@Override
	public List<AroundEvaluationVo> getEvaluationList(SqlSessionTemplate sst) {
		return sst.selectList("around.getEvaluationList");
	}

	@Override
	public List<AroundEvaluationVo> getAroundList(SqlSessionTemplate sst) {
		return sst.selectList("around.getAroundList");
	}

	@Override
	public List<AroundEvaluationVo> getScoreList(SqlSessionTemplate sst) {
		return sst.selectList("around.getScoreList");
	}

}
