package com.memo.app.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.memo.app.repo.IDashboardDao;
import com.memo.app.services.IDashboardService;
@Service
public class DashboardServiceImpl implements IDashboardService {
	@Autowired
	private IDashboardDao dashboard;
	
	@Override
	public String getDashboardInfo() {
		return dashboard.getDashboardData();
	}

}
