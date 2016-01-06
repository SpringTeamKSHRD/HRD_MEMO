package com.memo.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@RequestMapping("")
	public String dashboard() {
	
		return "admin/index";
	}
	
	
	@RequestMapping("/user")
	
	public String user() {
		return "admin/index";
	}
	
}
