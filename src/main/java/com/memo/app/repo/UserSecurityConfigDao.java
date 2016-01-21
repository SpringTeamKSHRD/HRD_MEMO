package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.UserRole;
import com.memo.app.entities.UserSecurConfig;

public interface UserSecurityConfigDao {
	
	public UserSecurConfig findUserByUserName(String username);
	public List<UserRole> findUserRoleByUserId(int id);	

}
