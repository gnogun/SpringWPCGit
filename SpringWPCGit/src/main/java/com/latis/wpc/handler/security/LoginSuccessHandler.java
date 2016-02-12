package com.latis.wpc.handler.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println(auth.getAuthorities().getClass().getName());
		
		String pathAddress = "";
//		Collection<? extends GrantedAuthority> col =  auth.getAuthorities();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) auth.getAuthorities();
//		System.out.println(authorities.get(0).getAuthority());
		String strAuth = authorities.get(0).getAuthority();
		
		if(strAuth.equals("ROLE_a")){
			pathAddress = "admin";
		}else if(strAuth.equals("ROLE_s")){
			pathAddress = "manage";
		}else{
			pathAddress = "user";
		}
		
		response.sendRedirect(request.getContextPath() + "/" + pathAddress + "/userManage.do");
//		response.sendRedirect(request.getContextPath() +  "/index.do");
	}

}
