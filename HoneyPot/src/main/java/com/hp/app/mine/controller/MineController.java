package com.hp.app.mine.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hp.app.exception.YerinException;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.service.MineService;
import com.hp.app.mine.vo.MineVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MineController {
	private final MineService service;
	//사유물 목록보기(화면)
	@GetMapping("regi/mine/mypage")
	public String regiMine(HttpSession session,Model model) {
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		//리스트 DB에서 조회하기
		List<MineVo> mvoList = service.getAllList(loginMember);
		
		
		model.addAttribute("mineVoList",mvoList);

		
		return "mypage/myInfo/mine/registration";
	}
	
	//사유물 등록
	@PostMapping("mypage/register")
	public String regiMine(HttpServletRequest req,MineVo mvo,int mineCno, List<MultipartFile> fList) throws Exception{
		MultipartFile f =fList.get(0);
		if(f.getOriginalFilename()==null) {
			throw new RuntimeException("이미지없음에러");
		}
		
		//서버에 파일올리기
		//String savePath = "/resources/member/mine/";
		String savePath =  req.getServletContext().getRealPath("/resources/member/mine/");
		String randomName = UUID.randomUUID().toString();//체인지네임 얻기
		String originName = f.getOriginalFilename();
		String ext= originName.substring(originName.lastIndexOf("."));//확장자구하기
		String changeName = randomName+ext;
		String path = savePath+changeName;
		
		File target = new File(path);
		
		f.transferTo(target);
		
		//이미지명 DB에 저장하기 위해
		mvo.setImg(changeName);
		
		//멤버 값에 넣을 로그인멤버
		HttpSession session = req.getSession();
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		mvo.setMemberNo(loginMember.getNo());
		int result =service.register(mvo,mineCno);
		//int result = service.register(mvo);
		if(result!=1) {    
			throw new RuntimeException("서비스인서트실행중에러");
		}
		return "redirect:/regi/mine/mypage";
	
	}
	
	// 사유물내역 (화면)
	@GetMapping("property-list")
	public String propertyList(int p,Model model) {
		//getCnt로 가져오기
		//car와 자전거까지 다 세기
		//도대체 이게 왜안되는지 모르겠다.
		int listCount = service.getAllCnt(); 		
		int currentPage = p;
		int pageLimit = 5; //페이지는 1,2,3,4,5 까지만
		int boardLimit =7; //한페이지에 list는 7개만 들어가게
		
		PageVo pv = new PageVo(listCount,currentPage,pageLimit,boardLimit);
				
		
		//리스트를 가져올때 페이지vo를 넘기면서 가져오기		
		//전체조회시 pv만 들어가게 조회
		List<MineVo> mvoList = service.getAllList(pv);
		model.addAttribute("mineVoList",mvoList);
		
		return "admin/member/property-list";
	}
		
}
