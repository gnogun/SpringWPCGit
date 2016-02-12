package com.latis.wpc.interceptor.security;

import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/*
 * 여기서는 세션만 체크하지 authority 가지고는 아무짓도 안 합니다
 */

public class CustomInterceptor extends HandlerInterceptorAdapter {

	// HandlerInterceptorAdapter 를 상속 받아야 intercepter 등록이 가능함
	private static final Logger logger = Logger
			.getLogger(CustomInterceptor.class);

	public String getSessionID() {
		SecurityContext ctx = SecurityContextHolder.getContext();

		if (SecurityContextHolder.getContext().getAuthentication() != null) {
			WebAuthenticationDetails detail = (WebAuthenticationDetails) ctx
					.getAuthentication().getDetails();

			return detail.getSessionId();

		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) {

//		boolean result = false;
		String rootPath = request.getContextPath();
		
		try {
			logger.debug("enter intercepter");
			HttpSession session = request.getSession(false);

			if (session == null) {
				// session non exist
				response.sendRedirect(rootPath);
				// response.sendRedirect(rootPath+"/login");
				// index.jsp 로 이동, web.xml 에 설정 되어 있음 (<welcome-file-list> 태그)
				return false;
			} else {
				SecurityContext ctx = (SecurityContext) session
						.getAttribute("SPRING_SECURITY_CONTEXT");
				
				if(ctx == null){
					System.out.println(request.getServletPath());
					if(request.getServletPath().equals("/login.do")){
						return true;
					}else{
						response.sendRedirect(rootPath+"/login.do");
						return false;
					}
				}else{
					
					
					return true;
				}
				
//				String id = getSessionID();
//				System.out.println("id====>" + session.getId());
//				Enumeration<String> enums = session.getAttributeNames();
//				while (enums.hasMoreElements()) {
//					String str = enums.nextElement();
//					SecurityContext ctx = (SecurityContext) session
//							.getAttribute("SPRING_SECURITY_CONTEXT");
//					System.out.println(str);
//				}
				// UserDTO userDTO = (UserDTO) session.getAttribute("userInfo");
				// // UserInfo 로 세션 등록
				// if (userDTO != null && userDTO.getUSER_ID() != null) {
				// // session exist
				// } else {
				// // session non exist
				// response.sendRedirect(rootPath);
				//
				// return false;
				// }

			}

//			result = true;

		} catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
			return false;
		}

//		return result;
	}
}
