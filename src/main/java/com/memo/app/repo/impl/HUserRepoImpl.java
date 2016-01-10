package com.memo.app.repo.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.memo.app.entities.User;
import com.memo.app.repo.UserDao;
@Primary
@Repository
public class HUserRepoImpl implements UserDao {
	@Autowired
	private SessionFactory sf;

	@Override
	public int saveUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int changeUserEnable(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> searchUser(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> searchUser(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
