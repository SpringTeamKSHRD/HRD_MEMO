package com.memo.app.repo.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.memo.app.RowMapper.UserRowMapper;
import com.memo.app.entities.User;
import com.memo.app.repo.UserDao;

@Repository
public class UserDaoRepoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int saveUser(User user) {
		if (this.getEmail(user.getEmail())=="") {
			String sql = "INSERT INTO public.tbluser(username,password,gender,email,usertypeid,universityid,departmentid,userimageurl)"
					+ " VALUES(?,?,?,?,?,?,?,?)";
			String password = new BCryptPasswordEncoder().encode(user.getPassword());
			Object[] obj = new Object[] { user.getUsername(), password, user.getGender(), user.getEmail(), 2, 36, 12,user.getImage() };
			try {
				return jdbcTemplate.update(sql, obj);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
		}
		return 0;
	}

	@Override
	public int updateUser(User user) {
		String password = new BCryptPasswordEncoder().encode(user.getPassword());
		String sql = "UPDATE tbluser SET username=?,password=?,gender=?,email=?,userimageurl=? WHERE userid=?";
		Object[] obj = new Object[] { user.getUsername(), password, user.getGender(), user.getEmail(), user.getImage(),
				user.getUserid() };
		try {
			return jdbcTemplate.update(sql, obj);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return 0;
	}	

	@Override
	public int changeUserEnable(int id) {
		String sql = "UPDATE tbuser SET ismemoenabled= NOT ismemoenabled WHERE userid=?";
		try {
			return jdbcTemplate.update(sql, id);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return 0;
	}

	@Override
	public List<User> getUserList() {
		try{
		String sql = "SELECT us.userid,us.username,us.gender,us.email,date(us.registerdate),us.userimageurl,ut.usertypename,us.ismemoenabled "
				 + "FROM public.tbluser us " + "INNER JOIN public.tblusertype ut " + "ON us.usertypeid=ut.usertypeid";
		List<User> users = jdbcTemplate.query(sql, new UserRowMapper());
		return users;
		}catch(Exception ex){
			System.out.println("UserDaoRepoImpl error getUsertList()");
		}
		return null;
	}

	@Override
	public List<User> searchUser(String name) {
		String sql = "SELECT us.userid,us.username,us.gender,us.email,date(us.registerdate),us.userimageurl,ut.usertypename,us.ismemoenabled "
				+ "FROM public.tbluser us " + "INNER JOIN public.tblusertype ut " + "ON us.usertypeid=ut.usertypeid "
				+ "WHERE us.username=?";
		List<User> users = jdbcTemplate.query(sql, new Object[] { name }, new UserRowMapper());
		return users;
	}

	@Override
	public List<User> searchUser(int id) {
		String sql = "SELECT us.userid,us.username,us.gender,us.email,date(us.registerdate),us.userimageurl,ut.usertypename,us.ismemoenabled "
				+ "FROM public.tbluser us " + "INNER JOIN public.tblusertype ut " + "ON us.usertypeid=ut.usertypeid "
				+ "WHERE us.userid=?";
		try{
		List<User> users = jdbcTemplate.query(sql, new Object[] { id }, new UserRowMapper());
		return users;
		}catch(Exception ex){
			
		}
		return null;
	}

	@Override
	public String getEmail(String email) {
		String sql = "SELECT email FROM public.tbluser WHERE email LIKE ?";
		try{
		String result = jdbcTemplate.queryForObject(sql, new Object[] { email }, String.class);
		return result;
		}catch(Exception ex){
			System.out.println("UserDaoRepoImpl error getEmail(email)");
		}
		return "";
	}

	@Override
	public User getUserDialInfo(String emial) {
		
		String sql="SELECT userid,username,password,gender,email,phonenumber,dateofbirth,userimageurl FROM public.tbluser WHERE email LIKE ?";
		User user=jdbcTemplate.queryForObject(sql,new Object[]{emial},new RowMapper<User>(){
			@Override
			public User mapRow(ResultSet rs, int i) throws SQLException {
				User user=new User();
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setGender(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setPhone(rs.getString(6));
				user.setDob(rs.getDate(7));
				user.setImage(rs.getString(8));
				return user;
			}
		});
		return user;
	}

	@Override
	public boolean updateUser1(User user) {
		System.out.println(user.getPhone());
		String sql = "UPDATE tbluser SET username=?,gender=?,phonenumber=?,email=?,userimageurl=? WHERE userid=?";
		Object[] obj = new Object[] { user.getUsername(), user.getGender(), user.getPhone(),user.getEmail(), user.getImage(),user.getUserid() };
		try {
			int i=jdbcTemplate.update(sql, obj);
			if(i>0) return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
		return false;
	}
}
