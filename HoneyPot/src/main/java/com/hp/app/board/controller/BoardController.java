package com.hp.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hp.app.board.service.BoardService;
import com.hp.app.board.vo.BoardVo;

@Controller
//@RequestMapping("board")
public class BoardController {
	
	private final BoardService BS;
	
	//게시글 작성
	@GetMapping("board/write")
	public String write() {
		return "board/write";
	}
	
	//게시글 목록 조회
	@GetMapping("board/list")
	public String list() {
		
		BoardVo vo = new BoardVo();
		
		
		
		return "board/list";
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