package com.memo.app.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/user")
public class UserController {
    
	@RequestMapping(value={"/user",""})
	public String getUserDashBaord(){
		return "user/p_dashboard";
	}
	@RequestMapping(value="/usernotification")
	public String getNotifationPage(){
		return "user/usernotification";
	}
	@RequestMapping(value="/userpassword")
	public String getUserPassword(){
		return "user/user_password";
	}
	@RequestMapping(value="/home")
	public String getHomeMemoPage(){
		return "user/profile";
	}
	@RequestMapping(value="/message")
	public String getMessagePage(){
		return "user/message";
	}
	@RequestMapping(value="/newmessage")
	public String getMewMessagePage(){
		return "user/newmessage";
	}
}
