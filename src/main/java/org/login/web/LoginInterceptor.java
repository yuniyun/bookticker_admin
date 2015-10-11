package org.login.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		String sessionInfo = (String) request.getSession().getAttribute(
				"loginInfo");
				
		try {
			if (sessionInfo == null || sessionInfo.equals("")) {
				response.sendRedirect("/login");
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;

	}
}
