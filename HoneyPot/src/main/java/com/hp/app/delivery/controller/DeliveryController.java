package com.hp.app.delivery.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hp.app.delivery.service.DeliveryService;
import com.hp.app.delivery.vo.ParcelVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeliveryController {

	private final DeliveryService service;
	
	// 알림 조회
	@PostMapping("parcel-list")
	@ResponseBody
	public List<ParcelVo> getParcelList(String memberNo) {
		
		List<ParcelVo> pvoList = service.getParcelList(memberNo);
		
		return pvoList;
	}
	
	// 알림 삭제
	@PostMapping("parcel-list/delete")
	@ResponseBody
	public List<ParcelVo> deleteParcel(String memberNo, String pno) throws Exception{
		
		List<ParcelVo> pvoList = service.deleteParcel(memberNo, pno);
		
		return pvoList;
	}
	
}
