package com.memo.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Report;
import com.memo.app.entities.User;
import com.memo.app.services.impl.MemoServiceImp;
import com.memo.app.services.impl.ReportServiceImpl;
import com.memo.app.services.impl.UserServiceImpl;

@RestController
@RequestMapping(value="/plugin")
public class PluginController {
	@Autowired
	private UserServiceImpl userDao;
	@Autowired
	private ReportServiceImpl reportDao;
	@Autowired
	private MemoServiceImp memoDao;
	
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> userSignup(User user){
		
	  Map<String,Object> map=new HashMap<String,Object>();
	  if(userDao.saveUser(user)==true){
		  map.put("MESSAGE","USER HAS BEEN SIGN UP");
		  map.put("STATUS",HttpStatus.ACCEPTED.value());
		  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	  }else{
		  map.put("MESSAGE","USER SIGN UP FIALED");
		  map.put("STATUS",HttpStatus.NOT_ACCEPTABLE.value());
		  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	  }
	}
	
	@RequestMapping(value="/report")
	public ResponseEntity<Map<String,Object>> userReport(Report rp){
		Map<String,Object> map=new HashMap<String,Object>();
		if(reportDao.saveReport(rp)==true){
			map.put("MESSAGE","REPORT HAS BEEN SENT");
			map.put("STATUS",HttpStatus.ACCEPTED.value());
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}else{
			map.put("MESSAGE","REPORT HAS BEEN SENT FIALED");
			map.put("STATUS",HttpStatus.NOT_ACCEPTABLE.value());
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="/check")
	public ResponseEntity<Map<String,Object>> checkUrl(HttpServletRequest request,
		@RequestParam("domain") String domain, @RequestParam("url") String url){		
		Map<String,Object> map=new HashMap<String,Object>();
		HttpStatus status = null;		
		try {
			User currentUser = (User)request.getSession().getAttribute("USER");
			map.put("MESSAGE", memoDao.listMemoByUrl(domain,url, currentUser.getUserid()));
			status = HttpStatus.OK;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("isLogin", "false");			
			status = HttpStatus.INTERNAL_SERVER_ERROR;			
		}
		return new ResponseEntity<Map<String,Object>>(map, status);
	}	
	
	@RequestMapping(value = "/status", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> status(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.OK;
		map.put("isLogin", isAuthenticated());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	public boolean isAuthenticated() {
		return !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken);
	}
}
