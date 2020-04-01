package com.branddog.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.branddog.member.dto.MemberDTO;


public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private final String[] needLoginList = {
			"/culture/search.do",
			"/food/list.do",
			"/news/search.do",
			"/travel/search.do"
		};
		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			// TODO Auto-generated method stub
			HttpSession session = request.getSession();
			MemberDTO login = (MemberDTO) session.getAttribute("login");
			
			// 요청한 uri가 view.do?no=1 => view.do:uri, no=1:query
			String uri = request.getServletPath();
			String query = request.getQueryString();
			
			if(login == null) {
				// 로그인이 필요한 uri인지 검사하는 메서드 처리
				if(checkLoginList(uri)) {
					// 로그인 처리가 끝나면 session에 uri를 꺼내서 요청한 페이지로 이동 시킨다.
					session.setAttribute("uri", uri+"?"+query);
					response.sendRedirect("/member/login.do");
					// 요구한 uri를 처리하지 않는다.
					return false;
				}
			}
			return super.preHandle(request, response, handler);
		}
		
		private boolean checkLoginList(String uri) {
			for(String s : needLoginList) {
				// 로그인이 필요하다.
				if(s.equals(uri)) return true;
			}
			// 로그인이 필요하지 않다.
			return false;
		}
}
