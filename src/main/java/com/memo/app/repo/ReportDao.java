package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Report;

public interface ReportDao {
	
	public int saveReport(Report rp);
	public List<Report> getReport();
	public Report getReportDetail(int id);
	public int blockMemo(int id);
}
