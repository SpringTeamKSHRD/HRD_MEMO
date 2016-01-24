package com.memo.app.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.memo.app.entities.Report;
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
	
	@RequestMapping(value = "/getnotification", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getMemo() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Report> reports=new ArrayList<Report>();
		reports=reportDao.getReportNotification();
		if (!reports.isEmpty()) {	
			map.put("MESSAGE", "REPORT HAS BEEN FOUND.");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("DATA",reports);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "REPORT NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	public void pageDescription(ModelMap m,String pageTitle,String pageDesc){
		m.addAttribute("pageTitle",pageTitle);
		m.addAttribute("pageDesc",pageDesc);
	}
}
