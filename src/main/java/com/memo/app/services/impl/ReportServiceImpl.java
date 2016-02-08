package com.memo.app.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.memo.app.entities.Report;
import com.memo.app.repo.ReportDao;
import com.memo.app.services.ReportService;

@Service
@Lazy
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao reportDao;
	
	//admin page	
	@Override
	public List<Report> listNotification() {
		return reportDao.listNotification();
	}
	
	@Override
	public List<Report> listReport(int limit, int page, boolean isblocked){
		//maximum 100 rows
		if(limit > 100) limit = 100;
		//minimum 10 rows
		if(limit < 10) limit = 10;
		//default is first page
		if(page < 1) page = 1;
		//calculate offset for database
		int offset = limit * page - limit;
		return reportDao.listReport(limit,offset,isblocked);
	}

	@Override
	public List<Report> searchReportByColumn(int limit, int page, boolean isblocked, String column, String keyword){
		//maximum 100 rows
		if(limit > 100) limit = 100;
		//minimum 10 rows
		if(limit < 10) limit = 10;
		//default is first page
		if(page < 1) page = 1;
		//calculate offset for database
		int offset = limit * page - limit;
		if(column.equals("title")) return reportDao.searchReportByColumn(limit,offset,isblocked,"memo.tbmemo.title",keyword);
		if(column.equals("description")) return reportDao.searchReportByColumn(limit,offset,isblocked,"memo.tbreport.description",keyword);
		if(column.equals("domain")) return reportDao.searchReportByColumn(limit,offset,isblocked,"memo.tbmemo.domain",keyword);
		return null;
	}

	@Override
	public Report getReportDetail(int id) {
		return reportDao.getReportDetail(id);
	}
	
	@Override
	public boolean disableReportByMemoId(int memoid) {
		return reportDao.disableReportByMemoId(memoid);
	}
	
	//other
	@Override
	public boolean saveReport(Report rp) {
        if(reportDao.saveReport(rp)>0){
        	return true;
        }else{
        	return false;
        }
	}

	@Override
	public boolean blockMemoReport(int id) {
		if(reportDao.blockMemoReport(id)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int numberReport() {
		return reportDao.numberReport();
	}

}
