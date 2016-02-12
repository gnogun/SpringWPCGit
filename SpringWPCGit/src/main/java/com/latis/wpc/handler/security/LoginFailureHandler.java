package com.latis.wpc.handler.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException auth)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		request.setAttribute("loginError", auth.getMessage());
		
		System.out.println(auth.getMessage());
		
		//response.sendRedirect(request.getContextPath() + "/login");
		
		request.getRequestDispatcher("/login.do").forward(request, response);
	}
	
	

}
