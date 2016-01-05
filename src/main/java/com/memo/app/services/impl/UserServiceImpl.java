package com.memo.app.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.memo.app.entities.UserSecurConfig;
import com.memo.app.repo.impl.UserDaoImpl;

@Service
public class UserServiceImpl  implements UserDetailsService{

	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserSecurConfig user = userDaoImpl.findUserByUserName(username);
		if (user == null) {
			System.out.println("User not found");
			throw new UsernameNotFoundException("User not found");
		}
		return user;
	}
	
	/*public UserDetails loadUserById(int id) throws UsernameNotFoundException {
		
		User user = userDaoImpl.loadUserById(id);
		if (user == null) {
			System.out.println("User not found");
			throw new UsernameNotFoundException("User not found");
		}
		return user;
	}
*/
}
