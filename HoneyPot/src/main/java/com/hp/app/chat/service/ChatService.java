package com.hp.app.chat.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatMemberVo;
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

	// 생성한 채팅방에 회원 추가
	int insertChatMember(Map<String, String> roomMap);

	// 채팅방 상세조회 (저장된 채팅 메세지)
	List<ChatMessageVo> chatMsg(ChatRoomVo vo);

	// 친구 이름 
	String getFriendName(String fno);

	// 메세지 저장
	int saveMessage(Map<String, String> msgVo);
	
	// 채팅 메세지 가져오기 (채팅방 번호)
	List<ChatMessageVo> getMsg(String roomId);

	// 채팅방 나가기 
	int quit(Map<String, String> roomMap);

	// 읽은 시간 업데이트
	int updateReadTime(ChatMemberVo mvo);

	// 채팅방의 최신 읽은 시간
	String getLastReadTime(Map<String, String> msgVo);

	// 채팅방의 보낸 시간들 조회
	List<ChatMessageVo> getAllSendTimesInRoom(Map<String, String> msgVo);

}
