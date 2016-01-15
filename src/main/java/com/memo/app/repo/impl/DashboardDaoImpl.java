package com.memo.app.repo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.repo.IDashboardDao;
@Repository
public class DashboardDaoImpl implements IDashboardDao {
private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public DashboardDaoImpl(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	
	@Override
	@Transactional
	public String getDashboardData() {
		String sql="SELECT row_to_json (T) FROM ( SELECT (SELECT COUNT(*) FROM tbluser) AS totaluser, "
				+ "(SELECT COUNT(*) FROM memo.tbmemo) AS totalmemo, ( SELECT COUNT (DISTINCT(DOMAIN)) FROM memo.tbmemo ) AS totalsite, "
				+ "( SELECT COUNT (*) FROM memo.tbreport ) AS totalreportlist, "
				+ "( SELECT COUNT (*) FROM memo.tbreport WHERE isblocked = FALSE ) AS unreportedlist ) T";
		String result= jdbcTemplate.queryForObject(sql, String.class);
		System.out.println(result);
		return result;
	}

}
