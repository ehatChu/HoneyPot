package com.hp.app.memberManagement.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.memberManagement.dao.MemberManagementDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
@RequiredArgsConstructor
public class MemberManagementServiceImpl implements MemberManagementService{
	
	private final MemberManagementDao dao;
	private final SqlSessionTemplate sst;
}
