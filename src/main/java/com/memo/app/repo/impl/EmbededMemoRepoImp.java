package com.memo.app.repo.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.memo.app.entities.Memo;
import com.memo.app.entities.User;
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

	@Override
	@Transactional
	public Boolean login(String email, String password) {
		Session ses= sf.getCurrentSession();
		Criteria cr =  ses.createCriteria(User.class);
						User user=  (User) cr.add(Restrictions.eq("email", email))
						.uniqueResult();
		if(user!=null){
			if(new BCryptPasswordEncoder().matches(password, user.getPassword())){
				
				return true;
			}
			return false;
		}
		return false;
	}

}
