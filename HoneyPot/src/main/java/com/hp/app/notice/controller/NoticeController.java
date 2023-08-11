package com.hp.app.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.notice.service.NoticeService;
import com.hp.app.notice.vo.NoticeCategoryVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.notice.vo.PersonalVoteVo;
import com.hp.app.notice.vo.VoteCandidateVo;
import com.hp.app.notice.vo.VoteVo;
import com.hp.app.page.vo.PageVo;
import com.hp.app.util.file.FileUploader;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService service;

	// 공지사항 목록 조회
	@GetMapping("notice/list")
	public String getList(@RequestParam(defaultValue = "1") String p, @RequestParam Map<String, String> searchVo, HttpSession session, Model model) {
		
		//관리자도, 회원도 아니면 리턴
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginAdmin == null && loginMember == null) {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/main/mmain";
		}
		
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
	public String write(HttpSession session, Model model) {
		
		//관리자 아니면 리턴
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		if(loginAdmin == null) {
			session.setAttribute("alertMsg", "관리자로 로그인 해주세요.");
			return "redirect:/main/mmain";
		}
		
		List<NoticeCategoryVo> cvo = service.getCategory();
		model.addAttribute("cvo", cvo);
		return "notice/write";
	}
	
	// 공지사항 작성
	@PostMapping("notice/write")
	public String write(HttpSession session, NoticeVo vo, VoteVo vvo, String voteCandidateNo, String voteCandidateName) {
		
		try {
			
			//관리자 아니면 리턴
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
			if(loginAdmin == null) {
				session.setAttribute("alertMsg", "관리자로 로그인 해주세요.");
				return "redirect:/main/mmain";
			}
			
			vo.setWriterNo(loginAdmin.getNo());
						
			//상단공지 null -> N
			if(vo.getImportantYn() == null) {
				vo.setImportantYn("N");
			}
			
			System.out.println(vo);
			
			int result = service.write(vo);
			if(result != 1) {
				session.setAttribute("alertMsg", "게시글 작성 실패...");
				return "redirect:/notice/list";
			}
			
			
			//투표 정보 DB 삽입
			System.out.println(vvo);
			int makeVoteResult = 0;
			if (vvo.getVoteTitle() != null && !"".equals(vvo.getVoteTitle()) && vvo.getEndDate() != null && !"".equals(vvo.getEndDate())) {
				makeVoteResult = service.makeVote(vvo);
				System.out.println("투표 생성 결과 : " + makeVoteResult);
			}
			
			
			//투표항목 삽입
			System.out.println("nos : " + voteCandidateNo);
			System.out.println("names : " + voteCandidateName);
			
			List<VoteCandidateVo> vcvoList = new ArrayList<>();
			if(makeVoteResult == 1) {
				String[] noArr = voteCandidateNo.split(",");
				String[] nameArr = voteCandidateName.split(",");
				
				for (int i=0 ; i<noArr.length ; i++) {
					VoteCandidateVo vcvo = new VoteCandidateVo();
					vcvo.setNo(noArr[i]);
					vcvo.setName(nameArr[i]);
					System.out.println("vcvo" + i + "회차 : " + vcvo);
					vcvoList.add(vcvo);
					System.out.println(vcvoList.toString());
				}
				
				int insertVoteArticleResult = service.insertVoteArticle(vcvoList);
				System.out.println("투표 항목 삽입 : " + insertVoteArticleResult);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		session.setAttribute("alertMsg", "게시글 작성 성공!");
		return "redirect:/notice/list";
	}
	
	
	//서머노트 사진 업로드
    @PostMapping("notice/upload")
    @ResponseBody
    public List<String> handleFileUpload(@RequestParam("f") List<MultipartFile> flist, HttpServletRequest req) throws Exception {
    	
    	//이미지 리스트
		String path = req.getServletContext().getRealPath("/resources/notice/");
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

    
	// 공지사항 상세조회
	@GetMapping("notice/detail")
	public String viewDetail(@RequestParam(defaultValue="1")String no, HttpSession session, Model model) {
		
		//관리자도, 회원도 아니면 리턴
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginAdmin == null && loginMember == null) {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			return "redirect:/main/mmain";
		}
		
		try {
			
			NoticeVo vo = service.viewDetail(no);
			model.addAttribute("vo", vo);
			System.out.println(vo);
			
			VoteVo voteVo = service.getVote(no);
			
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			String endDate = sdf.format(voteVo.getEndDate());
//			voteVo.setEndDate(endDate);
			model.addAttribute("voteVo", voteVo);
			System.out.println(voteVo);

			
//			if (no == null) {
//				return "notice/list";
//			}
			
			//투표가 있다면
			if (voteVo != null) {
				
				//투표여부
				PersonalVoteVo pvvo = new PersonalVoteVo();
				pvvo.setVoteNoticeNo(no);
				
				if (loginMember != null && loginAdmin == null) {
					pvvo.setMemberNo(loginMember.getNo());
				}else if(loginMember == null && loginAdmin != null) {
					pvvo.setMemberNo("0");
				}
				
				int voteYn = service.checkVoteYn(pvvo);
				System.out.println("투표? :" +voteYn);
				model.addAttribute("voteYn", voteYn);
				
				//투표 항목 + 득표수
				List<VoteCandidateVo> vcvoList = service.getVoteCandidate(no);
				model.addAttribute("vcvoList", vcvoList);
				System.out.println(vcvoList);
				
				//총 투표 수
				int totalResult = service.countVoteTotal(no);
				System.out.println(totalResult);
				model.addAttribute("totalCnt", totalResult);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return "notice/detail";
	}
	
	//공지사항 수정 (화면)
	@GetMapping("notice/edit")
	public String edit(HttpSession session, Model model, String no) {
		
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		if(loginAdmin == null) {
			session.setAttribute("alertMsg", "관리자로 로그인 해주세요.");
			return "redirect:/main/mmain";
		}
		
		List<NoticeCategoryVo> cvo = service.getCategory();
		model.addAttribute("cvo", cvo);

		NoticeVo vo = service.viewDetail(no);
		model.addAttribute("vo", vo);
		
		if(no == null || "".equals(no) || "0".equals(no)) {
			session.setAttribute("alertMsg", "잘못된 접근입니다.");
			return "redirect:/notice/list";
		}
		return "notice/edit";
	}
	
	
	//공지사항 수정
	@PostMapping("notice/edit")
	public String edit(HttpSession session, NoticeVo vo) {
		
		try {
			
			//관리자가 아니거나, 작성자가 다를 때
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
			if(loginAdmin == null || vo.getWriterNo() != loginAdmin.getNo() ) {
				session.setAttribute("alertMsg", "잘못된 접근입니다.");
				return "redirect:/main/mmain";
			}
			
			//상단공지 null -> N
			if(vo.getImportantYn() == null) {
				vo.setImportantYn("N");
			}
			
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
			
			NoticeVo vo = service.viewDetail(no); 
			//관리자가 아니거나, 작성자가 다를 때
			AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
			if(loginAdmin == null || vo.getWriterNo() != loginAdmin.getNo() ) {
				session.setAttribute("alertMsg", "잘못된 접근입니다.");
				return "redirect:/main/amain";
			}
			
			String writerNo = loginAdmin.getNo();
			
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
	
	
	//투표 제출
	@PostMapping("notice/detail/vote")
	@ResponseBody
	public String submitVote(PersonalVoteVo pvvo) {
		
		int voteYn = service.checkVoteYn(pvvo);
		
		if (voteYn != 1) {
			int submitResult = service.insertPersonalVote(pvvo);
			System.out.println(submitResult);
			System.out.println("투표성공");
			
			//투표 항목 + 득표수
			List<VoteCandidateVo> vcvoList = service.getVoteCandidate(pvvo.getVoteNoticeNo());
//			model.addAttribute("vcvoList", vcvoList);
			System.out.println(vcvoList);
			
			//총 투표 수
			int totalResult = service.countVoteTotal(pvvo.getVoteNoticeNo());
			System.out.println(totalResult);
//			model.addAttribute("totalCnt", totalResult);
			
		}else {
			System.out.println("실패");
			return "error";
		}
		
		//자바객체 -> JSON 형태
//		ObjectMapper mapper = new ObjectMapper();
//		String replyList = mapper.writeValueAsString(rvoList);
		
		return "success";
	}
	
	
	//투표 취소
	@PostMapping("notice/detail/cancel")
	@ResponseBody
	public String cancelVote(PersonalVoteVo pvvo) {
		
		int voteYn = service.checkVoteYn(pvvo);
		
		if (voteYn == 1) {
			int delResult = service.deletePersonalVote(pvvo);
			System.out.println(delResult);
			System.out.println("투표취소성공");
		}else {
			System.out.println("실패");
			return "error";
		}
		
		return "success";
	}
	

}
