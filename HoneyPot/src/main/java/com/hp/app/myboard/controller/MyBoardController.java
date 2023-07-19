package com.hp.app.myboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hp.app.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MyBoardController {
	
	private final BoardService service;
	
	//내 게시글
	@GetMapping("mypage/act/board")
	public String myPost() {
		return "mypage/act/board";
	}
	
	//내 댓글
	@GetMapping("mypage/act/reply")
	public String myReply() {
		return "mypage/act/reply";
	}
	
	//좋아요한 글
	@GetMapping("mypage/act/like")
	public String myLike() {
		return "mypage/act/like";
	}

}
