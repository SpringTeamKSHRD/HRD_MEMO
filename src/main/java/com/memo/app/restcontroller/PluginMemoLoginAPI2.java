package com.memo.app.restcontroller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.User;
import com.memo.app.services.impl.EmbededMemoServiceImpl;
import com.memo.app.services.impl.UserServiceImpl;

@RestController
public class PluginMemoLoginAPI2 {
	
	@Autowired
	private UserServiceImpl userDao;
	@Autowired
	private EmbededMemoServiceImpl embedDao;
	    
	@RequestMapping(value="getuserdetail",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getUserDeatil(@RequestParam("email") String email){
		System.out.println(email);
		Map<String,Object> map=new HashMap<String, Object>();
		User user=userDao.getUserByEmail(email);
		if(user!=null){
			map.put("MESSAGE","USER WAS FOUND..!");
			map.put("DATA",user);
			map.put("STATUS",HttpStatus.FOUND.value());
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}else{
			map.put("MESSAGE", "USER NOT FOUND");
			map.put("STATUS",HttpStatus.NOT_EXTENDED.value());
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.NOT_FOUND);
		}
		
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
	public String getRole(){
		return SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().toString();
	}
}

