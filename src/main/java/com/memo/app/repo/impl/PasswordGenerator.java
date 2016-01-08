package com.memo.app.repo.impl;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordGenerator {
	public static void main(String[] args) {
		String password = "1"; 
	    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); 
	    String encodedPassword = passwordEncoder.encode(password);  
	    System.out.print(encodedPassword);
	}


}
