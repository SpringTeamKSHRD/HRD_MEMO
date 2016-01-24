package com.memo.app.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.Report;
public class ReportListRowMapper implements RowMapper<Report> {

	@Override
	public Report mapRow(ResultSet rs, int value) throws SQLException {
		Report rp=new Report();
		rp.setId(rs.getInt(1));
		rp.setMemotitle(rs.getString(2));
		rp.setDescription(rs.getString(3));
		rp.setReportdate(rs.getDate(4));
		return rp;
	}

}
