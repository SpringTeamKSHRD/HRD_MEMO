package com.memo.app.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.memo.app.entities.User;
import com.memo.app.repo.UserDao;
import com.memo.app.services.UserService;

@Service
@Lazy
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userdao;

	@Override
	public boolean saveUser(User user) {
		if (userdao.saveUser(user) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateUser(User user) {
		if (userdao.updateUser(user) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean changeUserEnable(int id) {
		if (userdao.changeUserEnable(id) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<User> getUserList(int limit, int page, boolean ismemoenabled){
		//maximum 100 rows
		if(limit > 100) limit = 100;
		//minimum 10 rows
		if(limit < 10) limit = 10;
		//default is first page
		if(page < 1) page = 1;
		//calculate offset for database
		int offset = limit * page - limit;
		return userdao.getUserList(limit,offset,ismemoenabled);
	}

	@Override
	public List<User> searchUser(String name) {
		return userdao.searchUser(name);
	}

	@Override
	public List<User> searchUser(int id) {
		return userdao.searchUser(id);
	}

	@Override
	public User getUserByEmail(String email) {
		return userdao.getUserDialInfo(email);
	}

	@Override
	public boolean updateUser1(User user) {
		return userdao.updateUser1(user);
	}

	@Override
	public boolean updateUserPassword(User user) {
		return userdao.updateUserPassword(user);
	}

	
	@Override
	public List<User> searchUserByColumn(int limit, int page, String keyword, String column) {
		//maximum 100 rows
		if(limit > 100) limit = 100;
		//minimum 10 rows
		if(limit < 10) limit = 10;
		//default is first page
		if(page < 1) page = 1;
		//calculate offset for database
		int offset = limit * page - limit;
		if(column.equals("username")) return userdao.searchUserByColumn(limit,offset,"username",keyword);
		if(column.equals("email")) return userdao.searchUserByColumn(limit,offset,"email",keyword);
		return null;
	}

	@Override
	public boolean updateUserType(int usertypeid, int id) {
		return userdao.updateUserByColumn("usertypeid", usertypeid, id);
	}

}
