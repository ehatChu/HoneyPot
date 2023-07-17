package com.hp.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	
	//게시글 작성
	@GetMapping("write")
	public String write() {
		return "board/write";
	}
	
	//게시글 목록 조회
	@GetMapping("list")
	public String list() {
		return "board/list";
	}
	
	//게시글 상세 조회
	@GetMapping("detail")
	public String detail() {
		return "board/detail";
	}
	
	//장터 게시판
	@GetMapping("market")
	public String market() {
		return "board/market";
	}
	
	//내 게시글
	@GetMapping("act/board")
	public String myPost() {
		return "mypage/act/board";
	}
	
	//내 댓글
	@GetMapping("act/reply")
	public String myReply() {
		return "mypage/act/reply";
	}
	
	//좋아요한 글
	@GetMapping("act/like")
	public String myLike() {
		return "mypage/act/like";
	}
	
	

}