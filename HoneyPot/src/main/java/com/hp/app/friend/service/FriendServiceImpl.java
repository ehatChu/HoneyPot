package com.hp.app.friend.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hp.app.friend.dao.FriendDao;
import com.hp.app.friend.vo.FriendVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class FriendServiceImpl implements FriendService{
	
	private final FriendDao dao;
	private final SqlSessionTemplate sst;
	
	@Override
	public List<MemberVo> memberList() {
		return dao.memberList(sst);
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

}
