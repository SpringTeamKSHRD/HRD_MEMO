package com.memo.app.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Memo;
import com.memo.app.services.MemoService;

@RestController
@RequestMapping(value = "/user")
public class MemoController {
	@Autowired
	private MemoService memoService;
	
	@RequestMapping(value = { "/list/{limit}","/list/{limit}/{page}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listMemo(@PathVariable Map<String, String> pathVariables) {
		System.out.println("list user controller.");
		ArrayList<Memo> memos = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if (pathVariables.containsKey("limit") && pathVariables.containsKey("page")) {
			memos = (ArrayList<Memo>) memoService.listMemo(Integer.parseInt(pathVariables.get("limit")),
					Integer.parseInt(pathVariables.get("page")));
		} else if (pathVariables.containsKey("limit")) {
			memos = (ArrayList<Memo>) memoService.listMemo(Integer.parseInt(pathVariables.get("limit")), 0);
		}
		if (memos.isEmpty()) {
			map.put("MESSAGE", "MEMOS ARE NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MEMOS HAVE BEEN FOUND.");
		map.put("STATUS", HttpStatus.OK.value());
		map.put("DATA", memos);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addMemo(@RequestBody Memo memo) {
		System.out.println("add memo controller.");		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (memoService.insertMemo(memo)) {			
			map.put("MESSAGE", "MEMO HAS BEEN CREATED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN CREATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getMemo(@PathVariable("id") int id) {
		System.out.println("detail controller");
		Map<String, Object> map = new HashMap<String, Object>();
		Memo memo = memoService.getMemo(id);
		System.out.println(memo.getContent());
		if (memo != null) {
			map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA", memo);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			
		}
			map.put("MESSAGE", "MEMO NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateMemo(@RequestBody Memo memo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (memoService.updateMemo(memo)) {
			map.put("MESSAGE", "MEMO HAS BEEN UPDATED.");
			map.put("STATUS", HttpStatus.FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN UPDATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	
	
}
