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
		return "hrdmemoplugin";
		
	}
	
}
