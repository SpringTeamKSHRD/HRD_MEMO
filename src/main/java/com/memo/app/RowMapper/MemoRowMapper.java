package com.memo.app.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.Memo;

public class MemoRowMapper implements RowMapper<Memo>{

	@Override
	public Memo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		//System.out.println("memo row mapper.");
		Memo memo=new Memo();
		memo.setId(rs.getInt(1));
		memo.setUserid(rs.getInt(2));
		memo.setTitle(rs.getString(3));
		memo.setContent(rs.getString(4));
		memo.setDomain(rs.getString(5));
		memo.setUrl(rs.getString(6));
		memo.setDate(rs.getDate(7));
		memo.setIsenable(rs.getBoolean(8));
		memo.setIspublic(rs.getBoolean(9));		
		return memo;
	}

}
