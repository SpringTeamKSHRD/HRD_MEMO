package com.memo.app.repo;

import com.memo.app.entities.User;

public interface UserDao {
	
	public User findUserByUserName(String username);
	public User loadUserById(int id);	

}
