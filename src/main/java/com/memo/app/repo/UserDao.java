package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.User;

public interface UserDao {
	//admin page
	public int toggleUser(int id);
	public List<User> listUser(int limit, int offset, boolean ismemoenabled);
	public List<User> searchUserByColumn(int limit, int offset, boolean ismemoenabled, String column, String keyword);	
	//ky sona
	public boolean updateUser1(User user);
	public boolean updateUserPassword(User user);
	//other
	public int saveUser(User user);
	public int updateUser(User user);
	public List<User> searchUser(String email);
	public List<User> searchUser(int id);
	public boolean updateUserByColumn(String column, Object key, int id);
	public String getEmail(String email);
	public User getUserDialInfo(String emial);
}
