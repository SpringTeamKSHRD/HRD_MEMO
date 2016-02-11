package com.memo.app.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.User;
import com.memo.app.services.impl.UserServiceImpl;

@RestController
public class UserDetailController {
	@Autowired
	private UserServiceImpl userDao;
    
	@RequestMapping(value="getuserdetail",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> getUserDeatil(@RequestParam("email") String email){
		System.out.println(email);
		Map<String,Object> map=new HashMap<String, Object>();
		User user=userDao.getUserByEmail(email);
		System.out.println(user.toString());
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
}
