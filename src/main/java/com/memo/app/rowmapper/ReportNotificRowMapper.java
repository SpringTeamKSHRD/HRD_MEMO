package com.memo.app.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.Report;

public class ReportNotificRowMapper implements RowMapper<Report>{

	@Override
	public Report mapRow(ResultSet rs, int value) throws SQLException {
		Report rp=new Report();
		rp.setId(rs.getInt(1));
		rp.setReporterid(rs.getInt(2));
		rp.setReportername(rs.getString(3));
		rp.setReporterimage(rs.getString(4));
		rp.setReportdate(rs.getDate(5));
		return rp;
	}
	

}
