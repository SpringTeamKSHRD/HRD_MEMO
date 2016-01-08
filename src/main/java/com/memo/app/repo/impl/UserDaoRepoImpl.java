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
		
		String sql="INSERT INTO public.tbluser(username,password,gender,email,usertypeid,universityid,userimageurl)"
				+ " VALUES(?,?,?,?,?,?,?)";
		String password=new BCryptPasswordEncoder().encode(user.getPassword());
		Object[] obj=new Object[]{user.getUsername(),password,user.getGender(),user.getEmail(),36,12,user.getImage()};
		try{
			return jdbcTemplate.update(sql,obj);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}
	
	@Override
	public int updateUser(User user) {
		
		String password=new BCryptPasswordEncoder().encode(user.getPassword());
		String sql="UPDATE tbuser SET username=?,password=?,gender=?,email=?,userimageurl=? WHERE userid=?";
		Object[] obj=new Object[]{user.getUsername(),password,user.getGender(),user.getEmail(),user.getImage(),user.getUserid()};
		try{
			return jdbcTemplate.update(sql,obj);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}
	@Override
	public int changeUserEnable(int id) {
		
		String sql="UPDATE tbuser SET ismemoenabled= NOT ismemoenabled WHERE userid=?";
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
