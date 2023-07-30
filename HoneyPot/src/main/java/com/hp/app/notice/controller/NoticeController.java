package com.hp.app.notice.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.google.gson.JsonObject;
import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.notice.service.NoticeService;
import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeImgVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;
import com.hp.app.util.file.FileUploader;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService service;

	// 공지사항 목록 조회
	@GetMapping("notice/list")
	public String getList(@RequestParam(defaultValue = "1") String p, Model model, @RequestParam Map<String, String> searchVo) {
		
		try {
			
			//검색값 저장
//			Map<String, String> searchVo = new HashMap<>();
//			searchVo.put("searchType", searchType);
//			searchVo.put("searchValue", searchValue);
//			searchVo.put("sortType", sortType);

			//페이징
//			int intP = 1;
//			if (p != null) {
//				intP = Integer.parseInt(p);
//			}
			int listCount = service.countNotice(searchVo);
			int currentPage = Integer.parseInt(p);
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
	public String write(HttpSession session, HttpServletRequest req, @RequestParam("file") List<MultipartFile> fList, NoticeVo vo) {
		
		try {
			
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
//			if(loginAdmin == null) {
//				return "redirect:/"
//			}
//			vo.setWriterNo(loginAdmin.getNo());
			
//			List<NoticeCategoryVo> cvo = service.getCategory();
//			model.addAttribute("cvo", cvo);
			
			
			
//			//파일처리 (프사)
//			Part profile = req.getPart("profile");
//			//사진 첨부해야 지정된 경로에 사진 저장 
//			AttachmentVo attachmentVo = new AttachmentVo();
//			String path = req.getServletContext().getRealPath("/static/img/profile/");
//			if(profile.getSize() > 0) {
//				attachmentVo = FileUploader.saveFile(path, profile);
//			}

			
//			//파일 업로드
//			List<Part> fList = new ArrayList<>();
//			Collection<Part> parts = req.getParts();
//			for (Part part : parts) {
//				if(part.getName().equals("f")) {
//					fList.add(part);
//				}
//			}
			
			
			

			
			
			

//			if (result != 1) {
//				(new File(fileName)).delete();
//				session.setAttribute("alertMsg", "회원정보 수정에 실패하였습니다");
//				return "redirect:/member/medit";
//			}
			
			
			
			
			vo.setWriterNo("2"); // 임시 작성자번호
			int result = service.write(vo);
			if(result != 1) {
				session.setAttribute("alert", "게시글 작성 실패...");
				return "redirect:/notice/list";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("alert", "게시글 작성 성공!");
		return "redirect:/notice/list";
	}
	
	//서머노트 사진 업로드
//	@PostMapping("/upload")
//	@ResponseBody
//	public JsonObject uploadImg (@RequestParam("file") MultipartFile file, HttpServletRequest req) {
//		
//		JsonObject jsonObject = new JsonObject(); 
//		
//		Part x = req.getPart("f");
//		System.out.println(x);
//		
//		return saveImg;
//	}
	
	
	//서머노트 사진 업로드
    @PostMapping("/upload")
    @ResponseBody
    public List<String> handleFileUpload(@RequestParam("f") List<MultipartFile> flist, HttpServletRequest req, HttpServletResponse response) throws Exception {
        
    	System.out.println(flist);
    	
    	List<String> changeNameList = new ArrayList<>();
    	try {
    		
            String path = "/resources/notice/";

            try {
                changeNameList = FileUploader.saveFile(path, flist);
            } catch (Exception e) {
                 e.printStackTrace();
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
    		
    	}catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return changeNameList;
    	
    	
		//민성
//		String path = req.getServletContext().getRealPath("/resources/notice/");
//		
//		List<String> Imglist =  FileUploader.saveFile(path, fList);
//		for (int j = 0; j < Imglist.size(); j++) {
//			String filePath = path + Imglist.get(j);
//			File destinationFile = new File(filePath);
//			fList.get(j).transferTo(destinationFile);
//		}

        
        
//		String path = req.getServletContext().getRealPath("/resources/notice/");
//		
//		List<String> changeNameList =  FileUploader.saveFile(path, flist);
//		for (int j = 0; j < changeNameList.size(); j++) {
//			String filePath = path + changeNameList.get(j);
//			File destinationFile = new File(filePath);
//			flist.get(j).transferTo(destinationFile);
//		}
//		
//		return changeNameList;
        
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
			int result = service.edit(vo);
			if(result != 1) {
				session.setAttribute("alertMsg", "게시글 수정 실패...");
				return "redirect:/notice/list?no=" + vo.getNo();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("alertMsg", "게시글 수정 성공!");
		return "redirect:/notice/detail?no=" + vo.getNo();
	}
	
	//공지사항 삭제
	@GetMapping("notice/delete")
	public String delete(HttpSession session, String no) {
		
		try {
			
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
//			if (loginAdmin == null) {
//				session.setAttribute("alertMsg", "게시글 삭제 실패...");
//				return "redirect:/main/amain";
//			}
			
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
