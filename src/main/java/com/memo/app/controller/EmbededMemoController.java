package com.memo.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Memo;
import com.memo.app.services.IEmbededMemoService;

@RestController
@RequestMapping("/admin/memo")
public class EmbededMemoController {
	@Autowired
	private IEmbededMemoService embededMemoService;
	
	@CrossOrigin(origins = "http://localhost:9000")
	@RequestMapping(value = { "/{userid}" }, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listArticle(@PathVariable("userid") int userid) {
		System.out.println("list memo");
		List<Memo> list = embededMemoService.listMemoByUserId(userid);
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
	
}
