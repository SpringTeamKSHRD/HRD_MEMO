package com.memo.app.repo.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.memo.app.entities.User;
import com.memo.app.entities.UserRole;
import com.memo.app.repo.UserDao;

@Repository("UserDaoImpl")
public class UserDaoImpl implements UserDao {

	@Autowired
	DataSource dataSource;
	
	@Override
	public User findUserByUserName(String username) {

		return null;
	}

	public List<UserRole> findUserRoleByUserId(int id) {

		return null;
	}

	@Override
	public User loadUserById(int id) {

		return null;
	}


}
