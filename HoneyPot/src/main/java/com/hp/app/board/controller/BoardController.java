package com.hp.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	
	//게시글 작성(화면)
	@GetMapping("write")
	public String write() {
		return "board/write";
	}
	
	//게시글 목록 조회
	@GetMapping("list")
	public String list() {
		return "board/list";
	}
	
	

}