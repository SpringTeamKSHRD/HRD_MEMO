package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Report;

public interface ReportDao {
	public int saveReport(Report rp);
	public List<Report> getReportNotification();
	public List<Report> getAllReport(int limit, int offset, boolean isblock);
	public Report getReportDetail(int id);
	public int blockMemoReport(int id);
	public int numberReport();
}
