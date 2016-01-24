package com.memo.app.controller;

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
import com.memo.app.services.MemoService;
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
	
	@Autowired
	private MemoService memoDao;
	
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
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "ismemoenabled", required = false,  defaultValue = "true") boolean ismemoenabled) {
		
		this.pageDescription(m, "Users", "List All Users");
		m.addAttribute("listUser", userDao.getUserList(limit, page, ismemoenabled));
		return "admin/users";
	}
	
	@RequestMapping("/memos")
	public String memo(ModelMap m,
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "isenabled", required = false,  defaultValue = "true") boolean isenabled){
		
		this.pageDescription(m, "Memos", "List All Memos");
		m.addAttribute("listMemo", memoDao.listMemo(limit, page, isenabled));
		return "admin/memos";
	}
	
	@RequestMapping("/reports")
	public String report(ModelMap m,
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "isblocked", required = false,  defaultValue = "false") boolean isblocked){
		
		this.pageDescription(m, "Report", "List All Reports");
		m.addAttribute("listReport", reportDao.getAllReport(limit, page, isblocked));
		return "admin/report";
	}
	
	@RequestMapping("/report/{id}")
	public ResponseEntity<Map<String, Object>> reportDetail(ModelMap m, 
			@PathVariable("id") Integer id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Report rp = reportDao.getReportDetail(id);
		HttpStatus status = HttpStatus.OK;
		if (rp instanceof Report) {	
			map.put("MESSAGE", "REPORT HAS BEEN FOUND.");
			map.put("DATA", rp);
		} else {
			map.put("MESSAGE", "REPORT NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value = "/notification", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getReportNotification() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Report> reports=reportDao.getReportNotification();
		HttpStatus status = HttpStatus.OK;
		if (!reports.isEmpty()) {	
			map.put("MESSAGE", "REPORT HAS BEEN FOUND.");
			map.put("DATA",reports);
		} else {
			map.put("MESSAGE", "REPORT NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	public void pageDescription(ModelMap m,String pageTitle,String pageDesc){
		m.addAttribute("pageTitle",pageTitle);
		m.addAttribute("pageDesc",pageDesc);
	}
}
