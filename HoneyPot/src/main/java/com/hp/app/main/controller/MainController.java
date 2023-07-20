package com.hp.app.main.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.admin.vo.AdminVo;
import com.hp.app.board.service.BoardService;
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
	private final BoardService bs;
	private MemberVo loginMember;
	private AdminVo captain;

	@GetMapping("mmain")
	public String mmain(HttpSession session) {
		loginMember = (MemberVo) session.getAttribute("loginMember");
		if (loginMember == null) {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다");
			return "redirect:/member/mlogin";
		}

		captain = ms.getCaptain(loginMember.getDongNum() + "동대표");
		session.setAttribute("captain", captain);

		return "main/mmain";
	}

	@GetMapping("amain")
	public String amain() {
		return "main/amain";
	}

	@GetMapping("noticeList")
	@ResponseBody
	public List<NoticeVo> getNoticeList() {
		int listCount = bs.cntBoard();
		int currentPage = 1;
		int pageLimit = 5;
		int boardLimit = 7;

		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
		List<NoticeVo> noticeList = bs.list(pv);
		return noticeList;
	}

	@GetMapping("captainLove")
	@ResponseBody
	public int[] getCaptainLove() {
		int[] arr = new int[2];

		String no = captain.getNo();
		int captainLoveCnt = ms.getCaptainLoveCnt(no);
		int captainHateCnt = ms.getCaptainHateCnt(no);
		arr[0] = captainLoveCnt;
		arr[1] = captainHateCnt;

		return arr;
	}
	
	@GetMapping("vote")
	@ResponseBody
	public int[] voteCaptainLove(String love) {
		String memberNo = loginMember.getNo();
		String captainNo = captain.getNo();
		String[] arr = {love, memberNo, captainNo};
		int temp = ms.voteCaptainLove(arr);
		
		if(temp != 1) {
			throw new RuntimeException();
		}
		
		int[] result = new int[2];
		int captainLoveCnt = ms.getCaptainLoveCnt(captainNo);
		int captainHateCnt = ms.getCaptainHateCnt(captainNo);
		result[0] = captainLoveCnt;
		result[1] = captainHateCnt;
		
		return result;
	}

}
