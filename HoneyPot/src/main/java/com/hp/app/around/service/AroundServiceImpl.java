package com.hp.app.around.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

import com.hp.app.around.dao.AroundDao;
import com.hp.app.around.vo.AroundEvaluationVo;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AroundServiceImpl implements AroundService {
	private final SqlSessionTemplate sst;
	private final AroundDao dao;

	@Override
	public int write(AroundEvaluationVo vo) {
		return dao.write(sst, vo);
	}

	@Override
	public int enrollFacility(AroundEvaluationVo vo) {
		return dao.enrollFacility(sst, vo);
	}

	@Override
	public List<AroundEvaluationVo> getEvaluationList() {
		return dao.getEvaluationList(sst);
	}

	@Override
	public List<AroundEvaluationVo> getAroundList() {
		return dao.getAroundList(sst);
	}
}
