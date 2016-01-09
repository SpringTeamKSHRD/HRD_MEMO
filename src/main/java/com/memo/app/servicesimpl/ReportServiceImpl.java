package com.memo.app.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.memo.app.entities.Report;
import com.memo.app.repo.impl.ReportDaoImpl;
import com.memo.app.services.ReportSevice;

@Service
@Lazy
public class ReportServiceImpl implements ReportSevice {
	@Autowired
	private ReportDaoImpl reportDao;

	@Override
	public boolean saveReport(Report rp) {
        if(reportDao.saveReport(rp)>0){
        	return true;
        }else{
        	return false;
        }
	}

	@Override
	public List<Report> getReportNotification() {
		return reportDao.getReportNotification();
	}
	@Override
	public Report getReportDetail(int id) {
		return reportDao.getReportDetail(id);
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
	@Override
	public List<Report> getAllReport() {
		return reportDao.getAllReport();
	}

}
