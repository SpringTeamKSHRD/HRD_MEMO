package com.memo.app.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.memo.app.entities.Report;
import com.memo.app.services.impl.MemoServiceImpl;
import com.memo.app.services.impl.ReportServiceImpl;
//phalleak plugin api
@RestController
@RequestMapping(value="/plugin")
public class PluginMemoAPI2 {
	
	@Autowired
	private ReportServiceImpl reportDao;
	@Autowired
	private MemoServiceImpl memoDao;
	
	@RequestMapping(value = "/savememo", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> addMemo(@RequestBody Memo memo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (memoDao.getMemoByUrl(memo.getDomain(),memo.getUrl(),memo.getUserid())==null) {	
			memoDao.insertMemo(memo);
			map.put("MESSAGE", "MEMO HAS BEEN CREATED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN CREATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_ACCEPTABLE);
		}
	}
	@RequestMapping(value = "/plugingetmemoowner", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> getMemoOwner(@RequestBody Memo memo) {
		System.out.println("get owner");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> memos=new ArrayList<Memo>();
		memos=memoDao.pluginGetMemoOwner(memo.getUserid(),memo.getUrl());
		if (!memos.isEmpty()) {	
			map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
			map.put("STATUS", HttpStatus.CREATED.value());
			map.put("DATA",memos);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	@RequestMapping(value = "/plugingetmemopublic", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> getMemoPublic(@RequestBody Memo memo) {
		System.out.println("get public");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> memos=new ArrayList<Memo>();
		memos=memoDao.pluginGetMemoPulic(memo.getUserid(),memo.getUrl());
		if (!memos.isEmpty()) {	
			map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
			map.put("STATUS", HttpStatus.CREATED.value());
			map.put("DATA",memos);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	@RequestMapping(value="/report", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String,Object>> userReport(@RequestBody Report rp){
		Map<String,Object> map=new HashMap<String,Object>();
		if(reportDao.saveReport(rp)==true){
			map.put("MESSAGE","REPORT HAS BEEN SENT");
			map.put("STATUS",HttpStatus.ACCEPTED.value());
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}else{
			map.put("MESSAGE","REPORT HAS BEEN SENT FIALED");
			map.put("STATUS",HttpStatus.NOT_ACCEPTABLE.value());
			return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		}
	}
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> deleteMemo(@PathVariable("id") int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (memoDao.deleteMemo(id)) {
			map.put("MESSAGE", "MEMO HAS BEEN DELETED.");
			map.put("STATUS", HttpStatus.FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN DELETED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	@RequestMapping(value = "/toedit/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> toEditMemo(@PathVariable("id") int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Memo memo=memoDao.getMemo(id);
		if (memo!=null) {
			map.put("MESSAGE", "MEMO HAS BEEN DELETED.");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA",memo );
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN DELETED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	@RequestMapping(value = "/editmemocontent", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> updateMemoContent(@RequestBody Memo memo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (memoDao.updateMemoContent(memo)==true) {	
			map.put("MESSAGE", "MEMO HAS BEEN UPDATED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO HAS NOT BEEN UPDATED.");
			map.put("STATUS", true);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_ACCEPTABLE);
		}
	}
}
