package com.memo.app.repo.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public String listByIdAndURL(int id,String url) {
		/*Session sess=sf.getCurrentSession();
		Criteria cr = sess.createCriteria(Memo.class);
				cr.add(Restrictions.eq("fullDomain", url));
				cr.add(Restrictions.disjunction()
						.add(Restrictions.eq("ispublic", true))
						.add(Restrictions.eq("userid",id)));
		return cr.list();*/
		String sql="select array_to_json(array_agg(row_to_json(t))) from (SELECT * FROM public.tbluser U INNER JOIN memo.tbmemo M ON u.userid = M .userid WHERE ( concat (M .domain_name, M .url) = ? AND u.userid = ? ) OR ( concat (M .domain_name, M .url) = ? AND M .ispublic = TRUE )) t";
		try {
			String result= jdbcTemplate.queryForObject(sql,new Object[]{url,id,url}, String.class);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	@Transactional
	public User login(String email, String password) {
		Session ses= sf.getCurrentSession();
		Criteria cr =  ses.createCriteria(User.class);
		User user=  (User) cr.add(Restrictions.eq("email", email)).uniqueResult();
		if(user!=null){
			if(new BCryptPasswordEncoder().matches(password, user.getPassword())){
				return user;
			}
			return null;
		}
		return null;
	}

	@Override
	public Boolean insert(Memo m) {
		Session sess = sf.getCurrentSession();
		sess.persist(m);
		return true;
			
	}

}
