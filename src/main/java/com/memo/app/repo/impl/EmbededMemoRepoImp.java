package com.memo.app.repo.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.entities.Memo;
import com.memo.app.repo.IEmebededMemoRepo;

@Repository
public class EmbededMemoRepoImp implements IEmebededMemoRepo {
	@Autowired
	private SessionFactory sf;
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Memo> listById(int id) {
		Session sess=sf.getCurrentSession();
		Criteria cr = sess.createCriteria(Memo.class);
				cr.add(Restrictions.eq("userid",id));
		return cr.list();
	}

}
