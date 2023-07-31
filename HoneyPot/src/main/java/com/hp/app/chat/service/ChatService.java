package com.hp.app.chat.service;

import java.util.List;

import com.hp.app.chat.vo.ChatRoomVo;

public interface ChatService {
	
	// 회원 별 채팅방 목록 조회
	List<ChatRoomVo> selectRoom(String mno);

	// 채팅방 상세조회
	List<ChatRoomVo> chatDetailByNo(ChatRoomVo vo);

}
