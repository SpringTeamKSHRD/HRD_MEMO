package com.memo.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@RequestMapping("")
	public String dashboard(ModelMap m) {
		this.putTogether(m, "Dashboard", "Control Panel");
		return "admin/dashboard";
	}

	
	@RequestMapping("/users")
	public String users(ModelMap m) {
		this.putTogether(m, "Users", "List All Users");
		return "admin/users";
	}
	
	public void putTogether(ModelMap m,String pageTitle,String pageDesc){
		m.addAttribute("pageTitle",pageTitle);
		m.addAttribute("pageDesc",pageDesc);
		m.addAttribute("active",pageTitle);
	}
}
