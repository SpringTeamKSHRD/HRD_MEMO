package com.memo.app.repo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.memo.app.RowMapper.ReportNotificRowMapper;
import com.memo.app.RowMapper.ReportRowMapper;
import com.memo.app.entities.Report;
import com.memo.app.repo.ReportDao;

@Repository
public class ReportDaoImpl implements ReportDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int saveReport(Report rp) {
		String sql="INSERT INTO memo.tbreport(reporterid,memoid,description) VALUES(?,?,?)";
		Object[] obj=new Object[]{rp.getReporterid(),rp.getMemoid(),rp.getDescription()};
		return jdbcTemplate.update(sql,obj);
	}

	@Override
	public List<Report> getReportNotification() {
		String sql="SELECT rp.id,rp.reporterid,us.username,us.userimageurl,date(rp.date) "
				+ "FROM memo.tbreport rp "
				+ "INNER JOIN public.tbluser us "
				+ "ON	rp.reporterid=us.userid "
				+ "WHERE rp.isblocked=FALSE";
		List<Report> reports=jdbcTemplate.query(sql,new ReportNotificRowMapper());
		return reports;
	}

	@Override
	public Report getReportDetail(int id) {
		String sql="SELECT rp.id,rp.reporterid as reporter_id,us.username as reporter_name,"
						+ "us.userimageurl as reporter_image,rp.description,date(rp.date),"
						+ "rp.memoid as mem_id,m_u.title,m_u.content,m_u.ownermemo_id,m_u.ownermemo_name,"
						+ "m_u.ownermemo_image,m_u.memo_date "
					+ "FROM memo.tbreport rp "
					+ "INNER JOIN public.tbluser us "
					+ "ON rp.reporterid=us.userid "
					+ "INNER JOIN(SELECT mm.id as mmid,mm.titlememo as title,mm.content as content,"
						+ "us.userid as ownermemo_id,"
						+ "us.username as ownermemo_name,us.userimageurl as ownermemo_image"
						+ ",date(mm.date) as memo_date "
						+ "FROM memo.tbmemo mm "
						+ "INNER JOIN public.tbluser us "
						+ "ON mm.userid=us.userid) as m_u "
						+ "ON m_u.mmid=rp.memoid "
						+ "WHERE rp.id=?";
		Object[] obj=new Object[]{id};
		Report report=jdbcTemplate.queryForObject(sql,obj,new ReportRowMapper());
		return report;
	}

	@Override
	public int blockMemoReport(int id) {
		String sql="UPDATE memo.tbreport SET isblocked=true WHERE id=?";
		try{
			return jdbcTemplate.update(sql,id);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}
	@Override
	public int numberReport() {
		String sql="SELECT count(id) as report_total FROM memo.tbreport WHERE isblocked=FALSE";
		return jdbcTemplate.queryForObject(sql,Integer.class);
	}

	@Override
	public List<Report> getAllReport() {
		String sql="SELECT rp.id,rp.reporterid,us.username,us.userimageurl,date(rp.date) "
				+ "FROM memo.tbreport rp "
				+ "INNER JOIN public.tbluser us "
				+ "ON	rp.reporterid=us.userid";
		List<Report> reports=jdbcTemplate.query(sql,new ReportNotificRowMapper());
		return reports;
	}
	

}
