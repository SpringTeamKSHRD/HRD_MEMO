package com.memo.app.repo.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.memo.app.RowMapper.ReportDetailRowMapper;
import com.memo.app.RowMapper.ReportListRowMapper;
import com.memo.app.RowMapper.ReportNotificRowMapper;
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
		System.out.println("get report notification dao.");
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
						+ "m_u.ownermemo_image,m_u.memo_date, m_u.domain, m_u.url "
					+ "FROM memo.tbreport rp "
					+ "INNER JOIN public.tbluser us "
					+ "ON rp.reporterid=us.userid "
					+ "INNER JOIN(SELECT mm.id as mmid,mm.title as title,mm.content as content,"
						+ "us.userid as ownermemo_id,"
						+ "us.username as ownermemo_name,us.userimageurl as ownermemo_image, "
						+ "date(mm.date) as memo_date, mm.domain, mm.url "
						+ "FROM memo.tbmemo mm "
						+ "INNER JOIN public.tbluser us "
						+ "ON mm.userid=us.userid) as m_u "
						+ "ON m_u.mmid=rp.memoid "
						+ "WHERE rp.id=?";
		Object[] obj=new Object[]{id};
		Report report=jdbcTemplate.queryForObject(sql,obj,new ReportDetailRowMapper());
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
	public List<Report> getAllReport(int limit, int offset, boolean isblocked){
		String sql="SELECT	memo.tbreport.ID, memo.tbmemo.title, "+
				"memo.tbreport.description, memo.tbreport.DATE,count(*) OVER(), memo.tbmemo.domain, memo.tbmemo.url "+
				"FROM memo.tbmemo "+
				"INNER JOIN memo.tbreport ON memo.tbmemo.ID = memo.tbreport.memoid "+
				"where isblocked=? order by memo.tbreport.ID desc limit ? offset ?";
		List<Report> reports=jdbcTemplate.query(sql, new Object[]{isblocked,limit,offset},new ReportListRowMapper());
		return reports;
	}

	@Override
	public List<Report> searchReportByColumn(int limit, int offset, boolean isblocked, String column, String keyword) {
		String sql="SELECT	memo.tbreport.ID, memo.tbmemo.title, "+
				"memo.tbreport.description, memo.tbreport.DATE,count(*) OVER(), memo.tbmemo.domain, memo.tbmemo.url "+
				"FROM memo.tbmemo "+
				"INNER JOIN memo.tbreport ON memo.tbmemo.ID = memo.tbreport.memoid "+
				"where isblocked=? and "+ column +" LIKE ? order by memo.tbreport.ID desc limit ? offset ?";
		List<Report> reports=jdbcTemplate.query(sql, new Object[]{isblocked,"%"+keyword+"%",limit,offset},new ReportListRowMapper());
		return reports;
	}

	@Override
	public boolean updateReportFieldWithField(String columnUpdate, String columnLogic, Object keyUpdate, Object keyLogic){
		String sql = "UPDATE memo.tbreport SET "+ columnUpdate +"=? " + "WHERE "+columnLogic+" =?;";
		Object[] obj = new Object[] { keyUpdate, keyLogic};
		try {
			if (jdbcTemplate.update(sql, obj) > 0)	return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
