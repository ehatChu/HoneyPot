package com.hp.app.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.hp.app.admin.vo.AdminVo;
import com.hp.app.board.service.BoardService;
import com.hp.app.board.vo.BoardCategoryVo;
import com.hp.app.board.vo.BoardImgVo;
import com.hp.app.board.vo.BoardVo;
import com.hp.app.board.vo.LoveVo;
import com.hp.app.board.vo.ReplyVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;
import com.hp.app.util.file.FileUploader;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;

	// 게시글 목록 조회
	@GetMapping("board/list")
	public String list(@RequestParam(defaultValue="1") String p, Model model, String category, @RequestParam Map<String, String> searchVo) {
		
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
	public String write(Model model) {
		List<BoardCategoryVo> cvo = service.getCategory();
		model.addAttribute("cvo", cvo);
		return "board/write";
	}
	
	// 게시글 작성
	@PostMapping("board/write")
	public String write(HttpSession session, BoardVo vo, String imgList) {
		String[] arr = imgList.split(",");
		for (String s : arr) {
			System.out.println(s);
		}
		System.out.println(vo);
		
		try {
			
//			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
//			if(loginAdmin == null) {
//				return "redirect:/"
//			}
//			vo.setWriterNo(loginAdmin.getNo());
			
			vo.setWriterNo("2"); // 임시 작성자번호
			int result = service.write(vo);
			if(result != 1) {
				session.setAttribute("alert", "게시글 작성 실패...");
				return "redirect:/board/list";
			}
			
//			System.out.println(imgList.get(i));
//			imgVo.setName(imgList.get(i));
//			imgVo.setBoardNo();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("alert", "게시글 작성 성공!");
		return "redirect:/board/list";
	}
	
	
	//서머노트 사진 업로드
    @PostMapping("/upload")
    @ResponseBody
    public List<String> handleFileUpload(@RequestParam("f") List<MultipartFile> flist, HttpServletRequest req) throws Exception {
        
    	BoardImgVo imgVo = new BoardImgVo();
    	List<BoardImgVo> imgVoList = new ArrayList();
    	
    	//이미지 리스트
		String path = req.getServletContext().getRealPath("/resources/board/");
		List<String> imgList =  FileUploader.saveFile(path, flist);
		
		System.out.println(imgList);
		
		//이미지 리스트 폴더에 저장
		for (int i = 0 ; i < imgList.size() ; i++) {
			String filePath = path + imgList.get(i);
			File destinationFile = new File(filePath);
			flist.get(i).transferTo(destinationFile);
			
		}
		
		return imgList;

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
		
		//댓글 null 검사
		if (rvo.getContent() == null || rvo.getContent().trim().isEmpty()) {
			return "empty";
		}
		
		int result = service.writeReply(rvo);
		
		if(result < 0) {
			return "fail";
		}
		
		return "success";
		
	}
	
	//댓글 수정
	@PostMapping("reply/edit")
	@ResponseBody
	public String editReply(HttpSession session, ReplyVo rvo) {
		
		AdminVo loginMember = (AdminVo) session.getAttribute("loginMember");
		
		//댓글 null 검사
		if (rvo.getContent() == null || rvo.getContent().trim().isEmpty()) {
			return "empty";
		}
		
		int result = service.editReply(rvo);
		
		if(result < 0) {
			return "fail";
		}
		
		return "success";
		
	}
	
	//댓글 목록 조회
	@GetMapping("reply/list")
	@ResponseBody
	public List<ReplyVo> getReplyList(HttpSession session, String boardNo) throws JsonProcessingException {
		
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		List<ReplyVo> rvoList = service.getReplyList(boardNo);
		
		System.out.println(rvoList);
		
//		if(rvoList == null) {
//			return "fail";
//		}
		
		//자바객체 -> JSON 형태
//		ObjectMapper mapper = new ObjectMapper();
//		String replyList = mapper.writeValueAsString(rvoList);
		
		return rvoList;

	}
	
	//좋아요
	@GetMapping("love")
	@ResponseBody
	public int clickLove(LoveVo lvo) {

		//좋아요 여부
		int loveYn = service.checkLoveYn(lvo);
		
		//여부에 따라 좋아요 증감
		if (loveYn == 0 ) {
			service.insertLove(lvo);
		}else if (loveYn == 1 ) {
			service.deleteLove(lvo);
		}
		
		//좋아요 세기
		int loveCnt = service.countLove(lvo);
		
		return loveCnt;
		
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