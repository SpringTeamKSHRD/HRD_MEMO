package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.User;

public interface UserDao {
	public int saveUser(User user);
	public int updateUser(User user);
	public int changeUserEnable(int id);
	public List<User> getUserList(int limit, int offset, boolean ismemoenabled);
	public List<User> searchUser(String email);
	public List<User> searchUser(int id);
	public String getEmail(String email);
	public User getUserDialInfo(String emial);
	
	//ky sona
	public boolean updateUser1(User user);

}
