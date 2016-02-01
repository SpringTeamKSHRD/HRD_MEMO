package com.memo.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.memo.app.services.impl.UserSecurityServiceImpl;

@Controller /*
			 * Indicates that an annotated class is a "Controller" of Spring
			 * Framework (a web controller)
			 */

/*
 * is used to map the user’s requests to handler classes or methods. It can be
 * applied on the class level and also on the method level.
 */
public class Main {

	@Autowired
	UserSecurityServiceImpl userDetailsService;
	/*
	 * @Autowired, @Inject, and @Resource tell the application context to inject
	 * the beans.
	 * 
	 * @Autowired and @Inject works very similar but @Resource has bit
	 * different.
	 */

	@RequestMapping(value = "/")
	public String homePahe(ModelMap model) {
		model.addAttribute("auth", SecurityContextHolder.getContext().getAuthentication());
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String homePahe1() {
		return "login";
	}
		
	@RequestMapping(value = "/hrdmemoplugin", method = RequestMethod.GET)
	public String getPluginPage() {
			return "hrdmemoplugin";
		
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String testMemo() {
		return "admin/other/test_memo";
	}
}
