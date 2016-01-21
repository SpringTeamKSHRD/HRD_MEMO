package com.memo.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.memo.app.entities.User;
import com.memo.app.services.IDashboardService;
import com.memo.app.services.impl.UserServiceImpl;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private UserServiceImpl userDao;
	
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
	
	@RequestMapping("/users")
	public String users(ModelMap m,
			@RequestParam(value = "limit", required = false, defaultValue = "15") Integer limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "ismemoenabled", required = false,  defaultValue = "true") Boolean ismemoenabled
			) {
		
		System.out.println(limit);
		System.out.println(page);
		System.out.println(ismemoenabled);
		this.putTogether(m, "listUser", "List All Users");
		List<User> lstUser = userDao.getUserList(limit, page, ismemoenabled);
		m.addAttribute("listUser", lstUser);
		System.out.println(lstUser.size());
		return "admin/users";
	}
	
	@RequestMapping("/memos")
	public String memo(ModelMap m) {
		this.putTogether(m, "Memos", "List All Memos");
		return "admin/memos";
	}
	
	@RequestMapping("/adminnotification")
	public String getNotifationPage(){
		return "admin/adminnotification";
	}

	public void putTogether(ModelMap m,String pageTitle,String pageDesc){
		m.addAttribute("pageTitle",pageTitle);
		m.addAttribute("pageDesc",pageDesc);
		//m.addAttribute("active",pageTitle);
	}
}
