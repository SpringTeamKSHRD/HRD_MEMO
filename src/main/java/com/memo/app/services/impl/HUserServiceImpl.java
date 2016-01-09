package com.memo.app.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.memo.app.entities.User;
import com.memo.app.repo.UserDaoRepoService;
import com.memo.app.service.IUserService;
@Service
public class HUserServiceImpl implements IUserService {
	@Autowired
	private UserDaoRepoService userservice;
	
	@Override
	public List<User> ListAllUser() {
		return userservice.getUserList();
	}

}
