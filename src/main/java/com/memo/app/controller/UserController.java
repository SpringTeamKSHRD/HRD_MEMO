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
	@RequestMapping(value="/userreport")
	public String getUserReport(){
		return "user/user_report";
	}
	@RequestMapping(value="/userpassword")
	public String getUserPassword(){
		return "user/user_password";
	}
	@RequestMapping(value="/getallmessage")
	public String getAllMessagePage(){
		return "user/getallmessage";
	}
	@RequestMapping(value="/listallmemo")
	public String getListMemoPage(){
		return "user/listmemo";
	}
	@RequestMapping(value="/home")
	public String getHomeMemoPage(){
		return "user/home";
	}
	@RequestMapping(value={"/dashbaord"})
	public String getDashBaord(){
		return "user/dashboard";
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
