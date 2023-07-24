package com.hp.app.fee.vo;

import lombok.Data;

@Data
public class MemberFeeVo {
	
	private String no;
	private String memberNo;
	private String feeCno;
	private String content;
	private String price;
	private String paymentDate;
	private String totalPrice;
	private String categoryName;

}
