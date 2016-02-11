package com.memo.app.config.security;

//import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.channel.ChannelProcessingFilter;

import com.memo.app.services.impl.UserSecurityServiceImpl;

@Configuration
/*
* indicates that the class can be used by the Spring IoC
* container as a source of bean definitions.
*/
@EnableWebSecurity
/*
* The @EnableWebSecurity annotation and WebSecurityConfigurerAdapter work
* together to provide web based security. 
*/
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
	UserSecurityServiceImpl userDetailsService;	
	
	@Autowired
	@Qualifier(value="ajaxAuthenticationSuccessHandler")
	private AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;
	
	@Autowired
	@Qualifier(value="ajaxAuthenticationFailureHandler")
	private AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {	
		auth.userDetailsService(userDetailsService)
			.passwordEncoder(passwordEncoder());
		
	}
	@Override
	public void configure(WebSecurity security) {
		security.ignoring().antMatchers("/resource/**");
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http
			.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/user/**","/plugin/**").hasAnyRole("Subscriber" , "Admin")
			.antMatchers("/admin/**", "/api/admin/**").hasRole("Admin");
		http
			.formLogin()
			.permitAll()
			.loginPage("/login")
			.usernameParameter("username")
			.passwordParameter("password")
			.successHandler(ajaxAuthenticationSuccessHandler)
			.failureHandler(ajaxAuthenticationFailureHandler);
		http
			.sessionManagement()
			.sessionAuthenticationErrorUrl("/login");
//			.maximumSessions(1)
//			.expiredUrl("/login")
//			.sessionRegistry(sessionRegistryImpl());
		http
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login?logout")
			.invalidateHttpSession(true)
			.deleteCookies("JESSIONID")
			.permitAll();
		http.headers().frameOptions().disable();
		http.csrf().disable();
		http.exceptionHandling().accessDeniedPage("/login");
	}

	@Bean
	protected SessionRegistry sessionRegistryImpl(){
		return new SessionRegistryImpl();
	}	
	
	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
	
	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder().encode("123456"));
		//System.out.println(new BCryptPasswordEncoder().matches("1", "$2a$10$cHHVTPtstZqd0wqhRXpobu0.m15YkxdcQVB5gw.6s9PgIWeF7PFU2"));
		//System.out.println(Base64.getUrlEncoder().encodeToString("1".getBytes()));
	}
}
