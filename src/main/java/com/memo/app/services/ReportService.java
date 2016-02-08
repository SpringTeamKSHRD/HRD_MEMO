package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Report;

public interface ReportService {	
	//admin page
	public List<Report> listNotification();
	public List<Report> listReport(int limit, int page, boolean isblocked);
	public List<Report> searchReportByColumn(int limit, int page, boolean isblocked, String column, String keyword);
	public Report getReportDetail(int id);
	public boolean disableReportByMemoId(int memoid);
	//other
	public boolean saveReport(Report rp);			
	public boolean blockMemoReport(int id);
	public int numberReport();
}
