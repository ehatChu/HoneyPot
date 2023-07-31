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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.app.account.vo.AccountVo;
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
	public String viewDetail(Model model, String no) {
		
		try {
			BoardVo vo = service.viewDetail(no);
			model.addAttribute("vo", vo);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "board/detail";
	}
	
	//댓글 작성
	@PostMapping("reply/write")
	@ResponseBody
	public String writeReply(HttpSession session, ReplyVo rvo) {
		
		AdminVo loginMember = (AdminVo) session.getAttribute("loginMember");
		
		System.out.println(rvo);
		
		//댓글 null 검사
		if (rvo.getContent() == null || rvo.getContent().trim().isEmpty()) {
			return "empty";
		}
		
		int result = service.writeReply(rvo);
		
		System.out.println(result);
		System.out.println(rvo);
		
		if(result < 0) {
//			resp.getWriter().write("fail");
			return "fail";
		}
		
//		resp.getWriter().write("success");
		return "success";
		
	}
	
	
	//댓글 목록 조회
	@GetMapping("reply/list")
	@ResponseBody
	public String getReplyList(HttpSession session, String no) throws JsonProcessingException {
		
		AdminVo loginMember = (AdminVo) session.getAttribute("loginMember");
		
		List<ReplyVo> rvoList = service.getReplyList(no);
		
		if(rvoList == null) {
			return "fail";
		}
		
		//자바객체 -> JSON 형태
		ObjectMapper mapper = new ObjectMapper();
		String replyList = mapper.writeValueAsString(rvoList);
		
		System.out.println(replyList);
		
		return replyList;

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