package com.hp.app.chat.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.hp.app.chat.vo.ChatFriendVo;
import com.hp.app.chat.vo.ChatMemberVo;
import com.hp.app.chat.vo.ChatMessageVo;
import com.hp.app.chat.vo.ChatRoomVo;
import com.hp.app.member.vo.MemberVo;

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

	// 
	List<ChatMessageVo> chatMsg(SqlSessionTemplate sst, ChatRoomVo vo);

	int insertChatMember(SqlSessionTemplate sst, String roomNo, String memberNo);

	// 친구 이름
	String getFriendName(SqlSessionTemplate sst, String fno);

	// 메세지 저장
	int saveMessage(SqlSessionTemplate sst, Map<String, String> msgVo);

	// 메세지 불러오기
	List<ChatMessageVo> getMsg(SqlSessionTemplate sst, String roomId);

	// 채팅방 나가기
	int quit(SqlSessionTemplate sst, Map<String, String> roomMap);

	// 읽은 시간 업데이트
	int updateReadTime(SqlSessionTemplate sst, ChatMemberVo mvo);

	// 채팅방 가장 최신 읽은 시간 조회
	String getLastReadTime(SqlSessionTemplate sst, Map<String, String> memberAndRoom);

	// 채팅방 모든 보낸 시간 조회
	List<ChatMessageVo> getAllsendTime(SqlSessionTemplate sst, Map<String, String> msgVo);

	// 채팅방의 마지막 메세지 조회
	ChatMessageVo getLastMessage(SqlSessionTemplate sst, Map<String, String> memberAndRoom);

	// 채팅방 멤버 목록 조회
	ChatMemberVo getChatRoomMembers(SqlSessionTemplate sst, Map<String, String> memberAndRoom);

	// 채팅방 읽은 멤버 조회
	List<MemberVo> getMessageReadMembers(SqlSessionTemplate sst, String no);

	// 채팅방 친구 최근 읽은 시간
	String getFLastReadTime(SqlSessionTemplate sst, Map<String, String> memberAndRoom);

	// 안읽은 메세지 
	List<ChatMessageVo> getUnreadMsg(SqlSessionTemplate sst, Map<String, String> memberAndRoom);

}
