package com.memo.app.repo.impl;

import java.math.BigDecimal;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.repo.IDashboardDao;
@Repository
public class DashboardDaoImpl implements IDashboardDao {
	@Autowired
	private SessionFactory sf;
	
	
	@Override
	@Transactional
	public String getDashboardData() {
		Session sess = sf.getCurrentSession();
		Query q= sess.createSQLQuery("select count(a.userid),count(b.id)from tbluser a,tbmemo b");
		q.getReturnAliases();
		System.out.println(q.getReturnAliases());
		return "";
	}

}
