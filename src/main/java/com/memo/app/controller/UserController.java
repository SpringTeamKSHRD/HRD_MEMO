package com.memo.app.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/user")
public class UserController {
    
	@RequestMapping(value="/user")
	public String getUserDashBaord(){
		return "user/dashboard";
	}
	
	@RequestMapping(value="/addmemo")
	public String getUserAddMemo(){
		return "user/addmemo";
	}
	
	@RequestMapping(value="/listmemo")
	public String getUserListMemo(){
		return "user/listmemo";
	}
	@RequestMapping(value="/usernotification")
	public String getNotifationPage(){
		return "user/usernotification";
	}
	@RequestMapping(value="/userprofile")
	public String getUserProfile(){
		return "user/profile";
	}
	
}
