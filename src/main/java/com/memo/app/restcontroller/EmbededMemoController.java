package com.memo.app.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.memo.app.entities.Memo;
import com.memo.app.entities.Report;
import com.memo.app.entities.User;
import com.memo.app.services.IEmbededMemoService;

@RestController
@RequestMapping("/plugin/memo")
public class EmbededMemoController {
	@Autowired
	private IEmbededMemoService embededMemoService;
	
	/*@Autowired private String urlMemo;
	
	public void commonObject(Model m){
		 m.addAttribute("URL",urlMemo);
	}*/

	@RequestMapping(value = "", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody String listMemo(@RequestBody Memo memo) {
		System.out.println("list memo");
		String list = embededMemoService.listMemoByUserIdAndURL(memo.getId(), memo.getFullDomain());
		System.out.println(list);
		/*
		 * Map<String, String> map = new HashMap<>(); map.put("RESPONSE_DATA",
		 * list);
		 */
		return list;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> login(@ModelAttribute User user) {
		System.out.println("login");
		User temp = embededMemoService.memoLogin(user.getEmail(), user.getPassword());
		System.out.println(temp);
		Map<String, Object> map = new HashMap<String, Object>();
		if (temp != null) {
			try {
				map.put("USERID", temp.getUserid());
				map.put("USERNAME", temp.getUsername());
				map.put("IMAGE_URL", temp.getImage());
				map.put("EMAIL", temp.getEmail());
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
		return null;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST, consumes = "application/json", headers = "content-type=application/x-www-form-urlencoded")
	public ResponseEntity<Map<String, Object>> addMemo(@RequestBody Memo memo) {
		System.out.println("add memo");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", embededMemoService.addMemo(memo));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteMemo(@PathVariable int id) {
		System.out.println("delete memo");
		System.out.println(id);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", embededMemoService.deleteMemo(id));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST, consumes = "application/json", headers = "content-type=application/x-www-form-urlencoded")
	public ResponseEntity<Map<String, Object>> updateMemo(@RequestBody Memo m) {
		System.out.println("update memo");
		System.out.println(m.getContent());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", embededMemoService.updateMemo(m));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> validateEmail(@RequestParam String email) {
		System.out.println("validate email");
		System.out.println(email);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", embededMemoService.isExistedEmail(email));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/memoexisted/{memoid}", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> validateReportedMemo(@PathVariable("memoid") int memoid) {
		System.out.println("check existed reportedmemo");
		System.out.println(embededMemoService.isReportedMemo(memoid));
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("MESSAGE", "SUCCESS");
			map.put("STATUS", HttpStatus.OK.value());
			map.put("RESPONSE_DATA", embededMemoService.isReportedMemo(memoid));
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			map.put("MESSAGE", "LIST EMPTY");
			map.put("STATUS", HttpStatus.NOT_FOUND.value());
			return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> registerUser(@ModelAttribute User temp) {
		System.out.println("register new user");
		Map<String, Object> map = new HashMap<String, Object>();
//		temp.setImage("sopheak.jpg");
		if (embededMemoService.RegisterUser(temp) != null) {
			
			try {

				map.put("USERID", temp.getUserid());
				map.put("USERNAME", temp.getUsername());
				map.put("IMAGE_URL", temp.getImage());
				map.put("EMAIL", temp.getEmail());
				map.put("MESSAGE", "SUCCESS");
				map.put("STATUS", HttpStatus.OK.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				map.put("MESSAGE", "LIST EMPTY");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
			}
		}
		return null;
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> reportMemo(@RequestBody Report temp) {
		System.out.println("report memo");
		System.out.println(embededMemoService.insertReport(temp));
		Map<String, Object> map = new HashMap<String, Object>();
			try {
				map.put("RESPONSE_DATA",embededMemoService.insertReport(temp));
				map.put("STATUS", HttpStatus.OK.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				map.put("MESSAGE", "LIST EMPTY");
				map.put("STATUS", HttpStatus.NOT_FOUND.value());
				return new ResponseEntity<Map<String, Object>>(map, HttpStatus.NOT_FOUND);
			}

	}

}
