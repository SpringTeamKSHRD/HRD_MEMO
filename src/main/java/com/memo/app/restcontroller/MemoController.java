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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.memo.app.entities.Memo;
import com.memo.app.entities.User;
import com.memo.app.services.MemoService;
import com.memo.app.services.UserService;

@RestController
@RequestMapping(value = "/user")
public class MemoController {
	//private static final Logger logger = LoggerFactory.getLogger(AdminArticleController.class);
	@Autowired
	private MemoService memoService;
	
	@Autowired
	private UserService userService;
	
	// insert user information 
		@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
		public ResponseEntity<Map<String, Object>> updateUser(@RequestBody User user) {
			//System.out.println("update user memo controller.");		
			Map<String, Object> map = new HashMap<String, Object>();
			
			if (userService.updateUser1(user)) {			
				map.put("MESSAGE", "USER HAS BEEN UPDATED.");
				map.put("STATUS", HttpStatus.CREATED.value());
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
			
	// list memo with limiting amount of rows
	@RequestMapping(value = { "/list/{limit}","/list/{limit}/{page}"}, method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listMemo(@PathVariable Map<String, String> pathVariables) {
		System.out.println("list user controller."+pathVariables.get("limit"));
		ArrayList<Memo> memos = null;
		Map<String, Object> map = new HashMap<String, Object>();
		if (pathVariables.containsKey("limit") && pathVariables.containsKey("page")) {
			memos = (ArrayList<Memo>) memoService.listMemo(Integer.parseInt(pathVariables.get("limit")),
					Integer.parseInt(pathVariables.get("page")), true);
		} else if (pathVariables.containsKey("limit")) {
			memos = (ArrayList<Memo>) memoService.listMemo(Integer.parseInt(pathVariables.get("limit")), 0, true);
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
	
	// insert memo 
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
	public ResponseEntity<Map<String, Object>> filterMemo(@PathVariable("column") String column,@PathVariable("value") String value) {
		//System.out.println("filter name controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> list=new ArrayList<Memo>();
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
			//System.out.println("filter name controller.");
			Map<String, Object> map = new HashMap<String, Object>();
			List<Memo> list=new ArrayList<Memo>();
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
	public ResponseEntity<Map<String, Object>> filterDate(@PathVariable("sd") Object sd,@PathVariable("ed") Object ed) {
		System.out.println("filter date controller.");
		Map<String, Object> map = new HashMap<String, Object>();
		List<Memo> list=new ArrayList<Memo>();
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
	
	// update memo
		@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
		public ResponseEntity<Map<String, Object>> deleteMemo(@PathVariable("id") int id) {
			Map<String, Object> map = new HashMap<String, Object>();
			if (memoService.deleteMemo(id)) {
				map.put("MESSAGE", "MEMO HAS BEEN DELETED.");
				map.put("STATUS", HttpStatus.FOUND.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} else {
				map.put("MESSAGE", "MEMO HAS NOT BEEN DELETED.");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
			}
		}
		
	//upload image
		@RequestMapping(value = "/uploadimage", method = RequestMethod.POST)
		public ResponseEntity<Map<String,Object>> uploadImage(@RequestParam("file") MultipartFile file, HttpServletRequest request){
			System.out.println("upload controller.");
			Map<String, Object> map  = new HashMap<String, Object>();
			if(!file.isEmpty()){
				try{
					
					String originalFilename = file.getOriginalFilename(); 
		            String extension = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
		            
		            String filename =UUID.randomUUID()+"."+extension;
		            System.out.println("Filename : " + filename);
		            
					byte[] bytes = file.getBytes();

					// creating the directory to store file
					String savePath = request.getSession().getServletContext().getRealPath("/resources/user/image/");
					System.out.println(savePath);
					File path = new File(savePath);
					if(!path.exists()){
						path.mkdir();
					}
					
					// creating the file on server
					File serverFile = new File(savePath + File.separator + filename );
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
					
					System.out.println(serverFile.getAbsolutePath());
					System.out.println("You are successfully uploaded file " + filename);
					map.put("MESSAGE","UPLOAD IMAGE SUCCESS");
					map.put("STATUS", HttpStatus.OK.value());
					map.put("IMAGE", request.getContextPath() + "/images/" + filename);
					map.put("IMG_NAME",filename);
					return new ResponseEntity<Map<String,Object>>
										(map, HttpStatus.OK);
				}catch(Exception e){
					System.out.println("You are failed to upload  => " + e.getMessage());
				}
			}else{
				System.err.println("File not found");
			}
			return null;
		}
		
	
}
