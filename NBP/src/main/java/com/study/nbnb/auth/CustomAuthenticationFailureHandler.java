package com.study.nbnb.auth;

import java.io.IOException;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
										HttpServletResponse response,
										AuthenticationException exception)
	throws IOException, ServletException
	{
		
		String loginid = request.getParameter("id");
		
		String errormsg = "";
		
		if(exception instanceof BadCredentialsException) {
			loginFailurlCount(loginid);
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.(1)";
		} else if(exception instanceof InternalAuthenticationServiceException) {
			loginFailurlCount(loginid);
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.(2)";
		} else if(exception instanceof DisabledException) {
			errormsg = "계정이 비활성화되었습니다. 관리자에게 문의하세요.";
		} else if(exception instanceof CredentialsExpiredException) {
			errormsg = "비밀번호 유효기간이 만료 되었습니다. 관리자에게 문의하세요.";
		} 
		
		request.setAttribute("username", loginid);
		request.setAttribute("error_message", errormsg);
		
		request.getRequestDispatcher("/loginView?error=true").forward(request, response);
		
	}
	// 비밀번호를 3번 이상 틀릴 시 계정 잠금 처리
	protected void loginFailurlCount(String username) {
//		틀린 횟수 업데이트
//		
//		틀린 횟수 조회
//		
//		계정 잠금 처리
	}
	
}
