package com.memo.app.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.Memo;

public class MemoRowMapper implements RowMapper<Memo>{

	@Override
	public Memo mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		System.out.println("memo row mapper.");
		Memo memo=new Memo();
		memo.setId(rs.getInt(1));
		memo.setUserid(rs.getInt(2));
		memo.setTitlememo(rs.getString(3));
		memo.setContent(rs.getString(4));
		memo.setTitleurl(rs.getString(5));
		memo.setDomain(rs.getString(6));
		memo.setUrl(rs.getString(7));
		memo.setDate(rs.getDate(8));
		memo.setCategoryid(rs.getInt(9));
		memo.setIsenable(rs.getBoolean(10));
		memo.setIspublic(rs.getBoolean(11));
		
		return memo;
	}

}
