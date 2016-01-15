package com.memo.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Memo;
import com.memo.app.services.IEmbededMemoService;

@RestController
@RequestMapping("/plugin/memo")
public class EmbededMemoController {
	@Autowired
	private IEmbededMemoService embededMemoService;
	
	@RequestMapping(value ="/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listArticle(@PathVariable int id) {
		System.out.println("list memo");
		List<Memo> list = embededMemoService.listMemoByUserId(id);
		System.out.println(list);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());			
			map.put("RESPONSE_DATA", list);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());			
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	
	@RequestMapping(value ="/login", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> login(@RequestParam("email") String email,@RequestParam("password") String password) {
		System.out.println("login");
		System.out.println(embededMemoService.memoLogin(email, password));
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("EMAIL",email);
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());			
			map.put("RESPONSE_DATA", embededMemoService.memoLogin(email, password));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());			
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	

}
