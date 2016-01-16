package com.memo.app.repo.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.memo.app.RowMapper.HistoryMemoRowMapper;
import com.memo.app.RowMapper.MemoRowMapper;
import com.memo.app.entities.HistoryMemo;
import com.memo.app.entities.Memo;
import com.memo.app.repo.MemoDao;

@Repository
public class MemoDaoImp implements MemoDao{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public MemoDaoImp(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<Memo> listMemo() {
		System.out.println("List memo dao.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
					+"FROM tbmemo";
		return jdbcTemplate.query(sql, new MemoRowMapper());
	}
	
	@Override
	public List<Memo> listMemo(int limit, int page) {
		System.out.println("list memo with pagination.");
		if(page<=0) page=1;
		int offset = limit * page - limit;
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
					+"FROM memo.tbmemo "
					+"ORDER BY id DESC "
					+"LIMIT ? OFFSET ?";				
		return jdbcTemplate.query(sql, new Object[]{limit,offset},new MemoRowMapper());
	}
	
	@Override
	public boolean insertMemo(Memo memo) {
		System.out.println("insert memo dao.");
		String sql="INSERT INTO memo.tbmemo(userid,title,content,domain,url,date,isenable,ispublic ) VALUES(?,?,?,?,?,?,?,?)";
		Object[] obj=new Object[]{memo.getUserid(),memo.getTitle(),memo.getContent(),memo.getDomain(),
								  memo.getUrl(),memo.getDate(),memo.isIsenable(),memo.isIspublic()};
		int i=jdbcTemplate.update(sql,obj);
		if(i>0) return true;
		else return false;
	}

	@Override
	public boolean updateMemo(Memo memo) {
		System.out.println("update memo dao.");
		String sql="UPDATE memo.tbmemo SET userid=?,title=?,content=?,ispublic=? "
								      +"WHERE id=?;";
		Object[] obj=new Object[]{memo.getUserid(),memo.getTitle(),memo.getContent(),
								  memo.isIspublic(),memo.getId()};
		int i=jdbcTemplate.update(sql,obj);
		if(i>0) return true;
		else return false;
    }

	@Override
	public boolean deleteMemo(int id) {
		System.out.println("delete memo dao.");
		String sql = "DELETE FROM tbmemo"
					 +"WHERE id=?;";
		int i = jdbcTemplate.update(sql, id);
		if (i > 0) return true;
		else return false;
	}

	@Override
	public Memo getMemo(int id) {
		System.out.println("get memo dao.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
					+"FROM memo.tbmemo "
					+"WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new Object[]{id},new MemoRowMapper());
	}
	@Override
	public List<Memo> filterMemoByColumnName(Object column_name,Object value) {
		System.out.println("filter memo dao.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
					+"FROM tbmemo"
					+"WHERE "+column_name
					+"LIKE ?";
		return jdbcTemplate.query(sql, new Object[]{"%"+value+"%"},new MemoRowMapper());
	}
	
	@Override
	public List<HistoryMemo> listHistoryMemo(int memoid) {
		System.out.println("list history memo dao.");
		String sql="SELECT id,memoid,title,content,date "
					+"FROM tbhistory "
					+"WHERE id=?";
		return jdbcTemplate.query(sql,new Object[]{memoid},new HistoryMemoRowMapper());
	}
	@Override
	public List<Memo> filterMemoByDate(Date sd, Date ed) {
		System.out.println("filter date meo.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
				  +"FROM tbmemo "
				  +"WHERE date BETWEEN ? AND ?";
		return jdbcTemplate.query(sql, new Object[]{sd,ed},new MemoRowMapper());
	}
	@Override
	public int countColumn(Object column_name, Object value) {
		System.out.println("count column.");
		String sql="SELECT COUNT("+column_name+") "
				  +"FROM tbmemo "
				  +"WHERE userid=?";
		return jdbcTemplate.queryForObject(sql, new Object[]{column_name,value},Integer.class);
	}
	@Override
	public int countPublicMemo(int userid) {
		System.out.println("count public memo.");
		String sql="SELECT COUNT(id)"
				  +"FROM tbmemo"
				  +"WHERE userid=? AND ispublic=true";
		return jdbcTemplate.queryForObject(sql, new Object[]{userid},Integer.class);
	}
	@Override
	public List<Memo> listMemoByUrl(String domain, String url, int userid) {
		System.out.println("list memo by url");
		String sql="SELECT	* FROM memo.tbmemo " +
					"WHERE DOMAIN = ? " +
						"AND url = ? " +
						"AND userid = ? " +
						"AND isenable = TRUE limit 1";
		return jdbcTemplate.query(sql,new Object[]{domain,url,userid},new MemoRowMapper());
	}	
}
