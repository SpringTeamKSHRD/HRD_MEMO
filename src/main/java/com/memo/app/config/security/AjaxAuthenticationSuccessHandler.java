package com.memo.app.config.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.memo.app.entities.User;
import com.memo.app.repo.impl.UserDaoImpl;

@Component("ajaxAuthenticationSuccessHandler")
public class AjaxAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	private UserDaoImpl userDao;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		//session.setMaxInactiveInterval(10);
		User user=userDao.getUserDialInfo((SecurityContextHolder.getContext().getAuthentication().getName()));
		session.setAttribute("USER",user);
	    
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
		String url = "";
		ArrayList<String> roles=new ArrayList<String>();
		for (GrantedAuthority authority : authorities) {
			roles.add(authority.getAuthority());
		}
		if (roles.contains("ROLE_Admin"))
			url = "admin#"+user.getUserid();
		else if (roles.contains("ROLE_Subscriber"))
			url = "user/user#"+user.getUserid();
		else	url = "accessDenied";
		response.getWriter().print(url);
		response.getWriter().flush();
	}
}
