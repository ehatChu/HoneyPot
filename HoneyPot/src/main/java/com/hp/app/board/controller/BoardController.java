package com.hp.app.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hp.app.board.service.BoardService;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;

	// 게시글 목록 조회 (공지사항 화면)
	@GetMapping("board/list")
	public String list(String p, Model model, String searchType, String searchValue) {
		try {
			//페이징
			int intP = 1;
			if (p != null) {
				intP = Integer.parseInt(p);
			}
			int listCount = service.countBoard();
			int currentPage = intP;
			int pageLimit = 5;
			int boardLimit = 8;
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			Map<String, String> searchVoMap = new HashMap<>();
			searchVoMap.put("searchType", searchType);
			searchVoMap.put("searchValue", searchValue);

			List<NoticeVo> voList = null;
			if (searchType == null || "".equals(searchType) ) {
				voList = service.getList(pv);
			}else {
				voList = service.getList(pv, searchType, searchValue); //searchVoMap 으로 파라미터 바꾸고 인터페이스 바꾸고 등등
			}

			
			model.addAttribute("voList", voList);
			model.addAttribute("pv", pv);
			model.addAttribute("searchVo", searchVoMap);
		} catch (Exception e) {
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