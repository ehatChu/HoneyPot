package com.hp.app.csc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.csc.service.CSCService;
import com.hp.app.csc.vo.FAQCategoryVo;
import com.hp.app.csc.vo.FAQVo;
import com.hp.app.csc.vo.QNACategoryVo;
import com.hp.app.csc.vo.QNAVo;
import com.hp.app.csc.vo.ReportCategoryVo;
import com.hp.app.csc.vo.ReportVo;
import com.hp.app.csc.vo.SearchVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CSCController {

	private final CSCService service;
	
	// 회원
	
	// FAQ 조회(화면)
	@GetMapping("csc/faq")
	public String getFAQList(Model model,@RequestParam(defaultValue = "1") String page,@RequestParam Map<String, String> searchVo) {

//		@RequestParam defaultValue로 수정		
//		if(page == null) {
//			page = "1";
//		}
		
		// @RequestParam Map<String, String> searchVo으로 수정
		//검색값 저장
//		Map<String, String> searchVo = new HashMap<>();
//		searchVo.put("searchType", searchType);
//		searchVo.put("searchValue", searchValue);
		
		int listCount = service.getFAQCnt(searchVo);
		int currentPage = Integer.parseInt(page);
		int pageLimit = 5;
		int boardLimit = 8;
		
		PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		

		
		List<FAQVo> fList = service.getFAQList(pvo,searchVo);
		List<FAQCategoryVo> cList = service.getFAQCatList();
		
		model.addAttribute("fList", fList);
		model.addAttribute("cList", cList);
		model.addAttribute("pvo", pvo);
		model.addAttribute("searchVo", searchVo);
		
		return "csc/member/faq";
	}
	
	// FAQ 상세조회
	@GetMapping("csc/faq/detail")
	@ResponseBody
	public FAQVo getFAQDetail(String fno) throws Exception {
		FAQVo vo = service.getFAQByNo(fno);
		
		if(vo == null) {
			throw new Exception("상세조회 에러");
		}
		
		return vo;
	}
	
	// 문의하기(화면)
	@GetMapping("csc/inquiry")
	public String inquiry(Model model) throws Exception {
		
		List<QNACategoryVo> cList = service.getQNACatList();
		
		if(cList == null) {
			throw new Exception("문의등록 카테고리 조회 에러");
		}
		
		model.addAttribute("cList", cList);
		
		return "csc/member/inquiry";
	}
	
	// 문의등룍
	@PostMapping("csc/inquiry")
	public String inquiry(QNAVo vo) throws Exception {
		
		if(vo.getTitle() == null || vo.getContent() == null) {
			throw new Exception("게시판 작성 에러");
		}
		
		vo.setMemberNo("1");
		int result = service.insertInquiry(vo);
		
		if(result != 1) {
			return "redirect:/errorPage";
		}
		
		return "redirect:/csc/inquiry-list";
	}

	
	// 문의목록 (화면)
	@GetMapping("csc/inquiry-list")
	public String inquiryList(Model model) {
		String no = "1";
		List<QNAVo> qList = service.getMyQNAList(no);
		
		model.addAttribute("qList", qList);
		
		return "csc/member/inquiry-list";
	}
	
	// 문의상세조회 (화면)
	@GetMapping("csc/qna/detail")
	@ResponseBody
	public QNAVo getQNADetail(String qno) throws Exception {
		
		String no = "1";
		
		if("".equals(qno) || qno == null) {
			throw new Exception("QNA 상세조회 실패");
		}
		
		QNAVo qvo = new QNAVo();
		qvo.setMemberNo(no);
		qvo.setNo(qno);
		
		QNAVo vo = service.getMyQNAByNo(qvo);
		
		if(vo == null) {
			throw new Exception("QNA 상세조회 실패");
		}
		
		return vo;
	}
	
	// 문의 내역 삭제
	@GetMapping("/csc/inquiry/delete")
	public String deleteMyInquiry(String bno) throws Exception {
		
		QNAVo vo = new QNAVo();
		vo.setNo(bno);
		vo.setMemberNo("1");
		
		int result = service.deleteMyInquiry(vo);
		
		if(result != 1) {
			throw new Exception("문의내역 에러...");
		}
		
		return "redirect:/csc/inquiry-list";
	}
	
	
	// 신고하기(화면)
	@GetMapping("csc/report")
	public String report(Model model) {
		
		List<ReportCategoryVo> cList = service.getReportCatList();
		
		model.addAttribute("cList", cList);
		
		return "csc/member/report";
	}
	
	// 신고하기
	@PostMapping("csc/report")
	public String report(ReportVo vo) throws Exception {
		
		vo.setReporter("1");
		System.out.println(vo);
		
		int result = service.insertReport(vo);
		
		if(result != 1) {
			throw new Exception("신고하기 에러");
		}
		
		return "redirect:/csc/report-list";
		
	}
	
	// 신고 대상 회원 List 조회
	@PostMapping("csc/report/memberList")
	@ResponseBody
	public List<MemberVo> getMemberList(SearchVo vo){		
	
		List<MemberVo> mList = service.getMemberList(vo);
		
		return mList;
		
	}
	
	// 신고 대상 회원 조회
	@PostMapping("csc/report/member")
	@ResponseBody
	public MemberVo getMemberByNo(String mno) {
		
		System.out.println(mno);
		
		MemberVo vo = service.getMemberByNo(mno);
		
		return vo;
		
	}
	
	// 신고목록 (화면)
	@GetMapping("csc/report-list")
	public String getReportList(Model model) {
		
		String no = "1";
		
		List<ReportVo> rList = service.getMyReportList(no);
		
		model.addAttribute("rList", rList);
		
		return "csc/member/report-list";
	}
	
	// 신고 상세 조회
	@GetMapping("csc/report/detail")
	@ResponseBody
	public ReportVo getMyReportByNo(String rno) throws Exception {
		
		String no = "1";
		
		if("".equals(rno) || rno == null) {
			throw new Exception("QNA 상세조회 실패");
		}
		
		ReportVo rvo = new ReportVo();
		rvo.setReporter(no);
		rvo.setNo(rno);
		
		
		ReportVo vo = service.getMyReportByNo(rvo);
		
		if(vo == null) {
			throw new Exception("QNA 상세조회 실패");
		}
		
		return vo;
	}
	
	// 신고 내역 삭제
	@GetMapping("csc/report/delete")
	public String deleteMyReport(String rno) throws Exception {
		
		String memberNo = "1";
		
		ReportVo rvo = new ReportVo();
		
		rvo.setNo(rno);
		rvo.setReporter(memberNo);
		
		int result = service.deleteMyReport(rvo);
		
		if(result != 1) {
			throw new Exception("신고 내역 삭제 에러");
		}
		
		return "redirect:/csc/report-list";
	}
	
	//--------------------------------------------------------------------------------------------
	
	// 관리자
	
	// 1대1 상담내역(화면)
	@GetMapping("admin/csc/inquiry-list")
	public String adminInquiryList(Model model,@RequestParam(defaultValue = "1") String page,@RequestParam Map<String, String> searchMap) throws Exception {
		
		try {
//			System.out.println(searchMap);
			
			// 페이징 처리
			int listCount = service.getQNACnt(searchMap);
			int currentPage = Integer.parseInt(page);
			int pageLimit = 5;
			int boardLimit = 6;
			
			PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			List<QNACategoryVo> cList = service.getQNACatList();
			List<QNAVo> qList = service.getQNAList(pvo, searchMap);
			
			if(cList == null) {
				throw new Exception("문의등록 카테고리 조회 에러");
			}
			
			// 갯수 조회
			List<QNAVo> nList = service.getQNAAllList(searchMap);
			int sum = 0;
			int answerY = 0;
			int answerN = 0;
			
			for(QNAVo vo : nList) {
				if("N".equals(vo.getAnswerYn())) {
					answerN++;
				}else if("Y".equals(vo.getAnswerYn())) {
					answerY++;
				}
			}
			
			sum = answerY + answerN;
			Map<String, String> listCnt = new HashMap<String, String>();
			
			
			listCnt.put("sum", Integer.toString(sum));
			listCnt.put("answerY", Integer.toString(answerY));
			listCnt.put("answerN", Integer.toString(answerN));
			
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("cList", cList);
			model.addAttribute("qList", qList);
			model.addAttribute("pvo", pvo);
			model.addAttribute("searchVo", searchMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "csc/admin/inquiry-list";
	}
	
	// 문의내역 상세조회
	@PostMapping("admin/csc/inquiry/detail")
	@ResponseBody
	public QNAVo getQNAByNo(String qno) throws Exception {
	
		QNAVo qvo = service.getQNAByNo(qno);
		
		if(qvo == null) {
			throw new Exception("문의내역 상세조회 에러");
		}
		
		return qvo;
	}
	
	// 문의내역 삭제
	@GetMapping("admin/csc/inquiry/delete")
	public String deleteInquiry(String qno) throws Exception {
		
		try {
			int result = service.deleteInquiry(qno);
			
			if(result != 1) {
				throw new Exception("관리자 문의내역 삭제 에러");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/csc/inquiry-list";
		
	}
	
	// 문의내역 답변 달기
	@PostMapping("admin/csc/inquiry/answer")
	@ResponseBody
	public QNAVo answerInquiry(String qno, String answer) throws Exception {
		
		QNAVo vo = service.anwerInuqiry(qno, answer);
		
		if(vo == null) {
			throw new Exception();
		}
		
		return vo;
	}
	
	// 신고내역(화면)
	@GetMapping("admin/csc/report-list")
	public String adminReportList(Model model,@RequestParam(defaultValue = "1") String page,@RequestParam Map<String, String> searchMap) throws Exception {
		
		try {
			List<ReportCategoryVo> cList = service.getReportCatList();
			
			if(cList == null) {
				throw new Exception("신고 내역 카테고리 조회 에러");
			}
			
			// 페이징 처리
			int listCount = service.getReportCnt(searchMap);
			int currentPage = Integer.parseInt(page);
			int pageLimit = 5;
			int boardLimit = 6;
			
			PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			List<ReportVo> rList = service.getReportList(pvo, searchMap);
			
			// 갯수 조회
			List<ReportVo> nList = service.getReportAllList(searchMap);
			int sum = 0;
			int answerY = 0;
			int answerN = 0;

			for(ReportVo vo : nList) {
				if("N".equals(vo.getAnswerYn())) {
					answerN++;
				}else if("Y".equals(vo.getAnswerYn())) {
					answerY++;
				}
			}
			
			sum = answerY + answerN;
			Map<String, String> listCnt = new HashMap<String, String>();
			
			
			listCnt.put("sum", Integer.toString(sum));
			listCnt.put("answerY", Integer.toString(answerY));
			listCnt.put("answerN", Integer.toString(answerN));
			
			model.addAttribute("cList", cList);
			model.addAttribute("listCnt", listCnt);
			model.addAttribute("rList", rList);
			model.addAttribute("pvo", pvo);
			model.addAttribute("searchVo", searchMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "csc/admin/report-list";
	}
	
	// 신고내역 상세조회
	@PostMapping("admin/csc/report/detail")
	@ResponseBody
	public ReportVo getReportByNo(String rno) throws Exception {
	
		ReportVo qvo = service.getReportByNo(rno);
		
		if(qvo == null) {
			throw new Exception("신고내역 상세조회 에러");
		}
		
		return qvo;
	}
	
	// 신고내역 삭제
	@GetMapping("admin/csc/report/delete")
	public String deleteReport(String rno) throws Exception {
		
		try {
			int result = service.deleteReport(rno);
			
			if(result != 1) {
				throw new Exception("관리자 문의내역 삭제 에러");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/csc/report-list";
		
	}
	
	// 신고 내역 처리
	@GetMapping("admin/csc/report/complete")
	public String completeReport(String rno) throws Exception {
		int result = service.completeReport(rno);
		
		if(result != 1) {
			throw new Exception("신고 내역 처리 에러");
		}
		
		return "redirect:/admin/csc/report-list";
	}
	
	// FAQ 조회(화면)
	@GetMapping("admin/csc/faq")
	public String adminFAQ(Model model,@RequestParam(defaultValue = "1") String page,@RequestParam Map<String, String> searchVo) {
		
		try {
			int listCount = service.getFAQCntAdmin(searchVo);
			int currentPage = Integer.parseInt(page);
			int pageLimit = 5;
			int boardLimit = 8;
			
			PageVo pvo = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			List<FAQVo> fList = service.getFAQListAdmin(pvo,searchVo);
			List<FAQCategoryVo> cListCnt = service.getFAQCatListAdmin();
			List<FAQCategoryVo> cList = service.getFAQCatList();
			
			
			model.addAttribute("cList", cList);
			model.addAttribute("cListCnt", cListCnt);
			model.addAttribute("fList", fList);
			model.addAttribute("pvo", pvo);
			model.addAttribute("searchVo", searchVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "csc/admin/faq";
	}
	
	// FAQ 삭제
	@GetMapping("admin/csc/faq/delete")
	public String deleteFAQ(String fno) throws Exception {
		
		try {
			int result = service.deleteFAQ(fno);
			
			if(result != 1) {
				throw new Exception("FAQ 삭제 에러");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/csc/faq";
	}
	
	// FAQ 수정
	@PostMapping("admin/csc/faq/edit")
	@ResponseBody
	public FAQVo editFAQ(@RequestParam Map<String,String> editMap) throws Exception {
		
		FAQVo vo = service.editFAQ(editMap);
		
		return vo;
	}
	
	// FAQ 작성
	@PostMapping("admin/csc/faq/write")
	public String writeFAQ(FAQVo vo) throws Exception {
		
		// 나중에 수정
		vo.setWriterNo("1");
		
		int result = service.writeFAQ(vo);
		
		if(result != 1) {
			throw new Exception("FAQ 작성 에러");
		}
		
		return "redirect:/admin/csc/faq";
	}
	

}
