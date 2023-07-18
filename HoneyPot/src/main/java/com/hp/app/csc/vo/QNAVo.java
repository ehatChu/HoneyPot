package com.hp.app.csc.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QNAVo {
	
	private String no;
	private String qnaCno;
	private String qnaCname;
	private String memberNo;
	private String title;
	private String content;
	private String enrollDate;
	private String answerDate;
	private String answer;
	private String answerYn;

}
