package com.hp.app.board.vo;

import lombok.Data;

@Data
public class ReplyVo {
	
	private String no;
	private String boardNo;
	private String writerNo;
	private String writerName;
	private String replyNo;
	private String content;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private String profile;

}
