package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Report;

public interface ReportDao {
	//admin page
	public List<Report> listNotification();
	public List<Report> listReport(int limit, int offset, boolean isblocked);
	public List<Report> searchReportByColumn(int limit, int offset, boolean isblocked, String column, String keyword);
	public Report getReportDetail(int id);		
	public boolean disableReportByMemoId(int memoid);
	//other
	public int saveReport(Report rp);
	public int blockMemoReport(int id);
	public int numberReport();
}
