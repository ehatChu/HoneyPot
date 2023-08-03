package com.hp.app.friend.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.friend.vo.FriendVo;
import com.hp.app.member.vo.MemberVo;

public interface FriendDao {

	// 전체 회원 목록 조회
	List<MemberVo> memberList(SqlSessionTemplate sst, Map<String, String> searchMap);
	
	// 전체 회원 갯수
	int getMemberCnt(SqlSessionTemplate sst);

	// 친구 목록 조회
	List<FriendVo> getFriendList(SqlSessionTemplate sst, String loginNo);

	// 팔로우 삭제
	int deleteFriend(SqlSessionTemplate sst, FriendVo vo);

	// 팔로우 추가
	int addFriend(SqlSessionTemplate sst, FriendVo vo);

	// 회원 상세조회
	MemberVo getMemberByNo(SqlSessionTemplate sst, String mno);


}
