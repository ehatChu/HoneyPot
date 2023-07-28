package com.hp.app.facilities.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hp.app.innerFac.service.InnerFacService;
import com.hp.app.innerFac.vo.InnerFacRsVo;
import com.hp.app.innerFac.vo.InnerFacVo;
import com.hp.app.member.vo.MemberVo;
import com.hp.app.yerin.functions.YerinFunctions;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller 
@RequiredArgsConstructor
@Slf4j
public class FacilitiesController {
	private final InnerFacService service;
	private final YerinFunctions y;

	//예약 화면 보여주기
	//no=1이면 도서관 관련
	//이때에도 화면측으로 현재 날짜의 예약들을 보내주어야함.
	@GetMapping("facilities/library/reserve")
	public String reserve(int no,Model model,HttpSession session) throws Exception {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String MemberNo = loginMember.getNo();
		
		//편의시설마다 시간이 다르므로 조회해와야함. 
		InnerFacVo fvo = service.getOpenCloseTime(no);
		
		InnerFacRsVo rsVo = new InnerFacRsVo();
		rsVo.setMemberNo(MemberNo);
		
		//현재날짜정보만 String type으로 넘기기
		//날짜를 주면 String으로 format에 맞게 변환해주는 함수 호출
		String date = y.getStringDate(new Date());
		
		rsVo.setReserveTime(date);
		
		//json으로 변환해야함
		List<String> dateList = service.getReservationTimeInfo(rsVo);
		ObjectMapper om = new ObjectMapper();
		String jsonDate = om.writeValueAsString(dateList);
		
		//예린함수를 거쳐서 openTime, closeTime전달...
		int opentime = y.changeInt(fvo.getOpenTime());
		int closetime = y.changeInt(fvo.getCloseTime());
		
		
		
		
		
		
		model.addAttribute("openTime",opentime);
		model.addAttribute("closeTime",closetime);
		model.addAttribute("reservedDate",jsonDate);
		
		
		
		
		return "innerFacilities/makeLibraryReservation";
	}
	
	//도서관 예약시 DB에 insert하기
	@PostMapping("facilities/reserve")
	public String reserve(String amenityNo, String date, String startTime,HttpSession session,Model model) {
		//값이 잘 전달 되는거 확인 했다
		//전달된 값으로 에약일시 구하기 두 값을 전달하여 합친 예약일시를 구하는 함수 호출 및 메서드 실행ㅇ
		
		String combinedDate = y.getCombinedDate(date,startTime);
		
		//세션에서 꺼내기 loginMember
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		//RsVo에 값들 집어넣기
		InnerFacRsVo rsVo =  new InnerFacRsVo();
		rsVo.setAmenityNo(amenityNo);
		rsVo.setMemberNo(loginMember.getNo());
		rsVo.setReserveTime(combinedDate);
		
		//rsVo를 전달하면서 service호출
		int result = service.makeReservation(rsVo);
		
		if(result!=1) {
			throw new RuntimeException("rsVo를 DB에 전달하는 과정에서 에러발생");
		}
		
		//예약이 완료되었다는 표시를 해줘야하기 때문에 Model에 값을 넣어 전달 모델에 해당 시작시간을 넣자
		model.addAttribute("selectedTime",startTime);
		
		
		
		return "redirect:/facilities/library/reserve?no=1";
		
	}
	
	//ajax로 날짜가 바뀔 때마다 요청받았을 때 
	@GetMapping(produces ="application/json; charset=UTF-8",value = "innerFac/reserve/reservationInfo")
	@ResponseBody
	public String getReservationInfoByNo(String date,HttpSession session,HttpServletResponse resp) throws Exception {
		
		//세션에서 loginMember꺼내지는지
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		String memberNo = loginMember.getNo();
		
		//조건에 해당하는 날짜값들의 List를 service를 호출해서 받아오기
		//값을 담아서 주자  InnerFacRsVo에 값을 담아서 주면 되잖아.
		//받아온 date의 형식을 확인
		
		//date에서 '-'문자 제거
		
		// removedDate를 rsvo에 담기
		InnerFacRsVo rsVo =  new InnerFacRsVo();
		rsVo.setReserveTime(date);
		rsVo.setMemberNo(memberNo);
		
		//서비스 호출하면서 rsVo넘기고 return은 list로 받아오기
		List<String> dateList =  service.getReservationTimeInfo(rsVo);
		
		//jackson으로 list를 json형식으로 바꿔서 내보내기
		ObjectMapper om = new ObjectMapper();
		String jsonStr = om.writeValueAsString(dateList);
		
		//이러면 list가 json형태로 잘 전달되서 log로 찍히겠지? 
		return jsonStr;
	}
	
	//ajax로 get요청을 받았을 때 선택한 시간에 따라 인원수를 화면측으로 전달
	//json형식이여햐함.
	@GetMapping("innerFac/reserve/reservedPeopleCnt")
	@ResponseBody
	public String getNumberOfPeople(@RequestParam Map<String,String> paramMap) throws Exception {		
		//예린함수를 통해 date와 time을 넘기면 String date를 반환하는 함수 호출
		String date = y.getCombinedDate(paramMap.get("date"), paramMap.get("time"));
		Map<String,String> map = new HashMap<String, String>();
		map.put("reserveTime", date);
		map.put("amenityNo", paramMap.get("amenityNo"));
		//map을 전달하면서 서비스를 호출 int를 반환
		int peopleCnt = service.getReservedPeopleCntByTime(map);
		
		String cnt = peopleCnt+"";
		
		ObjectMapper om = new ObjectMapper();
		
		Map<String,String> resultMap = new HashMap<String, String>();
		resultMap.put("cnt", cnt);
		
		String jsonStr = om.writeValueAsString(resultMap);
		return jsonStr;
	}
	
	
	@GetMapping("facilities/outerFacilities/map")
	public String showMap() {
		return "outerFacilities/showMap";
	}
	@GetMapping("facilities/outer/review-list")
	public String reviewList() {
		return "mypage/act/reviewOuterFacilities";
	}
	
	//관리자 편의시설 정보변경
	@GetMapping("facilities/admin/library/editInfo")
	public String editInfo() {
		return "admin/facilities/library-editInfo";
	}
	
	//관리자 편의시설 관리
	@GetMapping("facilities/admin/reserve-list")
	public String manageReservation() {
		return "admin/facilities/reserveList";
	}
	
	
}

