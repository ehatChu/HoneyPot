package com.hp.app.yerin.functions;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
	//8월 2일부터 4일까지면
	//0803,0804가 list에 담김.
	public List<String> getMiddleDays(String s1,String s2) throws Exception {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		Date d1 = df.parse(s1);
		Date d2 = df.parse(s2);
		
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		
		c1.setTime(d1);
		c2.setTime(d2);
		
		List<String> middleDays = new ArrayList<String>();
		
		while(c1.compareTo(c2)!=1) {
			//형식에 맞춰 저장
			Date originDate = c1.getTime();
			String formattingDate = df.format(originDate);
					
			//List에 저장
			middleDays.add(formattingDate);
			
			//c1을 하루추가
			c1.add(Calendar.DATE, 1);
		}
		
		return middleDays;
	}
	
}
