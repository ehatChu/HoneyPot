package com.hp.app.around.service;

import java.util.List;

import com.hp.app.around.vo.AroundEvaluationVo;

public interface AroundService {

	int write(AroundEvaluationVo vo);

	int enrollFacility(AroundEvaluationVo vo);

	List<AroundEvaluationVo> getEvaluationList();

	List<AroundEvaluationVo> getAroundList();

	List<AroundEvaluationVo> getScoreList();

}
