package com.hp.app.chat.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatMessageVo;
import com.hp.app.chat.vo.ChatRoomVo;

public interface ChatDao {

	// 회원 별 채팅방 목록 조회
	List<ChatRoomVo> selectRoom(SqlSessionTemplate sst, String mno);

	// 채팅방 상세조회
	List<ChatRoomVo> chatDetailByNo(SqlSessionTemplate sst, ChatRoomVo vo);

	// 채팅방 친구 목록
	List<ChatFriendVo> friendList(SqlSessionTemplate sst, Map<String, String> paramMap);

	// 1:1 채팅방 생성
	int addChatRoom(SqlSessionTemplate sst, Map<String, String> roomMap);

	// 생성한 채팅방 번호 가져오기
	ChatRoomVo selectRoomNo(SqlSessionTemplate sst, Map<String, String> roomMap);

	int insertChatMember(SqlSessionTemplate sst, Map<String, String> roomMap);

	// 
	List<ChatMessageVo> chatMsg(SqlSessionTemplate sst, ChatRoomVo vo);

}
