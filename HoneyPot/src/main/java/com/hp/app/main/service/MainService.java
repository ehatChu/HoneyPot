package com.hp.app.main.service;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;

public interface MainService {

	AdminVo getCaptain(String name);
	int getCaptainLoveCnt(String no);
	int getCaptainHateCnt(String no);
	int voteCaptainLove(String[] arr);
}
