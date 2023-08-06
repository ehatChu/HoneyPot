package com.hp.app.chat.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatMemberVo;
import com.hp.app.chat.vo.ChatMessageVo;
import com.hp.app.chat.vo.ChatRoomVo;

@Repository
public class ChatDaoImpl implements ChatDao{

	@Override
	public List<ChatRoomVo> selectRoom(SqlSessionTemplate sst, String mno) {
		return sst.selectList("chat.selectRoomListByMno", mno);
	}

	@Override
	public List<ChatRoomVo> chatDetailByNo(SqlSessionTemplate sst, ChatRoomVo vo) {
		return sst.selectList("chat.selectDetailByNo", vo);
	}

	@Override
	public List<ChatFriendVo> friendList(SqlSessionTemplate sst, Map<String, String> paramMap) {
		return sst.selectList("chat.friendListByNo", paramMap);
	}

	@Override
	public int addChatRoom(SqlSessionTemplate sst, Map<String, String> roomMap) {
		return sst.insert("chat.addChatRoom", roomMap);
	}

	@Override
	public ChatRoomVo selectRoomNo(SqlSessionTemplate sst, Map<String, String> roomMap) {
		return sst.selectOne("chat.selectRoomNo", roomMap);
	}


	@Override
	public List<ChatMessageVo> chatMsg(SqlSessionTemplate sst, ChatRoomVo vo) {
		return sst.selectList("chat.selectChatMsg", vo);
	}

	@Override
	public int insertChatMember(SqlSessionTemplate sst, String roomNo, String memberNo) {
		 Map<String, String> paramMap = new HashMap<>();
	        paramMap.put("roomNo", roomNo);
	        paramMap.put("memberNo", memberNo);
		
		return sst.insert("chat.insertMemberInRoom", paramMap);
	}

	@Override
	public String getFriendName(SqlSessionTemplate sst, String fno) {
		return sst.selectOne("chat.frinedName",fno);
	}

	@Override
	public int saveMessage(SqlSessionTemplate sst, Map<String, String> msgVo) {
		return sst.insert("chat.insertMsg", msgVo);
	}

	@Override
	public List<ChatMessageVo> getMsg(SqlSessionTemplate sst, String roomId) {
		return sst.selectList("chat.getMsg", roomId);
	}

	@Override
	public int quit(SqlSessionTemplate sst,Map<String , String> roomMap) {
	    return sst.delete("chat.quitMemberList", roomMap);
	}

	@Override
	public int updateReadTime(SqlSessionTemplate sst, ChatMemberVo mvo) {
		return sst.update("chat.updateReadTime", mvo);
	}

	@Override
	public String getLastReadTime(SqlSessionTemplate sst, Map<String, String> msgVo) {
		return sst.selectOne("chat.getLastReadTime", msgVo);
	}

	@Override
	public List<ChatMessageVo> getAllsendTime(SqlSessionTemplate sst, Map<String, String> msgVo) {
		return sst.selectList("chat.getAllSendTime", msgVo);
	}

	

}
