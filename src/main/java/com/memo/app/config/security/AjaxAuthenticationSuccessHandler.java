package com.memo.app.config.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.memo.app.repo.impl.UserDaoRepoImpl;

@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	private UserDaoRepoImpl userDao;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
	    request.getSession().setAttribute("USER",userDao.getUserDialInfo((SecurityContextHolder.getContext().getAuthentication().getName())));
	    
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
		String url = "";
		ArrayList<String> roles=new ArrayList<String>();
		for (GrantedAuthority authority : authorities) {
			roles.add(authority.getAuthority());
		}
		if (roles.contains("ROLE_Admin"))
			url = "admin";
		else if (roles.contains("ROLE_Subscriber"))
			url = "user/user";
		else	url = "accessDenied";
		response.getWriter().print(url);
		response.getWriter().flush();
	}
}
