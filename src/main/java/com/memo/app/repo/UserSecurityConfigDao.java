package com.memo.app.repo;

import com.memo.app.entities.UserSecurConfig;

public interface UserSecurityConfigDao {
	
	public UserSecurConfig findUserByUserName(String username);
	public UserSecurConfig loadUserById(int id);	

}
