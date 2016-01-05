package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.User;

public interface UserDaoRepoService {
	
	public int saveUser(User user);
	public int updateUser(User user);
	public int changeUserEnable(int id);
	public List<User> getUserList();
	public List<User> searchUser(String name);
	public List<User> searchUser(int id);

}
