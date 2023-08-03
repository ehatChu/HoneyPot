package com.hp.app.friend.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.friend.vo.FriendVo;
import com.hp.app.member.vo.MemberVo;

@Repository
public class FriendDaoImpl implements FriendDao{

	@Override
	public List<MemberVo> memberList(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectList("friend.memberList", searchMap);
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

	// 회원 상세조회
	@Override
	public MemberVo getMemberByNo(SqlSessionTemplate sst, String mno) {
		return sst.selectOne("friend.getMemberByNo", mno);
	}

	// 전체 회원 갯수
	@Override
	public int getMemberCnt(SqlSessionTemplate sst) {
		return sst.selectOne("friend.getMemberCnt");
	}

	
	
}
