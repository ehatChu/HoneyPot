package com.hp.app.chat.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.hp.app.chat.dao.ChatDao;
import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatRoomVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
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

	
	
}
