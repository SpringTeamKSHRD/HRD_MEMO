package com.memo.app.repo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.repo.IDashboardDao;
@Repository
public class DashboardDaoImpl implements IDashboardDao {
	
	@Autowired private JdbcTemplate jdbcTemplate;
	
	@Override
	@Transactional
	public String getDashboardData() {
		String sql="SELECT row_to_json (T) FROM ( SELECT (SELECT COUNT(*) FROM tbluser) AS totaluser, "
				+ "(SELECT COUNT (*) FROM memo.tbmemo where isenable=true and ispublic=true ) AS totalmemo, "
				+ "(SELECT COUNT (DISTINCT(DOMAIN)) FROM memo.tbmemo ) AS totalsite, "
				+ "(SELECT COUNT (*) FROM memo.tbreport ) AS totalreportlist ) T";
		String result= jdbcTemplate.queryForObject(sql, String.class);
		return result;
	}
}
