package com.hp.app.csc.vo;

import lombok.Builder;
import lombok.Data;

@Data
public class ReportVo {
	
	private String no;
	private String reportCno;
	private String reportCname;
	private String reporter;
	private String respondent;
	private String respondentName;
	private String respondentProfile;
	private String title;
	private String content;
	private String enrollDate;
	private String answerDate;
	private String memberName;
	private String memberProfile;
	private String answerYn;

}
