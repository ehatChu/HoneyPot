package com.hp.app.board.vo;

import lombok.Data;

@Data
public class BoardVo {
	
	private String no;
	private String writerNo;
	private String writerName;
	private String boardStatusNo;
	private String boardStatusName;
	private String boardCno;
	private String boardCname;
	private String title;
	private String content;
	private String enrollDate;
	private String modifyDate;
	private String hit;
	private String loveCnt;
	private String boardImgName;

}
