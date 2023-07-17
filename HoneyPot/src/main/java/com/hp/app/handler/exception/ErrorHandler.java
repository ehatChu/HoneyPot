package com.hp.app.handler.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;


@ControllerAdvice
public class ErrorHandler {

	// 404 에러
	@ExceptionHandler(NoHandlerFoundException.class)
	public String error404(NoHandlerFoundException e) {
	return "error/exception404";
	}
	
	// 그 외 예외
	@ExceptionHandler(Exception.class)
	public String handle() {
		return "error/errorPage";
	}
	
	// 필요한 예외 핸들러 추가
	//@ExceptionHandler(LoginFailException.class)
	public String handlerLoginFail () {
		return "error/loginFail";
		
	}
	
}
