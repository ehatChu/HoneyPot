package com.hp.app.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.notice.service.NoticeService;
import com.hp.app.notice.vo.NoticeCategoryVo;
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
	public String write(Model model) {
		List<NoticeCategoryVo> cvo = service.getCategory();
		model.addAttribute("cvo", cvo);
		return "notice/write";
	}
	
	// 공지사항 작성
	@PostMapping("notice/write")
	public String write(HttpSession session, NoticeVo vo) {
		
		try {
			
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
//			if(loginAdmin == null) {
//				return "redirect:/"
//			}
//			vo.setWriterNo(loginAdmin.getNo());
			
//			List<NoticeCategoryVo> cvo = service.getCategory();
//			model.addAttribute("cvo", cvo);
			
			vo.setWriterNo("2"); // 임시 작성자번호
			int result = service.write(vo);
			if(result != 1) {
				return "redirect:/notice/list";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/notice/list";
	}

	// 공지사항 상세조회
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
	
	//공지사항 수정 (화면)
	@GetMapping("notice/edit")
	public String edit(HttpSession session, Model model, String no) {
		
		List<NoticeCategoryVo> cvo = service.getCategory();
		NoticeVo vo = service.viewDetail(no);
		model.addAttribute("cvo", cvo);
		model.addAttribute("vo", vo);
		if(no == null || "".equals(no) || "0".equals(no)) {
			session.setAttribute("alert", "잘못된 접근입니다.");
			return "redirect:/notice/list";
		}
		return "notice/edit";
	}
	
	
	//공지사항 수정
	@PostMapping("notice/edit")
	public String edit(HttpSession session, NoticeVo vo) {
		
		try {
			
//			vo.setWriterNo("2");
			System.out.println(vo);
			int result = service.edit(vo);
			if(result != 1) {
				session.setAttribute("alert", "게시글 수정 실패...");
				return "redirect:/notice/list";
			}
			session.setAttribute("alert", "게시글 수정 성공!");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/notice/detail?no=" + vo.getNo();
	}
	
	//공지사항 삭제
	@GetMapping("notice/delete")
	public String delete(HttpSession session, String no) {
		
		try {
			
			//String writerNo = loginAdmin.getNo();
			String writerNo = "2";
			
			Map<String, String> noMap = new HashMap<>();
			noMap.put("writerNo", writerNo);
			noMap.put("no", no);
			
			int result = service.delete(noMap);
			if(result != 1) {
				session.setAttribute("alertMsg", "게시글 삭제 실패...");
				return "redirect:/notice/detail?no=" + no;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("alertMsg", "게시글 삭제 성공 !");
		return "redirect:/notice/list";
		
	}

}
