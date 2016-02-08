package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.User;

public interface UserService {
	//admin page
	public boolean toggleUser(int id);
	public List<User> listUser(int limit, int page, boolean ismemoenabled);
	public List<User> searchUserByColumn(int limit, int page, boolean ismemoenabled, String column, String keyword);
	//ky sona
	public boolean updateUser1(User user);
	public boolean updateUserPassword(User user);
	//other	
	public boolean saveUser(User user);
	public boolean updateUser(User user);	
	public boolean updateUserType(int usertypeid, int id);
	public List<User> searchUser(String name);
	public List<User> searchUser(int id);
	public User getUserByEmail(String email);
		
}
