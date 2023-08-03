package com.hp.app.friend.service;

import java.util.List;
import java.util.Map;

import com.hp.app.friend.vo.FriendVo;
import com.hp.app.member.vo.MemberVo;

public interface FriendService{

	// 전체 회원 목록 조회
	List<MemberVo> memberList(Map<String, String> searchMap);
	
	// 전체 회원 갯수
	int getMemberCnt();
	
	// 회원 상세조회
	MemberVo getMemberByNo(String mno);

	// 친구 목록 조회
	List<FriendVo> getFriendList(String loginNo);

	// 친구 체크
	boolean checkFriend(String loginNo, String friendNo);

	// 팔로우 삭제
	int deleteFriend(FriendVo vo);

	// 팔로우 추가
	int addFriend(FriendVo vo);





}
