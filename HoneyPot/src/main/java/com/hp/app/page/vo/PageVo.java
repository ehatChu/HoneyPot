package com.hp.app.page.vo;

import lombok.Getter;

@Getter
public class PageVo {

	public PageVo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		this.listCount = listCount; // 16
		this.CurrentPage = currentPage; // 1
		this.pageLimit = pageLimit; // 6
		this.boardLimit = boardLimit; // 8
		
		int maxPage = (int)Math.ceil((double)(listCount/boardLimit));
		int startPage = (currentPage - 1) / pageLimit * pageLimit +1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
	         endPage = maxPage;
	      }
		int offset = (currentPage-1) * boardLimit;
		
		this.maxPage = maxPage;
		this.startPage = startPage; 
		this.endPage = endPage;
		this.offset = offset;
	}
	
	private int listCount;
	private int CurrentPage;
	private int pageLimit;
	private int boardLimit;
	
	private int maxPage;
	private int startPage;
	private int endPage;
	private int offset;
	
	
}
