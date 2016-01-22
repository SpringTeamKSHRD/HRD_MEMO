package com.memo.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.memo.app.services.IDashboardService;
import com.memo.app.services.ReportService;
import com.memo.app.services.UserService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private UserService userDao;
	
	@Autowired
	private IDashboardService dashboard;
	
	@Autowired
	private ReportService reportDao;
	
	@ModelAttribute
	public void commonObject(Model m){
		m.addAttribute("notification", reportDao.getReportNotification());		
	}
	
	@RequestMapping("")
	public String dashboard(ModelMap m) {
		m.addAttribute("dashboard",dashboard.getDashboardInfo());
		this.pageDescription(m, "Dashboard", "Control Panel");
		return "admin/dashboard";
	}
	
	@RequestMapping("/users")
	public String users(ModelMap m,
			@RequestParam(value = "limit", required = false, defaultValue = "15") Integer limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "ismemoenabled", required = false,  defaultValue = "true") Boolean ismemoenabled
			) {
		
		this.pageDescription(m, "Users", "List All Users");
		m.addAttribute("listUser", userDao.getUserList(limit, page, ismemoenabled));
		return "admin/users";
	}
	
	@RequestMapping("/memos")
	public String memo(ModelMap m) {
		this.pageDescription(m, "Memos", "List All Memos");
		return "admin/memos";
	}
	
	@RequestMapping("/reports")
	public String report(ModelMap m) {
		this.pageDescription(m, "Report", "List All Reports");
		m.addAttribute("listReport", reportDao.getAllReport());
		return "admin/report";
	}
	
	@RequestMapping("/report/{id}")
	public String reportDetail(ModelMap m, @PathVariable("id") Integer id) {
		this.pageDescription(m, "Report", "Report Detail");
		m.addAttribute("listReport", reportDao.getReportDetail(id));
		return "admin/report_detail";
	}
	
/*	@RequestMapping("/adminnotification")
	public String getNotifationPage(){
		return "admin/adminnotification";
	}*/

	public void pageDescription(ModelMap m,String pageTitle,String pageDesc){
		m.addAttribute("pageTitle",pageTitle);
		m.addAttribute("pageDesc",pageDesc);
	}
}
