package com.hp.app.csc.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ReportVo {
	
	private String no;
	private String reportCno;
	private String reportCname;
	private String reporter;
	private String respondent;
	private String title;
	private String content;
	private String enrollDate;
	private String answerDate;

}
