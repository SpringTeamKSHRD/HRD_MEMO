package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Report;

public interface ReportService {
	public boolean saveReport(Report rp);
	public List<Report> getReportNotification();
	public List<Report> getAllReport(int limit, int page, boolean isblocked);
	public List<Report> searchReportByColumn(int limit, int page, boolean isblocked, String column, String keyword);
	public Report getReportDetail(int id);
	public boolean blockMemoReport(int id);
	public int numberReport();
}
