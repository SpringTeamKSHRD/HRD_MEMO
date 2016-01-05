package com.memo.app.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.User;

public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
