package com.memo.app.repo.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoFilter;
import com.memo.app.entities.Pagination;
import com.memo.app.repo.IMemoDao;

@Repository
public class PMemoDaoImp implements IMemoDao {
	
	@Autowired
	private SessionFactory sf;
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Memo> list(Memo m,int limit,int offset) {
		Session sess= sf.getCurrentSession();
		Criteria cr = sess.createCriteria(Memo.class);
				 cr.add(Restrictions.eq("userid",m.getUserid()));
				 cr.add(Restrictions.like("domainName", m.getDomain(), MatchMode.ANYWHERE).ignoreCase());
				 cr.add(Restrictions.like("title", m.getTitle(), MatchMode.ANYWHERE).ignoreCase());
				 cr.add(Restrictions.eq("isenable", true));
				 cr.addOrder(Order.desc("date"));
				 cr.setFirstResult(0);
				 cr.setMaxResults(limit);
				 
		return cr.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<String> listAllDomain(int userid) {
		Session sess= sf.getCurrentSession();
		Criteria cr = sess.createCriteria(Memo.class);
			cr.setProjection(Projections.distinct(Projections.property("domainName")));
			cr.add(Restrictions.eq("userid", userid));
		return cr.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Memo> listWithPrivacy(Memo m, int limit, int offset) {
		Session sess= sf.getCurrentSession();
		Criteria cr = sess.createCriteria(Memo.class);
				 cr.add(Restrictions.eq("userid",m.getUserid()));
				 cr.add(Restrictions.like("domainName", m.getDomain(), MatchMode.ANYWHERE).ignoreCase());
				 cr.add(Restrictions.like("title", m.getTitle(), MatchMode.ANYWHERE).ignoreCase());
				 cr.add(Restrictions.eq("isenable", true));
				 cr.add(Restrictions.eq("ispublic", m.isIspublic()));
				 cr.addOrder(Order.desc("date"));
				 cr.setFirstResult(0);
				 cr.setMaxResults(limit);
				 return cr.list();	 
	}

	@Override
	@Transactional
	public Long count(MemoFilter filter) {
		Session session = sf.getCurrentSession();
		Query query = session.createQuery(
				  "SELECT COUNT(M.title) "
				+ "FROM Memo M "
				+ "WHERE LOWER(M.title) LIKE :title "
				+ "AND LOWER(M.domainName) LIKE :domain "
				+ "AND LOWER(CAST(M.ispublic AS string)) LIKE :public "
				+ "AND M.isenable = true "
				+ "AND userid = :userId ");
		query.setParameter("title",  "%" + filter.getTitle().toLowerCase() + "%");
		query.setParameter("domain", "%" + filter.getDomainName().toLowerCase() + "%");
		query.setParameter("public", "%" + filter.getIsPublic().toLowerCase()+ "%");
		query.setParameter("userId", filter.getUserId());
		Long total = (Long)query.uniqueResult();
		return total;
	}

	@Override
	@Transactional
	public Boolean delete(int id) {
		try {
			Session sess = sf.getCurrentSession();
			Memo memo = sess.load(Memo.class, id);
			memo.setIsenable(false);
			sess.update(memo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	@Transactional
	public Boolean update(Memo m) {
		try {
			Session sess = sf.getCurrentSession();
			m.setDate(new Date());
			sess.update(m);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Memo> listAllMemos(MemoFilter filter, Pagination pagination) {
		Session sess= sf.getCurrentSession();
		Criteria cr = sess.createCriteria(Memo.class);
				 cr.add(Restrictions.eq("userid",filter.getUserId()));
				 cr.add(Restrictions.like("domainName", filter.getDomainName(), MatchMode.ANYWHERE).ignoreCase());
				 cr.add(Restrictions.like("title", filter.getTitle(), MatchMode.ANYWHERE).ignoreCase());
				 cr.add(Restrictions.eq("isenable", true));
				 cr.add(Restrictions.sqlRestriction("ispublic::TEXT LIKE '" + "%" +filter.getIsPublic().toLowerCase() +"%'"));
				 cr.addOrder(Order.desc("date"));
				 cr.setFirstResult(pagination.offset());
				 cr.setMaxResults(pagination.getPerPage());
				 return cr.list();
	}

	@Override
	public String dashboardSumary(int userid) {
		String sql="SELECT row_to_json (T) FROM ( SELECT ( SELECT COUNT (*) FROM memo.tbmemo WHERE userid = ? AND isenable = TRUE ) AS totalmemo, ( SELECT COUNT (*) FROM memo.tbmemo WHERE isenable = TRUE AND ispublic = TRUE AND userid = ? ) AS publicmemo, ( SELECT COUNT (DISTINCT(DOMAIN)) FROM memo.tbmemo WHERE isenable = TRUE AND userid =? ) AS totalsite, ( SELECT COUNT (*) FROM memo.tbmemo WHERE isenable = TRUE AND ispublic = FALSE AND userid = ? ) AS privatememo ) T";
		String result= jdbctemplate.queryForObject(sql,new Object[]{userid,userid,userid,userid}, String.class);
		System.out.println(result);
		return result;
	}
}
