package com.memo.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/")
@Controller
public class MainController {

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home() {
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
	@RequestMapping(value = "test_plugin", method = RequestMethod.GET)
	public String testMemo1() {
		return "memo_plugin";
	}
	
	@RequestMapping(value = "test_plugin2", method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "test_plugin2";
	}
	
	@RequestMapping(value = "hrdmemoplugin", method = RequestMethod.GET)
	public String getPluginPage() {
<<<<<<< HEAD
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
		System.out.println("olo");
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null)
			new SecurityContextLogoutHandler().logout(request, response, auth);
=======
		return "hrdmemoplugin";		
>>>>>>> origin/master
	}
	
}
