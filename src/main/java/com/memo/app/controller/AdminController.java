package com.memo.app.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.memo.app.service.IDashboardService;
import com.memo.app.service.IUserService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private IUserService userservice;
	
	@Autowired
	private IDashboardService dashboard;
	
	@ModelAttribute
	public void commonObject(Model model){
		model.addAttribute("dashboard",dashboard.getDashboardInfo());
	}
	
	@RequestMapping("")
	public String dashboard(ModelMap m) {
		this.putTogether(m, "Dashboard", "Control Panel");
		return "admin/dashboard";
	}

	@RequestMapping("/test")
	public String testMemo(ModelMap m) {
		return "admin/test_memo";
	}
	
	@RequestMapping("/users")
	public String users(ModelMap m) {
		this.putTogether(m, "Users", "List All Users");
		return "admin/users";
	}
	@RequestMapping("/memos")
	public String memo(ModelMap m) {
		this.putTogether(m, "Memos", "List All Memos");
		return "admin/memos";
	}
	public void putTogether(ModelMap m,String pageTitle,String pageDesc){
		m.addAttribute("pageTitle",pageTitle);
		m.addAttribute("pageDesc",pageDesc);
//		m.addAttribute("active",pageTitle);
	}
	
	@RequestMapping(value="adminnotification")
	public String getNotifationPage(){
		return "admin/adminnotification";
	}

}
