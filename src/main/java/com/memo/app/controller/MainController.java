package com.memo.app.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.memo.app.entities.User;
import com.memo.app.services.impl.EmbededMemoServiceImpl;
import com.memo.app.services.impl.UserServiceImpl;

@RequestMapping(value="/")
@Controller
public class MainController {
	@Autowired
	private EmbededMemoServiceImpl embedDao;
	@Autowired
	private UserServiceImpl userDao;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home() {
		/*return "home";*/
		return "guideline";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String homePage1() {
		return "login";
	}		

	@RequestMapping(value = "test_plugin1", method = RequestMethod.GET)
	public String testMemo() {
		return "test_plugin1";
	}
	
	@RequestMapping(value = "test_plugin2", method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "test_plugin2";
	}
	
	@RequestMapping(value = "hrdmemoplugin", method = RequestMethod.GET)
	public String getPluginPage() {
		return "hrdmemoplugin";
		
	}
	@RequestMapping(value = "plugin2login", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> userPluginLogin(@RequestParam("email") String email,@RequestParam("password") String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user=embedDao.memoLogin(email, password);
		System.out.println(user);
		if (user!=null) {	
			map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
			map.put("STATUS","true");
			map.put("DATA",user);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	@RequestMapping(value = "plugin2/logout", method = RequestMethod.GET)
	public void getLogoutPage(HttpServletRequest request,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null)
			new SecurityContextLogoutHandler().logout(request, response, auth);
	}
	
	public String getRole(){
		return SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().toString();
	}
	@RequestMapping(value="signup",method=RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String,Object>> userSignup(@RequestBody User user,HttpServletResponse respone){
	  Map<String,Object> map=new HashMap<String,Object>();
	  if(userDao.saveUser(user)==true){
		  map.put("MESSAGE","USER HAS BEEN SIGN UP");
		  map.put("STATUS",HttpStatus.ACCEPTED.value());
		  map.put("DATA",userDao.getUserByEmail(user.getEmail()));
		  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	  }else{
		  map.put("MESSAGE","USER SIGN UP FAILED");
		  map.put("STATUS",HttpStatus.NOT_ACCEPTABLE.value());
		  return new ResponseEntity<Map<String,Object>>(map,HttpStatus.NOT_ACCEPTABLE);
	  }
	}
}
