package com.latis.wpc.listener.security;

import javax.servlet.http.HttpSessionEvent;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.session.HttpSessionEventPublisher;


public class WpcSessionEventPublisherListener extends HttpSessionEventPublisher {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println(event.getSession().getId());
		super.sessionCreated(event);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		// do something

		System.out.println("ddddd" + event.getSession().getId());
//		CustomUserDetails userDetails2 =  (CustomUserDetails) SecurityContextHolder
//				.getContext().getAuthentication().getDetails();
		super.sessionDestroyed(event);
	}

}