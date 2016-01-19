package com.memo.app.restcontroller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Memo;
import com.memo.app.entities.Report;
import com.memo.app.entities.User;
import com.memo.app.services.impl.MemoServiceImpl;
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
	private MemoServiceImpl memoDao;
	
	@RequestMapping(value="/signup",method=RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String,Object>> userSignup(@RequestBody User user){
		System.out.println(user);
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
	@RequestMapping(value = "/savememo", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> addMemo(@RequestBody Memo memo) {
		System.out.println("add memo controller.");		
		Map<String, Object> map = new HashMap<String, Object>();
		if (memoDao.insertMemo(memo)) {			
			map.put("MESSAGE", "MEMO HAS BEEN CREATED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN CREATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_ACCEPTABLE);
		}
	}
	
	@RequestMapping(value="/report", method = RequestMethod.POST)
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
	
	@RequestMapping(value="/memo", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getMemo(
			@RequestParam("domain") String domain,
			@RequestParam("url") String url, 
			HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {		
			User currentUser = (User)request.getSession(true).getAttribute("USER");
			map.put("MESSAGE", memoDao.getMemoByUrl(domain, url.replace(" ", "%20"), currentUser.getUserid()));
			status = HttpStatus.OK;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("isLogin", "false");
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value="/memo", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addMemo(
			@RequestBody Memo memo, 
			HttpServletRequest request) {
				
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		User currentUser = (User)request.getSession().getAttribute("USER");
		memo.setDate(new Date());
		memo.setUserid(currentUser.getUserid());
		if (memoDao.insertMemo(memo)) {			
			map.put("MESSAGE", "MEMO HAS BEEN CREATED.");
			status = HttpStatus.CREATED;			
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN CREATED.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value = "/memo", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateMemo(
			@RequestBody Memo memo,
			HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		User currentUser = (User)request.getSession().getAttribute("USER");
		memo.setDate(new Date());
		memo.setUserid(currentUser.getUserid());
		System.out.println(memo);
		if (memoDao.updateMemo(memo)) {
			map.put("MESSAGE", "MEMO HAS BEEN UPDATED.");
			status = HttpStatus.OK;			
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN UPDATED.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value = "/user/status", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> userStatus(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.OK;
		map.put("isLogin", isAuthenticated());
		map.put("username", getUsername());
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value = "/autologin/admin", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Map<String, Object>> autologin(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			request.login("admin@gmail.com", "1");
			map.put("MESSAGE", "AUTO LOG IN SUCCESS WITH DEFAULT ADMIN ACCOUNT 'admin'");
			map.put("STATUS", "200");
			map.put("IS_LOGIN", isAuthenticated());
			status = HttpStatus.OK;
		} catch (ServletException e) {
			map.put("MESSAGE", e.getMessage());
			map.put("IS_LOGIN", isAuthenticated());
			status = HttpStatus.BAD_REQUEST;
			e.printStackTrace();
			return new ResponseEntity<Map<String, Object>>(map, status);
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	public boolean isAuthenticated() {
		return !(SecurityContextHolder.getContext().getAuthentication() instanceof AnonymousAuthenticationToken);		
	}
	private String getUsername() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}	
}
