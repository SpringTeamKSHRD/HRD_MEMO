package com.memo.app.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.Memo;

public class AdminMemoListRowMapper implements RowMapper<Memo>{

	@Override
	public Memo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		//System.out.println("memo row mapper.");
		Memo memo=new Memo();
		memo.setId(rs.getInt(1));
		memo.setUserid(rs.getInt(2));
		memo.setTitle(rs.getString(3));
		memo.setDomain(rs.getString(4));
		memo.setUrl(rs.getString(5));
		memo.setDate(rs.getDate(6));	
		memo.setUsername(rs.getString(7));
		memo.setUserimage(rs.getString(8));
		memo.setCount(rs.getInt(9));
		return memo;
	}

}
