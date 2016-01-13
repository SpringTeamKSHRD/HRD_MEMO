package com.memo.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.memo.app.servicesimpl.UserDetailServiceImpl;

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
	UserDetailServiceImpl userDetailsService;
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

	@RequestMapping(value = "/plugin", method = RequestMethod.GET)
	public String homePluginPage(@RequestParam("type") String type) {
		System.out.println(type);
		if(type.equals("add1"))
			return "plugin/add1";
		if(type.equals("add2"))
			return "plugin/add2";
		else if(type.equals("list"))
			return "plugin/list";
		else if(type.equals("login"))
			return "plugin/login";
		else if(type.equals("signup"))
			return "plugin/signup";
		else if(type.equals("test1"))
			return "plugin/test1";
		else if(type.equals("test2"))
			return "plugin/test2";
		return "";
	}
	@RequestMapping(value = "/hrdmemoplugin", method = RequestMethod.GET)
	public String getPluginPage() {
		return "hrdmemoplugin";
	}
}
