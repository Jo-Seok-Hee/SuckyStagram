package com.sucky.project.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor{
	//요청이 들어올 때
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		//로그인 정보
		HttpSession session = request.getSession();	
		
		//현재 요청한 url의 경로 (uri???)  ex)"/user/memo";
		String uri = request.getRequestURI();
		
		
		if(session.getAttribute("userId") != null) {  //로그인 상태
			
			//로그인 화면과, 회원가입화면 접근 ??
			if(uri.startsWith("/user/")) {
				response.sendRedirect("/post/timeline");
				return false;
			}
			
		} else {  //비 로그인 상태
			// 리스트 페이지 요청시
			// 로그인 페이지로 보내버림
			if(uri.startsWith("/post/")) {
				response.sendRedirect("/user/mainView");
				return false;
			}
		}
		
		return true;
		
	}
	
	//response 철할 때
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response
			,Object handler, ModelAndView modelAndView) {
		
	}
	
	//모든것이 완료 되었을 때르
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response
			,Object handler, Exception ex) {
		
	}
}
