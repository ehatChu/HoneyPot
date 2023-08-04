package com.hp.app.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;
import com.hp.app.calendar.vo.MemberCalendarVo;
import com.hp.app.main.service.MainService;
import com.hp.app.meal.service.MealService;
import com.hp.app.meal.vo.MealVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("main")
public class MainController {
	private final MainService ms;
	private final MealService mealService;

	@GetMapping("mmain")
	public String mmain(HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다");
			return "redirect:/member/mlogin";
		}
		AdminVo captain = ms.getCaptain(loginMember.getDongNum() + "동대표");
		session.setAttribute("captain", captain);

		List<MemberCalendarVo> memberCalendarList = ms.getMemberCalendarList(loginMember.getNo());
		List<MemberVo> memberPointList = ms.getMemberPointList();
		List<MemberVo> dongPointList = ms.getDongPointList();
		List<MealVo> mealListTotal = mealService.getMealList();
		
		model.addAttribute("memberPointList", memberPointList);
		model.addAttribute("memberCalendarList", memberCalendarList);
		model.addAttribute("dongPointList", dongPointList);
		model.addAttribute("mealListTotal", mealListTotal);
		return "main/mmain";
	}

	@GetMapping("amain")
	public String amain(HttpSession session, Model model) {
		AdminVo loginAdmin = (AdminVo) session.getAttribute("loginAdmin");
		if (loginAdmin == null) {
			session.setAttribute("alertMsg", "관리자만 접근 가능합니다");
			return "redirect:/member/alogin";
		}

		List<NoticeCalendarVo> noticeCalendarList = ms.getNoticeCalendarList();
		int[] paramCntArr = ms.getParamCntArr();

		model.addAttribute("noticeCalendarList", noticeCalendarList);
		model.addAttribute("paramCntArr", paramCntArr);

		return "main/amain";
	}

	@GetMapping("noticeList")
	@ResponseBody
	public List<NoticeVo> getNoticeList() {
		int listCount = ms.getNoticeCnt();
		int currentPage = 1;
		int pageLimit = 5;
		int boardLimit = 7;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<NoticeVo> noticeList = ms.getNoticeList(pv);
		return noticeList;
	}

	@GetMapping("popularList")
	@ResponseBody
	public List<NoticeVo> getPopularList() {
		int listCount = ms.getPopularCnt();
		int currentPage = 1;
		int pageLimit = 5;
		int boardLimit = 7;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<NoticeVo> popularList = ms.getPopularList(pv);
		return popularList;
	}

	@GetMapping("captainLove")
	@ResponseBody
	public String[] getCaptainLove(HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		AdminVo captain = (AdminVo) session.getAttribute("captain");
		String[] arr = new String[3];
		String memberNo = loginMember.getNo();
		String captainNo = captain.getNo();
		String[] paramArr = { memberNo, captainNo };

		arr[0] = Integer.toString(ms.getCaptainLoveCnt(captainNo));
		arr[1] = Integer.toString(ms.getCaptainHateCnt(captainNo));
		arr[2] = ms.getMyCaptainLove(paramArr);

		return arr;
	}

	@GetMapping("vote")
	@ResponseBody
	public int voteCaptainLove(String love, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		AdminVo captain = (AdminVo) session.getAttribute("captain");
		String memberNo = loginMember.getNo();
		String captainNo = captain.getNo();
		String[] paramArr = { love, memberNo, captainNo };
		int result = ms.voteCaptainLove(paramArr);

		if (result != 1) {
			throw new RuntimeException();
		}

		return result;
	}

}
