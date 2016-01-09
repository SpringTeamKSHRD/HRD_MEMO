package com.memo.app.repo.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.entities.User;
import com.memo.app.repo.UserDaoRepoService;
@Primary
@Repository
public class HUserRepoImpl implements UserDaoRepoService {
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
	@Transactional
	public List<User> getUserList() {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery("from User");
		List list =query.list();
		return list;
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
