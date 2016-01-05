package com.memo.app.repo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.memo.app.entities.User;
import com.memo.app.repo.UserDaoRepoService;

@Repository
public class UserDaoRepoImpl implements UserDaoRepoService {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int saveUser(User user) {
		
		String sql="INSERT INTO tbuser(name,gender,email,password,image)"
				+ " VALUES(?,?,?,?,?)";
		String password=new BCryptPasswordEncoder().encode(user.getPassword());
		Object[] obj=new Object[]{user.getName(),user.getGender(),user.getEmail(),password,user.getImage()};
		try{
			return jdbcTemplate.update(sql,obj);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}
	
	@Override
	public int updateUser(User user) {
		
		String sql="UPDATE tbuser SET name=?,gender=?,email=?,password=?,image=? WHERE id=?";
		Object[] obj=new Object[]{user.getName(),user.getGender(),user.getEmail(),user.getPassword(),user.getImage(),user.getId()};
		try{
			return jdbcTemplate.update(sql,obj);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}

	@Override
	public int changeUserEnable(int id) {
		
		String sql="UPDATE tbuser SET enable= NOT enable WHERE id=?";
		try{
			return jdbcTemplate.update(sql,id);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}

	@Override
	public List<User> getUserList() {
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
