package com.hp.app.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hp.app.notice.service.NoticeService;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService service;

	// 공지사항 목록 조회
	@GetMapping("notice/list")
	public String getList(String p, Model model, String searchType, String searchValue, String sortType) {
		
		try {
			
			//검색값 저장
			Map<String, String> searchVo = new HashMap<>();
			searchVo.put("searchType", searchType);
			searchVo.put("searchValue", searchValue);
			searchVo.put("sortType", sortType);

			//페이징
			int intP = 1;
			if (p != null) {
				intP = Integer.parseInt(p);
			}
			int listCount = service.countNotice(searchVo);
			int currentPage = intP;
			int pageLimit = 5;
			int boardLimit = 8;
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		
			List<NoticeVo> voList = service.getNoticeList(pv, searchVo);
			
			model.addAttribute("voList", voList);
			model.addAttribute("pv", pv);
			model.addAttribute("searchVo", searchVo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return "notice/list";
	}

	
	// 공지사항 작성 (화면)
	@GetMapping("notice/write")
	public String write() {
		return "notice/write";
	}

	// 공지사항 조회
	@GetMapping("notice/detail")
	public String viewDetail(Model model, String no) {
		
		try {
			

			
			NoticeVo vo = service.viewDetail(no);
			model.addAttribute("vo", vo);
			
//			if (no == null) {
//				return "notice/list";
//			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return "notice/detail";
		
	}

}
