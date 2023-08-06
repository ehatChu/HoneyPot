package com.hp.app.calendar.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hp.app.calendar.vo.AllCalendarVo;
import com.hp.app.calendar.vo.NoticeCalendarVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CalendarDaoImpl implements CalendarDao {
	//멤버일정등록
	@Override
	public int regiMemberSchedule(SqlSessionTemplate sst, Map<String, String> regiInfoMap) {
		int result = 0;
		try {
			result = sst.insert("calendar.regiMemberSchedule",regiInfoMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	//관리자일정등록
	@Override
	public int regiAdminSchedule(SqlSessionTemplate sst, Map<String, String> regiInfoMap) {
		int result = 0;
		try {
			result = sst.insert("calendar.regiAdminSchedule",regiInfoMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		log.info("result : {} ",result);
		return result;
	}
	
	//아파트공지조회 ajax
	@Override
	public List<NoticeCalendarVo> getNoticeCal(SqlSessionTemplate sst, Map<String, String> infoMap) {
		List<NoticeCalendarVo> noticeList = null;
		
		try {
			noticeList = sst.selectList("calendar.getNoticeCal",infoMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticeList;
	}

	//아파트일정, 모든일정, 해당동의
	@Override
	public List<AllCalendarVo> getAllNoticeCalByDong(SqlSessionTemplate sst, String dongName) {
		List<AllCalendarVo> noticeList = null;
				
		try {
			noticeList = sst.selectList("calendar.getAllNoticeCalByDong",dongName);
			
			//풀캘린더 하루더 추가하기위한 코드
			for(int i =0; i<noticeList.size();i++){
				//문자를 날짜로 변경 
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date d1 = df.parse(noticeList.get(i).getEndDate());
				
				
				Calendar c1 = Calendar.getInstance();
				c1.setTime(d1);
				
				c1.add(Calendar.DATE, 1);
				
				//날짜를 문자로 변경
				Date d2 = c1.getTime();
				String finalDate = df.format(d2);
				
				//변경한 문자로 list의 값 바꾸기
				noticeList.get(i).setEndDate(finalDate);
				
			}		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return noticeList;

	}
	//개인일정, 모든일정
	@Override
	public List<AllCalendarVo> getAllMemberCalByPerson(SqlSessionTemplate sst, String memberNo) {
		List<AllCalendarVo> memberList = null;
		
		try {
			memberList = sst.selectList("calendar.getAllMemberCalByPerson",memberNo);
			//풀캘린더 하루더 추가하기위한 코드
			for(int i =0; i<memberList.size();i++){
				//문자를 날짜로 변경 
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date d1 = df.parse(memberList.get(i).getEndDate());
				
				
				Calendar c1 = Calendar.getInstance();
				c1.setTime(d1);
				
				c1.add(Calendar.DATE, 1);
				
				//날짜를 문자로 변경
				Date d2 = c1.getTime();
				String finalDate = df.format(d2);
				
				//변경한 문자로 list의 값 바꾸기
				memberList.get(i).setEndDate(finalDate);
				
			}		
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	
	//멤버일정조회
	
	//관리자 일정조회

}
