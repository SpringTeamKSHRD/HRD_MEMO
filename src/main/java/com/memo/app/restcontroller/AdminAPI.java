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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Memo;
import com.memo.app.entities.Message;
import com.memo.app.entities.Report;
import com.memo.app.entities.User;
import com.memo.app.services.MemoService;
import com.memo.app.services.MessageService;
import com.memo.app.services.ReportService;
import com.memo.app.services.UserService;

@RestController
@RequestMapping(value="/api/admin")
public class AdminAPI {
	
	@Autowired
	private UserService userDao;
	
	@Autowired
	private ReportService reportDao;
	
	@Autowired
	private MemoService memoDao;
	
	@Autowired
	private MessageService messageDao;
	
	//#####################################User
	@RequestMapping(value="/user/promote", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> promoteUser(
			@RequestParam(value = "id") int id,
			@RequestParam(value = "usertypeid", required = false, defaultValue = "2") int usertypeid){
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.OK;
		if (userDao.updateUserType(usertypeid,id)) {	
			map.put("MESSAGE", "USER HAS BEEN PROMOTED.");
		} else {
			map.put("MESSAGE", "USER NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value="/user/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteUser(@PathVariable("id") int id){
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.OK;
		if (userDao.changeUserEnable(id)) {	
			map.put("MESSAGE", "USER HAS BEEN DELETE.");
		} else {
			map.put("MESSAGE", "USER NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value="/users", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listUser(
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "ismemoenabled", required = false,  defaultValue = "true") boolean ismemoenabled){
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> users=userDao.getUserList(limit, page, ismemoenabled);
		HttpStatus status = HttpStatus.OK;
		if (!users.isEmpty()) {	
			map.put("MESSAGE", "USER HAS BEEN FOUND.");
			map.put("DATA",users);
		} else {
			map.put("MESSAGE", "USER NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value="/users/search", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> searchUser(
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "ismemoenabled", required = false,  defaultValue = "true") boolean ismemoenabled,
			@RequestParam(value = "keyword") String keyword,
			@RequestParam(value = "column", required = false, defaultValue = "username") String column){
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> users=userDao.searchUserByColumn(limit, page, ismemoenabled, column, keyword);
		HttpStatus status = HttpStatus.OK;
		
		if (!users.isEmpty()) {	
			map.put("MESSAGE", "USER HAS BEEN FOUND.");
			map.put("DATA",users);
		} else {
			map.put("MESSAGE", "USER NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	//#####################################Memo
	@RequestMapping(value="/memos", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listMemo( 
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "isenabled", required = false,  defaultValue = "true") boolean isenabled){
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> memos=memoDao.listMemo(limit, page, isenabled);
		HttpStatus status = HttpStatus.OK;
		if (!memos.isEmpty()) {	
			map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
			map.put("DATA",memos);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	//#####################################Report	
	@RequestMapping(value="/reports/search", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> searchReport(
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "isblocked", required = false,  defaultValue = "false") boolean isblocked,
			@RequestParam(value = "keyword") String keyword,
			@RequestParam(value = "column", required = false, defaultValue = "title") String column){
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Report> reports=reportDao.searchReportByColumn(limit, page, isblocked, column, keyword);
		HttpStatus status = HttpStatus.OK;
		
		if (!reports.isEmpty()) {	
			map.put("MESSAGE", "REPORT HAS BEEN FOUND.");
			map.put("DATA",reports);
		} else {
			map.put("MESSAGE", "REPORT NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	@RequestMapping(value="/reports", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listReport( 
			@RequestParam(value = "limit", required = false, defaultValue = "10") int limit,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "isblocked", required = false,  defaultValue = "false") boolean isblocked){
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Report> reports=reportDao.getAllReport(limit, page, isblocked);
		HttpStatus status = HttpStatus.OK;
		if (!reports.isEmpty()) {	
			map.put("MESSAGE", "REPORT HAS BEEN FOUND.");
			map.put("DATA",reports);
		} else {
			map.put("MESSAGE", "REPORT NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}

	@RequestMapping(value="/report/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> reportDetail(  
			@PathVariable("id") Integer id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Report rp = reportDao.getReportDetail(id);
		HttpStatus status = HttpStatus.OK;
		if (rp instanceof Report) {	
			map.put("MESSAGE", "REPORT HAS BEEN FOUND.");
			map.put("DATA", rp);
		} else {
			map.put("MESSAGE", "REPORT NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	

	@RequestMapping(value = "/report/block", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> blockMemo(@RequestBody Report report) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
		
		List<Message> listMessage = new ArrayList<Message>();
		listMessage.add(new Message(0,report.getOwnermemoid(),1,false,null,null,report.getMemoid()));
		listMessage.add(new Message(0,report.getReporterid(),2,false,null,null,report.getMemoid()));

		if(		messageDao.saveMessage(listMessage) &&
				reportDao.updateReportIsBlockedWithMemoid(true, report.getMemoid()) &&
				memoDao.deleteMemo(report.getMemoid())){
			map.put("MESSAGE", "REPORT HAS BEEN BLOCK.");
			status = HttpStatus.OK;
		}else{
			map.put("MESSAGE", "REPORT HAS NOT BEEN BLOCK.");
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
	
	
	@RequestMapping(value = "/notification", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getReportNotification() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Report> reports=reportDao.getReportNotification();
		HttpStatus status = HttpStatus.OK;
		if (!reports.isEmpty()) {	
			map.put("MESSAGE", "NOTIFICATION HAS BEEN FOUND.");
			map.put("DATA",reports);
		} else {
			map.put("MESSAGE", "NOTIFICATION NOT FOUND.");
			status = HttpStatus.NOT_FOUND;
		}
		return new ResponseEntity<Map<String, Object>>(map, status);
	}
}