package com.net.board.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	
	
	// onAuthenticationFailure 오버라이딩하여 예외처리를 하고 에러메시지를 띄어주기
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
			
		String errorMessage;
		
		if (exception instanceof BadCredentialsException) {
			errorMessage = "아이디 또는 비밀번호가 맞지 않습니다.";
		} else if (exception instanceof InternalAuthenticationServiceException) {
			errorMessage = "관리자에게 문의하세요.";
		} else if (exception instanceof UsernameNotFoundException) {
			errorMessage = "계정이 존재하지 않습니다.";
		} else if (exception instanceof SessionAuthenticationException) {
			errorMessage = "중복 로그인";
		} else {
			errorMessage = "알 수 없는 오류.. 관리자에게 문의하세요.";
		}
		
		// 한글처리
		errorMessage = URLEncoder.encode(errorMessage, "UTF-8");
		
		setDefaultFailureUrl("/login?error=true&exception="+errorMessage);
		 
		super.onAuthenticationFailure(request, response, exception);
	}

}

