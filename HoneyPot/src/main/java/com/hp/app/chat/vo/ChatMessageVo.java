package com.hp.app.chat.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ChatMessageVo {
	
	private String no;
	private String chattingRoomNo;
	private String memberNo;
	private String sendTime;
	private String content;
	private String memberName;
	private String memberProfile;

}
