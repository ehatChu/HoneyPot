package com.hp.app.friend.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.friend.dao.FriendDao;
import com.hp.app.friend.vo.FriendVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
public class FriendServiceImpl implements FriendService{
	
	private final FriendDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<MemberVo> memberList(Map<String, String> searchMap) {
		return dao.memberList(sst, searchMap);
	}

	@Override
	public List<FriendVo> getFriendList(String loginNo) {
		return dao.getFriendList(sst, loginNo);
	}

	@Override
	public boolean checkFriend(String loginNo, String friendNo) {
	    List<FriendVo> fvoList = dao.getFriendList(sst, loginNo);
	    for (FriendVo friend : fvoList) {
	        if (friend.getFriendNo().equals(friendNo)) {
	            return true; 
	        }
	    }
	    return false; 
	}

	@Override
	public int deleteFriend(FriendVo vo) {
		return dao.deleteFriend(sst,vo);
	}

	@Override
	public int addFriend(FriendVo vo) {
		return dao.addFriend(sst,vo);
	}

	// 회원 상세조회
	@Override
	public MemberVo getMemberByNo(String mno) {
		return dao.getMemberByNo(sst,mno);
	}

	// 전체 회원 갯수
	@Override
	public int getMemberCnt() {
		return dao.getMemberCnt(sst);
	}

}
