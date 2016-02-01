package com.memo.app.config;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionConfig implements HttpSessionListener {
	   @Override
	    public void sessionCreated(HttpSessionEvent event) {
	        System.out.println("==== Session is created ====");
	        event.getSession().setMaxInactiveInterval(24*3600);
	    }
	 
	    @Override
	    public void sessionDestroyed(HttpSessionEvent event) {
	        System.out.println("==== Session is destroyed ====");
	    }
}
