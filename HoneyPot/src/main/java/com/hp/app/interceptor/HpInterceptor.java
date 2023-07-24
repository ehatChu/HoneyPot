package com.hp.app.interceptor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class HpInterceptor implements HandlerInterceptor {

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		request.setAttribute("reqId", UUID.randomUUID());
//		log.info("[{}] 요청 받은 uri : {}", request.getAttribute("reqId") ,request.getRequestURI());
//		return true;
//	}
//
//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		log.info("[{}] 모델 앤 뷰 : {}", request.getAttribute("reqId"),modelAndView);
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		log.info("[{}] 화면생성완료, 예외 : {}", request.getAttribute("reqId") ,ex);
//	}

	
	
	
}
