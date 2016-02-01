package com.memo.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.memo.app.services.IDashboardService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private IDashboardService dashboard;
	
	@ModelAttribute
	public void commonObject(Model m){
				
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String dashboard(ModelMap m) {
		m.addAttribute("dashboard",dashboard.getDashboardInfo());
		this.pageDescription(m, "Dashboard", "Control Panel");
		return "admin/dashboard";
	}
	
	@RequestMapping(value="/users", method = RequestMethod.GET)
	public String users(ModelMap m) {		
		this.pageDescription(m, "Users", "List All Users");
		return "admin/users";
	}
	
	@RequestMapping(value="/memos", method = RequestMethod.GET)
	public String memo(ModelMap m){		
		this.pageDescription(m, "Memos", "List All Memos");
		return "admin/memos";
	}
	
	@RequestMapping(value="/reports", method = RequestMethod.GET)
	public String report(ModelMap m){		
		this.pageDescription(m, "Report", "List All Reports");
		return "admin/reports";
	}
	
	//for testing only
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String test(ModelMap m){		
		return "admin/testapi";
	}
	
	public void pageDescription(ModelMap m,String pageTitle,String pageDesc){
		m.addAttribute("pageTitle",pageTitle);
		m.addAttribute("pageDesc",pageDesc);
	}
}
