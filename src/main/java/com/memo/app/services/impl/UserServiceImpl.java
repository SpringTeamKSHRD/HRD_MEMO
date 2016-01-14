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
	public List<User> getUserList() {
		return userdao.getUserList();
	}

	@Override
	public List<User> searchUser(String name) {
		return userdao.searchUser(name);
	}

	@Override
	public List<User> searchUser(int id) {
		return userdao.searchUser(id);
	}

}
