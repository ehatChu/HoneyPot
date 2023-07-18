package com.hp.app.csc.vo;

import lombok.Data;

//@Builder
@Data
public class FAQVo {
	
	private String no;
	private String writerNo;
	private String writerName;
	private String faqCno;
	private String faqCname;
	private String question;
	private String answer;
	private String status;
	private String enrollDate;
	private String modifyDate;
	private String hit;
	
}
