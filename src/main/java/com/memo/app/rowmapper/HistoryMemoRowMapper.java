package com.memo.app.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.HistoryMemo;

public class HistoryMemoRowMapper implements RowMapper<HistoryMemo>{

	@Override
	public HistoryMemo mapRow(ResultSet rs, int rowNum) throws SQLException {
		HistoryMemo hism=new HistoryMemo();
		
		hism.setId(rs.getInt(1));
		hism.setMemoid(rs.getInt(2));
		hism.setTitle(rs.getString(3));
		hism.setContent(rs.getString(4));
		hism.setDate(rs.getDate(5));
		
		return hism;
	}

	
}
