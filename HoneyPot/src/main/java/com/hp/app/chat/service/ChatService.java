package com.hp.app.chat.service;

import java.util.List;
import java.util.Map;

import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatRoomVo;

public interface ChatService {
	
	// 회원 별 채팅방 목록 조회
	List<ChatRoomVo> selectRoom(String mno);

	// 채팅방 상세조회
	List<ChatRoomVo> chatDetailByNo(ChatRoomVo vo);

	// 채팅 친구 목록 + 검색
	List<ChatFriendVo> friendList(Map<String, String> paramMap);

}
