package com.memo.app.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.User;

public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int index) throws SQLException {
		User user=new User();
		user.setUserid(rs.getInt(1));
		user.setUsername(rs.getString(2));
		user.setGender(rs.getString(3));
		user.setEmail(rs.getString(4));
		user.setRegisterdate(rs.getDate(5));
		user.setImage(rs.getString(6));
		user.setType(rs.getString(7));
		return user;
	}

}
