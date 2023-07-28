package com.hp.app.yerin.functions;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class YerinFunctions {
	//여는시간 혹은 닫는시간 받아서 숫자 return하기
	public int changeInt(String time){
		//문자 '07'을 숫자 7로 변경
		int num = Integer.parseInt(time);
		
		
		
		return num;
	}

	public String getCombinedDate(String date, String startTime) {
		//Date타입의 날짜와 시간이 합쳐진 값을 반환해야함
		//date와 startTime을 아래와 같은 형식에 맞게 문자열을 조합해야함
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String resultStartTime = Integer.parseInt(startTime) < 10 ? '0'+startTime : startTime;
		String combinedDate = date +" "+ resultStartTime;
		
		log.info("7시가 07로 저장되는지 확인하기 {}",combinedDate);
	
		return combinedDate;
	}
	
	//현재 날짜를 넘기면 '2023-05-21'같은 형식으로 format해주는 함수
	public String getStringDate(Date date) {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = simpleDateFormat.format(date);
		
		return stringDate;
	}

	
}
