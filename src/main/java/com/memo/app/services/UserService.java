package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.User;

public interface UserService {
	public boolean saveUser(User user);
	public boolean updateUser(User user);
	public boolean changeUserEnable(int id);
	public boolean updateUserType(int usertypeid, int id);
	public List<User> getUserList(int limit, int page, boolean ismemoenabled);
	public List<User> searchUser(String name);
	public List<User> searchUser(int id);
	public User getUserByEmail(String email);
	public List<User> searchUserByColumn(int limit, int page, String keyword, String column);
	
	//ky sona
	public boolean updateUser1(User user);
	public boolean updateUserPassword(User user);
}
