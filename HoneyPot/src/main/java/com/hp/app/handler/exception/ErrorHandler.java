package com.hp.app.handler.exception;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice(annotations = Controller.class)
public class ErrorHandler {

	// 404 에러
	@ExceptionHandler(NotFoundException.class)
	public String handleNotFound() {
		return "common/error/exception404";
	}
	
	// 그 외 예외
	@ExceptionHandler(Exception.class)
	public String handle() {
		return "error/errorPage";
	}
	
	// 필요한 예외 핸들러 추가
	//@ExceptionHandler(LoginFailException.class)
//	public String handlerLoginFail () {
//		return "error/loginFail";
//	}
	
}
