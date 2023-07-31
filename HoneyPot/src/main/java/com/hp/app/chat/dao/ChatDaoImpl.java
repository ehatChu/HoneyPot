package com.hp.app.chat.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
