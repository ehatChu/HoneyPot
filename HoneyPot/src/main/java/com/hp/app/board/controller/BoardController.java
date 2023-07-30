package com.hp.app.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.board.service.BoardService;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;

	// 게시글 목록 조회
	@GetMapping("board/list")
	public String list(@RequestParam(defaultValue="1") String p, Model model, @RequestParam Map<String, String> searchVo) {
		
		try {
			
			int listCount = service.countBoard(searchVo);
			int currentPage = Integer.parseInt(p);
			int pageLimit = 5;
			int boardLimit = 8;
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
			List<BoardVo> voList = service.getList(pv, searchVo);
			
			model.addAttribute("voList", voList);
			model.addAttribute("pv", pv);
			model.addAttribute("searchVo", searchVo);
			
			System.out.println(voList);
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return "board/list";
	}


	// 게시글 작성 (화면)
	@GetMapping("board/write")
	public String write() {
		return "board/write";
	}

	// 게시글 상세 조회
	@GetMapping("board/detail")
	public String detail() {
		return "board/detail";
	}
	
	//댓글 작성
	@PostMapping("reply")
	@ResponseBody
	public String writeReply(HttpSession session, HttpServletResponse resp, BoardVo vo, String boardNo, String writerNo, String content) {
		
		AdminVo loginMember = (AdminVo) session.getAttribute("loginMember");
		ReplyVo rvo = new ReplyVo();
		
		rvo.setBoardNo(boardNo);
		rvo.setWriterNo(writerNo);
		rvo.setContent(content);
		
		System.out.println(rvo);
		
		int result = service.writeReply(rvo);
		System.out.println(result);
		if(result < 0) {
//			resp.getWriter().write("fail");
			return "fail";
		}
		
//		resp.getWriter().write("success");
		return "success";
		
	}
	

	// 자유게시판 (화면)
	@GetMapping("board/free")
	public String free() {
		return "board/free";
	}

	// 장터 게시판 (화면)
	@GetMapping("board/market")
	public String market() {
		return "board/market";
	}

	// 익명게시판 (화면)
	@GetMapping("board/noname")
	public String noname() {
		return "board/noname";
	}

	// 칭찬게시판 (화면)
	@GetMapping("board/praise")
	public String praise() {
		return "board/praise";
	}

}