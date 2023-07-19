package com.hp.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hp.app.board.service.BoardService;
import com.hp.app.board.vo.BoardVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService service;
	
	//게시글 목록 조회
	@GetMapping("board/list")
	public String list() {
		
		BoardVo vo = new BoardVo();
		
		return "board/list";
	}
	
	//게시글 작성 (화면) 
	@GetMapping("board/write")
	public String write() {
		return "board/write";
	}
	
	//게시글 상세 조회
	@GetMapping("board/detail")
	public String detail() {
		return "board/detail";
	}
	
	
	//자유게시판
	@GetMapping("board/free")
	public String free() {
		return "board/market";
	}
	
	//장터 게시판
	@GetMapping("board/market")
	public String market() {
		return "board/market";
	}
	
	//익명게시판
	@GetMapping("board/noname")
	public String noname() {
		return "board/market";
	}
	
	//칭찬게시판
	@GetMapping("board/praise")
	public String praise() {
		return "board/market";
	}
	

	
	

}