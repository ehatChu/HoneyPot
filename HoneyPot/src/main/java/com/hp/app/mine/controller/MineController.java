package com.hp.app.mine.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.app.exception.YerinException;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.mine.service.MineService;
import com.hp.app.mine.vo.MineVo;
import com.hp.app.page.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import retrofit2.http.GET;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MineController {
	private final MineService service;
	//사유물 목록보기(화면)본인
	@GetMapping("car-list")
	public String regiMine(HttpSession session,Model model) {
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		//리스트 DB에서 조회하기
		List<MineVo> carList = service.getCarList(loginMember);
		
		
		model.addAttribute("mineVoList",carList);

		
		return "mypage/myInfo/mine/registration-car";
	}
	
	//사유물 등록
	//mineCno는 mine의 종류
	@PostMapping("regi-mine")
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
		log.info("mineCno : {}",mineCno);
		int result =service.register(mvo,mineCno);
		
		if(result!=1) {    
			throw new RuntimeException("서비스인서트실행중에러");
		}
		return "redirect:/car-list";
	
	}
	
	// 사유물내역 (화면)
	@GetMapping("admin/property-list/car")
	public String propertyList(int p,Model model){
		//getCnt로 가져오기
		//car와 자전거까지 다 세기
		//도대체 이게 왜안되는지 모르겠다.
		int listCount = service.getCarCnt(); 		
		int currentPage = p;
		int pageLimit = 5; //페이지는 1,2,3,4,5 까지만
		int boardLimit =9; //한페이지에 list는 7개만 들어가게
		
		PageVo pv = new PageVo(listCount,currentPage,pageLimit,boardLimit);
				
		
		//리스트를 가져올때 페이지vo를 넘기면서 가져오기		
		//전체조회시 pv만 들어가게 조회
		List<MineVo> mvoList = service.getCarList(pv);
		
		model.addAttribute("pv",pv);
		model.addAttribute("mineVoList",mvoList);

		
		return "admin/member/car-list";
	}
	
	//모달창에서 관리자 사유물 승인반려 누르면
	//넘버와 사유물의 종류
	@GetMapping("admin/property-delete")
	public String propertyDelete(@RequestParam Map<String,String> map) {
		log.info("map : {}",map);
		int result = service.deleteProperty(map);
		//db삭제는 되었는데//// 
		return "redirect:/admin/property-list/car?p=1";
	}
	
	
	
	//ajax 상세보기모달
	@GetMapping(produces ="application/json; charset=UTF-8",value = "property-detail")
	@ResponseBody
	public String propertyDetail(@RequestParam Map<String,String> map) throws Exception {
		
		ObjectMapper om = new ObjectMapper();
		MineVo mvo = service.getDetailAdmin(map);
		// Map or List Object 를 JSON 문자열로 변환
		String jsonStr = om.writeValueAsString(mvo);
		return jsonStr;
	}
	
	//사유물리스트-검색
	@GetMapping("property-list/search")
	public String propertyListSearch(@RequestParam Map<String,String> searchValueMap,Model model) {
		//일단 값이 잘 넘어왔는지 살피기
		
		List<MineVo> mvoList =null;
		//분류가 전체일때...
		if(searchValueMap.get("carOrBicycle").equals("0")) {
			//search-mapper1과 연결
			mvoList = service.searchAllList(searchValueMap);
		}else {
		}
		
		
		//아닐때
		log.info("mvoList : {}",mvoList);
		
		
		//분류에 선택값이 들어왔을 때...
		//model에 minVoList로 넘기자
		model.addAttribute("mineVoList",mvoList);
		
		return "admin/member/property-list";
	}
	
	@PostMapping("property-refuse")
	public String propertyRefuse(String detailNo,String detailKinda) {
		//int result = service.refuse(detailNo);
		
		return "redirect:/property-list?p=1";
	}
}
