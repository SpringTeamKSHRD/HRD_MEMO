package com.memo.app.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/user")
public class UserController {
    
	@RequestMapping(value={"/user",""}, method = RequestMethod.GET)
	public String getUserDashBaord(){
		return "user/p_dashboard";
	}
	
	@RequestMapping(value="/usernotification", method = RequestMethod.GET)
	public String getNotifationPage(){
		return "user/usernotification";
	}
	
	@RequestMapping(value="/userpassword", method = RequestMethod.GET)
	public String getUserPassword(){
		return "user/user_password";
	}
	
	@RequestMapping(value="/home", method = RequestMethod.GET)
	public String getHomeMemoPage(){
		return "user/profile";
	}
	
	@RequestMapping(value="/message", method = RequestMethod.GET)
	public String getMessagePage(){
		return "user/message";
	}
	
	@RequestMapping(value="/newmessage", method = RequestMethod.GET)
	public String getMewMessagePage(){
		return "user/newmessage";
	}
}
