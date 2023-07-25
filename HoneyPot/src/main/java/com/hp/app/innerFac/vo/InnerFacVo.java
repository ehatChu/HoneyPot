package com.hp.app.innerFac.vo;

import lombok.Data;

@Data
public class InnerFacVo {
	private String no; //편의시설 번호
	private String name; 
	private String content;
	private String maxNum;
	private String openTime;
	private String closeTime;
	private String status;
	private String location;
}
