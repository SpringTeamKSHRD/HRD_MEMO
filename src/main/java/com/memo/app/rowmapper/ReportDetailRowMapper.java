package com.memo.app.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.memo.app.entities.Report;
public class ReportDetailRowMapper implements RowMapper<Report> {

	@Override
	public Report mapRow(ResultSet rs, int value) throws SQLException {
		Report rp=new Report();
		rp.setId(rs.getInt(1));
		rp.setReporterid(rs.getInt(2));
		rp.setReportername(rs.getString(3));
		rp.setReporterimage(rs.getString(4));
		rp.setDescription(rs.getString(5));
		rp.setReportdate(rs.getDate(6));
		rp.setMemoid(rs.getInt(7));
		rp.setMemotitle(rs.getString(8));
		rp.setMemocontent(rs.getString(9));
		rp.setOwnermemoid(rs.getInt(10));
		rp.setOwnermemoname(rs.getString(11));
		rp.setOwnermemoimage(rs.getString(12));
		rp.setMemodate(rs.getDate(13));
		rp.setDomain(rs.getString(14));
		rp.setUrl(rs.getString(15));
		return rp;
	}

}
