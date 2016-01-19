package com.memo.app.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Memo;
import com.memo.app.entities.User;
import com.memo.app.services.IEmbededMemoService;

@RestController
@RequestMapping("/plugin/memo")
public class EmbededMemoController {
	@Autowired
	private IEmbededMemoService embededMemoService;
	
	@RequestMapping(value ="", method = RequestMethod.POST,consumes="application/json",headers = "content-type=application/x-www-form-urlencoded")
	public ResponseEntity<Map<String, Object>> listArticle(@RequestBody Memo memo) {
		System.out.println("list memo");
		List<Memo> list = embededMemoService.listMemoByUserIdAndURL(memo.getId(),memo.getFullDomain());
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
	public ResponseEntity<Map<String, Object>> login(@ModelAttribute User user) {
		System.out.println("login");
		User temp = embededMemoService.memoLogin(user.getEmail(), user.getPassword());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("USERID",temp.getUserid());
			map.put("USERNAME",temp.getUsername());
			map.put("IMAGE_URL",temp.getImage());
			map.put("EMAIL",temp.getEmail());
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());			
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());			
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	

}
