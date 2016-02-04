package com.memo.app.repo.impl;

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
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoFilter;
import com.memo.app.entities.User;
import com.memo.app.repo.IMemoDao;

@Repository
public class PMemoDaoImp implements IMemoDao {
	
	@Autowired
	private SessionFactory sf;
	
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
	public List<String> listAllDomain() {
		Session sess= sf.getCurrentSession();
		Criteria cr = sess.createCriteria(Memo.class);
			cr.setProjection(Projections.distinct(Projections.property("domainName")));
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
		String isPublic = "";
		if(filter.getHasPublic()){
			isPublic = " AND M.ispublic = :public";
		}
		Query query = session.createQuery("SELECT COUNT(*) FROM Memo M WHERE LOWER(M.title) LIKE :title AND LOWER(M.domainName) LIKE :domain "+ isPublic);
		query.setParameter("title", "%" + filter.getTitle().toLowerCase() + "%");
		query.setParameter("domain", "%" + filter.getWebsite().toLowerCase() + "%");
		if(filter.getHasPublic()){
			query.setParameter("public", filter.isPublic());
		}
		Long total = (Long)query.uniqueResult();
		return total;
	}
	
	

}
