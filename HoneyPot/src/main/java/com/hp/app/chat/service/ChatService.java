package com.hp.app.chat.service;

import java.util.List;
import java.util.Map;

import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatMessageVo;
import com.hp.app.chat.vo.ChatRoomVo;

public interface ChatService {
	
	// 회원 별 채팅방 목록 조회
	List<ChatRoomVo> selectRoom(String mno);

	// 채팅방 상세조회 (회원 목록)
	List<ChatRoomVo> chatDetailByNo(ChatRoomVo vo);

	// 채팅 친구 목록 + 검색
	List<ChatFriendVo> friendList(Map<String, String> paramMap);

	// 1:1 채팅방 생성
	int addChatRoom(Map<String, String> roomMap);

	// 생성한 채팅방 번호 가져오기
	ChatRoomVo selectRoomNo(Map<String, String> roomMap);

	// 생성한 채팅방에 회원 추가 (방장도 추가해야함,,, 생각해보기)
	int insertChatMember(Map<String, String> roomMap);

	// 채팅방 상세조회 (저장된 채팅 메세지)
	List<ChatMessageVo> chatMsg(ChatRoomVo vo);

}
