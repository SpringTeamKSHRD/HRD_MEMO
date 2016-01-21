package com.memo.app.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.memo.app.entities.User;
import com.memo.app.repo.impl.UserDaoRepoImpl;
import com.memo.app.services.UserService;

@Service
@Lazy
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDaoRepoImpl userdao;

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
	public List<User> getUserList(Integer limit, Integer page, boolean ismemoenabled){
		if(limit > 100) limit = 100;
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
	

}
