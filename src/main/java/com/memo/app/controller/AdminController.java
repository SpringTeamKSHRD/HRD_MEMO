package com.memo.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@RequestMapping("")
	public String adminIndexPage() {
		return "admin/index";
	}
}
