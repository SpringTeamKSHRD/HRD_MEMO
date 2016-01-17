package com.memo.app.restcontroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.services.impl.MemoServiceImpl;

@RestController
@RequestMapping(value="/test")
public class PluginController2 {

	@Autowired
	private MemoServiceImpl memoDao;

	@RequestMapping(value="/memo", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> addMemo(HttpServletRequest request) {	
		Map<String,Object> map=new HashMap<String,Object>();
		HttpStatus status = HttpStatus.OK;
		System.out.println(memoDao.getMemoByUrl("null", "/C:/Documents%20and%20Settings/zz/Desktop/articleMgm/article1.html", 1));
		return new ResponseEntity<Map<String,Object>>(map, status);
	}
	
/*	@RequestMapping(value="/memo", method = RequestMethod.GET, headers = "Accept=application/json")
public ResponseEntity<Map<String,Object>> getMemo(
		@RequestParam("domain") String domain, 
		@RequestParam("url") String url,
		HttpServletRequest request){
	
	Map<String,Object> map=new HashMap<String,Object>();
	HttpStatus status = null;
	//User currentUser = (User)request.getAttribute("USER");
	try {
		//map.put("MESSAGE", memoDao.getMemoByUrl(domain,url, currentUser.getUserid()));		
		System.out.println(getUsername());
		map.put("MESSAGE", memoDao.getMemoByUrl(domain,url,userSecurityDao.findUserByUserName(getUsername()).getId()));
		status = HttpStatus.OK;
	} catch (Exception e) {
		e.printStackTrace();
		map.put("isLogin", "false");			
		status = HttpStatus.INTERNAL_SERVER_ERROR;			
	}
	return new ResponseEntity<Map<String,Object>>(map, status);
}	*/
	
	
	private String getUsername() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}
}
