package com.gd.sakila;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter(urlPatterns = "/admin/*")//admin으로 시작하는것 모두 가로챔
public class LoginFilter implements Filter {

	//httpServletRequest가 아닌 ServletRequest임.. 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//요청전
		log.debug("▶▶▶▶▶loginFilter 요청전");
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
			session = ((HttpServletRequest)request).getSession();
		}
		/*로그인 필터
		if(session.getAttribute("loginStaff") == null) {
			if(response instanceof HttpServletResponse) {
				((HttpServletResponse)response).sendRedirect("/");
			}
			return;
		}
		*/
		chain.doFilter(request, response);
		//요청후
		log.debug("▶▶▶▶▶loginFilter 요청전");
	}

}
