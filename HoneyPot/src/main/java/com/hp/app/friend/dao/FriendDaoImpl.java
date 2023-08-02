package com.hp.app.friend.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.friend.vo.FriendVo;
import com.hp.app.member.vo.MemberVo;

@Repository
public class FriendDaoImpl implements FriendDao{

	@Override
	public List<MemberVo> memberList(SqlSessionTemplate sst) {
		return sst.selectList("friend.memberList");
	}

	@Override
	public List<FriendVo> getFriendList(SqlSessionTemplate sst, String loginNo) {
		return sst.selectList("friend.list", loginNo);
	}

	@Override
	public int deleteFriend(SqlSessionTemplate sst, FriendVo vo) {
		return sst.delete("friend.del", vo);
	}

	@Override
	public int addFriend(SqlSessionTemplate sst, FriendVo vo) {
		return sst.insert("friend.addFriend", vo);
	}

	
	
}
