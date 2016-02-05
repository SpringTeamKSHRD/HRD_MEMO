package com.memo.app.restcontroller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoFilter;
import com.memo.app.entities.MemoSearch;
import com.memo.app.entities.Message;
import com.memo.app.entities.Pagination;
import com.memo.app.entities.User;
import com.memo.app.entities.UserSecurConfig;
import com.memo.app.repo.impl.UserDaoImpl;
import com.memo.app.services.IMemoService;
import com.memo.app.services.MemoService;
import com.memo.app.services.MessageService;
import com.memo.app.services.UserService;

@RestController
@RequestMapping(value = "/user")
public class MemoController {
	// private static final Logger logger =
	// LoggerFactory.getLogger(AdminArticleController.class);
	@Autowired
	private MemoService memoService;
	
	@Autowired
	private IMemoService pmemoservice;
	
	@Autowired
	private UserService userService;

	@Autowired
	private UserDaoImpl userDao;

	@Autowired
	private MessageService messageService;

	// update user information
	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateUser(@RequestBody User user, HttpServletRequest request) {
		// System.out.println("update user memo controller.");
		Map<String, Object> map = new HashMap<String, Object>();

		if (userService.updateUser1(user)) {
			map.put("MESSAGE", "USER HAS BEEN UPDATED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			request.getSession().setAttribute("USER",
					userDao.getUserDialInfo((SecurityContextHolder.getContext().getAuthentication().getName())));

			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
		} else {
			map.put("MESSAGE", "USER HAS NOT BEEN UPDATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	// update user password
	@RequestMapping(value = "/updatepassword", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> updateUserPassword(@RequestBody User user) {
		System.out.println("update user password memo controller.");
		Map<String, Object> map = new HashMap<String, Object>();

		if (userService.updateUserPassword(user)) {
			map.put("MESSAGE", "USER PASSWORD HAS BEEN UPDATED.");
			map.put("STATUS", HttpStatus.CREATED.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.CREATED);
		} else {
			map.put("MESSAGE", "USER PASSWORD HAS NOT BEEN UPDATED.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	// get user new reports
	@RequestMapping(value = "/numbermessage/{uid}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getNumberMessage(@PathVariable("uid") int uid) {
		int number = messageService.getNumberMessage(uid);
		Map<String, Object> map = new HashMap<String, Object>();
		if (number == 0) {
			map.put("MESSAGE", "MESSAGES HAS NOT FOUND.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MESSAGES HAVE BEEN FOUND.");
		map.put("STATUS", HttpStatus.OK.value());
		map.put("DATA", number);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// get user new reports
	@RequestMapping(value = "/newmessage/{uid}/{page}/{limit}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listNewMessage(@PathVariable("uid") int uid,
			@PathVariable("page") int page, @PathVariable("limit") int limit) {
		List<Message> message = new ArrayList<Message>();
		Map<String, Object> map = new HashMap<String, Object>();
		message = messageService.getUserMessage(uid, page, limit);
		if (message.isEmpty()) {
			map.put("MESSAGE", "MESSAGES HAS NOT FOUND.");
			// map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MESSAGES HAVE BEEN FOUND.");
		map.put("STATUS", HttpStatus.OK.value());
		map.put("DATA", message);
		map.put("TOTAL", message.size());
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// get user old reports
	@RequestMapping(value = "/oldreport/{uid}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listOldReport(@PathVariable("uid") int uid) {
		List<Message> message = new ArrayList<Message>();
		Map<String, Object> map = new HashMap<String, Object>();
		message = messageService.getOldMessage(uid);
		if (message.isEmpty()) {
			map.put("MESSAGE", "MESSAGES HAS NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MESSAGES HAVE BEEN FOUND.");
		map.put("STATUS", HttpStatus.OK.value());
		map.put("DATA", message);
		map.put("TOTAL", message.size());
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// change status report to be viewed
	@RequestMapping(value = "/changereport/{uid}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> changeStatusReport(@PathVariable("uid") int uid) {
		System.out.println("change status user report controller with userid=" + uid);
		Map<String, Object> map = new HashMap<String, Object>();

		if (!messageService.changeMessageIsViewed(uid)) {
			map.put("MESSAGE", "MESSAGES HAS NOT BEEN CHANGE STATUS.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MESSAGES HAVE BEEN CHANGE STATUS.");
		map.put("STATUS", HttpStatus.OK.value());
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// list memo with limiting amount of rows
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listMemo(@PathVariable Map<String, String> pathVariables) {
		ArrayList<Memo> memos = null;
		Map<String, Object> map = new HashMap<String, Object>();
		memos = (ArrayList<Memo>) memoService.listMemo(true);
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

	// insert memo
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addMemo(@RequestBody Memo memo) {
		System.out.println("add memo controller.");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserSecurConfig user = (UserSecurConfig) authentication.getPrincipal();
		memo.setUserid(user.getId());
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

	// search memo by specific ID
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getMemo(@PathVariable("id") int id) {
		System.out.println("detail controller");
		Map<String, Object> map = new HashMap<String, Object>();
		Memo memo = memoService.getMemo(id);
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

	// filter memo by title
	@RequestMapping(value = "/filter/{column}/{value}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> filterMemo(@PathVariable("column") String column,
			@PathVariable("value") String value) {
		// System.out.println("filter name controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> list = new ArrayList<Memo>();
		list = memoService.filterMemoByColumnName(column, value);
		if (list.isEmpty()) {
			map.put("MESSAGE", "MEMO NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
		map.put("STATUS", HttpStatus.FOUND.value());
		map.put("DATA", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

	// filter memo by title
	@RequestMapping(value = "/privacy/{ispublic}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> filterMemoByPrivacy(@PathVariable("ispublic") boolean ispublic) {
		// System.out.println("filter name controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> list = new ArrayList<Memo>();
		list = memoService.filterMemoByPrivacy(ispublic);
		if (list.isEmpty()) {
			map.put("MESSAGE", "MEMO NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
		map.put("STATUS", HttpStatus.FOUND.value());
		map.put("DATA", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

	// filter memo by date range
	@RequestMapping(value = "/filterdate/{sd}/{ed}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> filterDate(@PathVariable("sd") Object sd,
			@PathVariable("ed") Object ed) {
		System.out.println("filter date controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> list = new ArrayList<Memo>();
		list = memoService.filterMemoByDate(sd, ed);
		if (list.isEmpty()) {
			map.put("MESSAGE", "MEMO NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MEMO HAS BEEN FOUND.");
		map.put("STATUS", HttpStatus.FOUND.value());
		map.put("DATA", list);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

	}

	// update memo
//	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
//	public ResponseEntity<Map<String, Object>> updateMemo(@RequestBody Memo memo) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		if (memoService.updateMemo(memo)) {
//			map.put("MESSAGE", "MEMO HAS BEEN UPDATED.");
//			map.put("STATUS", HttpStatus.FOUND.value());
//			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
//		} else {
//			map.put("MESSAGE", "MEMO HAS NOT BEEN UPDATED.");
//			map.put("STATUS", HttpStatus.NOT_FOUND.value());
//			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
//		}
//	}

	// update memo
//	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
//	public ResponseEntity<Map<String, Object>> deleteMemo(@PathVariable("id") int id) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		if (memoService.deleteMemo(id)) {
//			map.put("MESSAGE", "MEMO HAS BEEN DELETED.");
//			map.put("STATUS", HttpStatus.FOUND.value());
//			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
//		} else {
//			map.put("MESSAGE", "MEMO HAS NOT BEEN DELETED.");
//			map.put("STATUS", HttpStatus.NOT_FOUND.value());
//			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
//		}
//	}

	// upload image
	@RequestMapping(value = "/uploadimage", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> uploadImage(@RequestParam("file") MultipartFile file,
			HttpServletRequest request) {
		System.out.println("upload controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		if (!file.isEmpty()) {
			try {

				String originalFilename = file.getOriginalFilename();
				String extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);

				String filename = UUID.randomUUID() + "." + extension;
				System.out.println("Filename : " + filename);

				byte[] bytes = file.getBytes();

				// creating the directory to store file
				String savePath = request.getSession().getServletContext().getRealPath("/resources/user/image/");
				System.out.println(savePath);
				File path = new File(savePath);
				if (!path.exists()) {
					path.mkdir();
				}

				// creating the file on server
				File serverFile = new File(savePath + File.separator + filename);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println(serverFile.getAbsolutePath());
				System.out.println("You are successfully uploaded file " + filename);
				map.put("MESSAGE", "UPLOAD IMAGE SUCCESS");
				map.put("STATUS", HttpStatus.OK.value());
				map.put("IMAGE", request.getContextPath() + "/images/" + filename);
				map.put("IMG_NAME", filename);
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				System.out.println("You are failed to upload  => " + e.getMessage());
			}
		} else {
			System.err.println("File not found");
		}
		return null;
	}

	// get all message number
	@RequestMapping(value = "/allnumbermessage/{uid}/{date}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getAllNumberMessage(@PathVariable("uid") int uid,
			@PathVariable("date") String date) {
		System.out.println("i do");
		int number = messageService.getAllNumberMessage(uid, date);
		Map<String, Object> map = new HashMap<String, Object>();
		if (number == 0) {
			map.put("MESSAGE", "MESSAGES HAS NOT FOUND.");
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MESSAGES HAVE BEEN FOUND.");
		map.put("STATUS", HttpStatus.OK.value());
		map.put("DATA", number);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// get user old reports limit offset
	@RequestMapping(value = "/oldmessage/{uid}/{page}/{limit}/{date}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listOldMessage(@PathVariable("uid") int uid,
			@PathVariable("page") int page, @PathVariable("limit") int limit, @PathVariable("date") String date) {
		List<Message> message = new ArrayList<Message>();
		Map<String, Object> map = new HashMap<String, Object>();
		message = messageService.getOldMessage(uid, page, limit, date);
		if (message.isEmpty()) {
			map.put("MESSAGE", "MESSAGES HAS NOT FOUND.");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
		map.put("MESSAGE", "MESSAGES HAVE BEEN FOUND.");
		map.put("STATUS", HttpStatus.OK.value());
		map.put("DATA", message);
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}

	// user get owner memo
	@RequestMapping(value = "/getallmemo", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> listUserMemo(@RequestBody MemoSearch memo) {
		ArrayList<Memo> memos = null;
		Map<String, Object> map = new HashMap<String, Object>();
		memos = (ArrayList<Memo>) memoService.listMemo(memo);
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

	// get memo nummber
	@RequestMapping(value = "/getmemonumber", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> getMemoNumber(@RequestBody MemoSearch memo) {
		Map<String, Object> map = new HashMap<String, Object>();
        int mn=memoService.getMemoNumber(memo);
		if (mn>0) {
			map.put("MESSAGE", "Memo Found.");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA",mn);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND..!");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	//for brother pheak
	@RequestMapping(value = "/usermemo", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> listMemo(@RequestBody MemoSearch memo) {
		ArrayList<Memo> memos = null;
		Map<String, Object> map = new HashMap<String, Object>();
		memos = (ArrayList<Memo>) memoService.listMemoNew(memo);
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
	@RequestMapping(value = "/numbermemo", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> numberMemo(@RequestBody MemoSearch memo) {
		System.out.println("list memo");
		System.out.println(memo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
        int mn=memoService.getMemoNumberNew(memo);
		if (mn>0) {
			map.put("MESSAGE", "Memo Found.");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA",mn);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND..!");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	// SOPHEAK'S IMPLEMENT
	@RequestMapping(value = "/mylistmemo", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> listMemo(@RequestBody Memo memo) {
		System.out.println("list memo");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(memo.toString());
		System.out.println(pmemoservice.listMemo(memo, 9, 0));
		if ((pmemoservice.listMemo(memo, 9, 0)).size()>0) {
			map.put("MESSAGE", "MEMO FOUND...!");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA",pmemoservice.listMemo(memo, 9, 0));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND..!");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value = "/mylistmemo1", method = RequestMethod.POST,headers = "Accept=application/json")
	public ResponseEntity<Map<String, Object>> listMemoWithPrivacy(@RequestBody Memo memo) {
		System.out.println("list memo");
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(memo.toString());
		System.out.println(pmemoservice.listMemo(memo, 9, 0));
		if ((pmemoservice.listMemoWithPrivacy(memo, 9, 0)).size()>0) {
			map.put("MESSAGE", "MEMO FOUND...!");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA",pmemoservice.listMemoWithPrivacy(memo, 10, 0));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND..!");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
		
	@RequestMapping(value = "/listdomain", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listDomain() {
		System.out.println("list domain");
		MemoFilter filter = new MemoFilter();
		filter.setTitle("test");
		filter.setDomainName("");
		filter.setIsPublic("");
		filter.setUserId(2);
		System.out.println(pmemoservice.count(filter));
		Pagination pagination = new Pagination();
		pagination.setTotalCount(pmemoservice.count(filter));
		pagination.setTotalPages(pagination.totalPages());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserSecurConfig user = (UserSecurConfig) authentication.getPrincipal();
		
		System.out.println(pmemoservice.dashboardSummary(user.getId()));
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(pmemoservice.listAllDomain());
		if ((pmemoservice.listAllDomain()).size()>0) {
			map.put("MESSAGE", "MEMO FOUND...!");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA",pmemoservice.listAllDomain());
			map.put("DASHBOARD_DATA", pmemoservice.dashboardSummary(user.getId()));
			map.put("PAGINATION", pagination);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} else {
			map.put("MESSAGE", "MEMO NOT FOUND..!");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
//	delete memo
	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteMemoP(@PathVariable int id) {
		System.out.println("delete memo");
		System.out.println(id);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", pmemoservice.deleteMemo(id));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
//	update memo
	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = "application/json", headers = "content-type=application/x-www-form-urlencoded")
	public ResponseEntity<Map<String, Object>> updateMemoP(@RequestBody Memo m) {
		System.out.println("update memo");
		System.out.println(m.getContent());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", pmemoservice.updateMemo(m));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value = "/user/memos", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listmemos(MemoFilter filter, Pagination pagination) {
		System.out.println("list memo");
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		UserSecurConfig user = (UserSecurConfig) authentication.getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();
		filter.setUserId(user.getId());
		System.out.println(filter);
		pagination.setTotalCount(pmemoservice.count(filter));
		pagination.setTotalPages(pagination.totalPages());
		//if ((pmemoservice.listMemoWithPrivacy(memo, 9, 0)).size()>0) {
			map.put("MESSAGE", "MEMO FOUND...!");
			map.put("STATUS", HttpStatus.FOUND.value());
			map.put("DATA",pmemoservice.listAllMemos(filter, pagination));
			map.put("PAGINATION", pagination);
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		/*} else {
			map.put("MESSAGE", "MEMO NOT FOUND..!");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}*/
	}
}
