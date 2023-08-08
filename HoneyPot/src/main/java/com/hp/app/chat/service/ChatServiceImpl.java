package com.hp.app.chat.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hp.app.chat.dao.ChatDao;
import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatMemberVo;
import com.hp.app.chat.vo.ChatMessageVo;
import com.hp.app.chat.vo.ChatRoomVo;
import com.hp.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Transactional
@Service
public class ChatServiceImpl implements ChatService{
	
	private final ChatDao dao;
	private final SqlSessionTemplate sst;
	@Override
	public List<ChatRoomVo> selectRoom(String mno) {
		return dao.selectRoom(sst, mno);
	}
	
	@Override
	public List<ChatRoomVo> chatDetailByNo(ChatRoomVo vo) {
		return dao.chatDetailByNo(sst, vo);
	}
	
	@Override
	public List<ChatFriendVo> friendList(Map<String, String> paramMap) {
		return dao.friendList(sst, paramMap);
	}

	@Override
	public int addChatRoom(Map<String, String> roomMap) {
		 return dao.addChatRoom(sst, roomMap);
	}

	@Override
	public ChatRoomVo selectRoomNo(Map<String, String> roomMap) {
		return dao.selectRoomNo(sst,roomMap);
	}

	@Override
	public int insertChatMember(Map<String, String> roomMap) {
	    int result = 0;

	    // masterNo를 채팅방에 추가
	    result += dao.insertChatMember(sst, roomMap.get("no"), roomMap.get("masterNo"));

	    // friendNo를 채팅방에 추가
	    result += dao.insertChatMember(sst, roomMap.get("no"), roomMap.get("friendNo"));

	    return result;
	}

	@Override
	public List<ChatMessageVo> chatMsg(ChatRoomVo vo) {
		return dao.chatMsg(sst, vo);
	}

	@Override
	public String getFriendName(String fno) {
		return dao.getFriendName(sst, fno);
	}

	@Override
	public int saveMessage(Map<String, String> msgVo) {
		return dao.saveMessage(sst, msgVo);
	}

	@Override
	public List<ChatMessageVo> getMsg(String roomId) {
		return dao.getMsg(sst, roomId);
	}

	@Override
	public int quit(Map<String , String> roomMap) {
		return dao.quit(sst,roomMap);
	}

	@Override
	public int updateReadTime(ChatMemberVo mvo) {
		return dao.updateReadTime(sst, mvo);
	}

	@Override
	public String getLastReadTime(Map<String , String> memberAndRoom) {
		return dao.getLastReadTime(sst,memberAndRoom);
	}

	@Override
	public List<ChatMessageVo> getAllSendTimesInRoom(Map<String, String> msgVo) {
		return dao.getAllsendTime(sst, msgVo);
	}

	@Override
	public ChatMessageVo getLastMessage( Map<String , String> memberAndRoom) {
		return dao.getLastMessage(sst, memberAndRoom);
	}

	@Override
	public ChatMemberVo getChatRoomMembers(Map<String, String> memberAndRoom) {
		return dao.getChatRoomMembers(sst, memberAndRoom);
	}

	@Override
	public List<MemberVo> getMessageReadMembers(String no) {
		return dao.getMessageReadMembers(sst, no);
	}

	@Override
	public String getFLastReadTime(Map<String, String> memberAndRoom) {
		return dao.getFLastReadTime(sst, memberAndRoom);
	}

	@Override
	public List<ChatMessageVo> getUnreadMsg(Map<String, String> memberAndRoom) {
		return dao.getUnreadMsg(sst, memberAndRoom);
	}

	
	
}
