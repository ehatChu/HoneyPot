package com.hp.app.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.board.service.BoardService;
import com.hp.app.calendar.vo.MemberCalendarVo;
import com.hp.app.main.service.MainService;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.notice.vo.NoticeVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("main")
public class MainController {
	private final MainService ms;
	private MemberVo loginMember;
	private AdminVo captain;

	@GetMapping("mmain")
	public String mmain(HttpSession session, Model model) {
		loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다");
			return "redirect:/member/mlogin";
		}
		captain = ms.getCaptain(loginMember.getDongNum() + "동대표");
		session.setAttribute("captain", captain);

		List<MemberCalendarVo> memberCalendarList = ms.getMemberCalendarList(loginMember.getNo());
		List<MemberVo> memberPointList = ms.getMemberPointList();

		System.out.println(memberPointList);

		model.addAttribute("memberPointList", memberPointList);
		model.addAttribute("memberCalendarList", memberCalendarList);

		return "main/mmain";
	}

	@GetMapping("amain")
	public String amain() {
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
	public String[] getCaptainLove() {
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
	public int voteCaptainLove(String love) {
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
