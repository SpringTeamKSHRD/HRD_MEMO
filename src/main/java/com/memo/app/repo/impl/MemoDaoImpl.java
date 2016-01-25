package com.memo.app.repo.impl;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.memo.app.RowMapper.AdminMemoRowMapper;
import com.memo.app.RowMapper.HistoryMemoRowMapper;
import com.memo.app.RowMapper.UserMemoRowMapper;
import com.memo.app.entities.HistoryMemo;
import com.memo.app.entities.Memo;
import com.memo.app.repo.MemoDao;

@Repository
public class MemoDaoImpl implements MemoDao{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public MemoDaoImpl(JdbcTemplate jdbcTemplate){
		this.jdbcTemplate=jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<Memo> listMemo() {
		System.out.println("List memo dao.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
					+"FROM memo.tbmemo";
		try{
			return jdbcTemplate.query(sql, new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<Memo> listMemo(int limit, int offset, boolean isenabled, boolean ispublic){		
		String sql="SELECT m.id,m.userid,m.title,m.content,m.domain, "+
					"m.url,m.date,m.isenable,m.ispublic ,u.username,u.userimageurl "+
					"FROM memo.tbmemo m inner join public.tbluser u on m.userid = u.userid "+
					"WHERE m.isenable=? AND m.ispublic=? "+
					"ORDER BY id DESC LIMIT ? OFFSET ?";
		try{
			return jdbcTemplate.query(sql, new Object[]{isenabled,ispublic,limit,offset},new AdminMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}		
	}
	
	@Override
	public boolean insertMemo(Memo memo) {
		System.out.println("insert memo dao.");
		String sql="INSERT INTO memo.tbmemo(userid,title,content,domain,url,isenable,ispublic ) VALUES(?,?,?,?,?,?,?)";
		Object[] obj=new Object[]{memo.getUserid(),memo.getTitle(),memo.getContent(),memo.getDomain(),
								  memo.getUrl(),memo.isIsenable(),memo.isIspublic()};
		try{
			int i=jdbcTemplate.update(sql,obj);
			if(i>0) return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateMemo(Memo memo) {
		System.out.println("update memo dao.");
		String sql="UPDATE memo.tbmemo SET userid=?,title=?,content=?,ispublic=? "
								      +"WHERE id=?;";
		Object[] obj=new Object[]{memo.getUserid(),memo.getTitle(),memo.getContent(),
								  memo.isIspublic(),memo.getId()};
		try{
			int i=jdbcTemplate.update(sql,obj);
			if(i>0) return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
    }

	@Override
	public boolean deleteMemo(int id) {
		System.out.println("delete memo dao.");
		String sql = "UPDATE memo.tbmemo SET isenable=? WHERE id=?";
		try{
			int i = jdbcTemplate.update(sql, new Object[]{false,id});
			if (i > 0) return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Memo getMemo(int id) {
		System.out.println("get memo dao.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
					+"FROM memo.tbmemo "
					+"WHERE id=?";
		try{
			return (Memo)jdbcTemplate.queryForObject(sql, new Object[]{id},new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Memo> filterMemoByColumnName(String column_name,String value) {
		System.out.println("filter memo dao.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic"
					+" FROM memo.tbmemo "
					+" WHERE "+column_name
					+" LIKE ?";
		try{
			return jdbcTemplate.query(sql, new Object[]{value+"%"},new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<HistoryMemo> listHistoryMemo(int memoid) {
		System.out.println("list history memo dao.");
		String sql="SELECT id,memoid,title,content,date "
					+"FROM memo.tbhistory "
					+"WHERE id=?";
		try{
			return jdbcTemplate.query(sql,new Object[]{memoid},new HistoryMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<Memo> filterMemoByDate(Object sd, Object ed) {
		System.out.println("filter date meo.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
				  +"FROM memo.tbmemo "
				  +"WHERE date BETWEEN '"+sd+"' AND '"+ed+"' "
				  +"ORDER BY date ASC";
		try{
			return jdbcTemplate.query(sql,new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public int countColumn(Object column_name, Object value) {
		System.out.println("count column.");
		String sql="SELECT COUNT("+column_name+") "
				  +"FROM memo.tbmemo "
				  +"WHERE userid=?";
		try{
			return jdbcTemplate.queryForObject(sql, new Object[]{column_name,value},Integer.class);
		}catch(Exception  e){
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int countPublicMemo(int userid) {
		System.out.println("count public memo.");
		String sql="SELECT COUNT(id)"
				  +"FROM memo.tbmemo"
				  +"WHERE userid=? AND ispublic=true";
				
		try{
			return jdbcTemplate.queryForObject(sql, new Object[]{userid},Integer.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public Memo getMemoByUrl(String domain, String url, int userid) {
		System.out.println("get memo by url");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic FROM memo.tbmemo " +
					"WHERE DOMAIN LIKE ? " +
						"AND url LIKE ? " +
						"AND userid = ? " +
						"AND isenable = TRUE ";
		try{
			return jdbcTemplate.queryForObject(sql,new Object[]{domain,url,userid},new UserMemoRowMapper());
		}catch(Exception e){
		}
		return null;

	}
	@Override
	public List<Memo> filterMemoByPrivacy(boolean privacy) {
		System.out.println("filter memo dao.");
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic"
					+" FROM memo.tbmemo"
					+" WHERE ispublic=?"
					+" ORDER BY title";
		try{
			return jdbcTemplate.query(sql,new Object[]{privacy},new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Memo> pluginGetMemo(int userid, String url) {
		String sql="SELECT mm.id,mm.userid,mm.title,mm.content,mm.date,mm.ispublic,us.userimageurl "
				+ "FROM memo.tbmemo mm "
				+ "INNER JOIN public.tbluser us ON mm.userid=us.userid "
				+ "WHERE (mm.userid=? AND mm.url=? AND mm.isenable=true) OR (mm.ispublic=true AND mm.url=? AND mm.isenable=true) ORDER BY mm.id DESC";
		Object[] obj=new Object[]{userid,url,url};
		try{
			List<Memo> memos=jdbcTemplate.query(sql,obj,new RowMapper<Memo>(){

				@Override
				public Memo mapRow(ResultSet rs, int i) throws SQLException {
					Memo mm=new Memo();
					mm.setId(rs.getInt(1));
					mm.setUserid(rs.getInt(2));
					mm.setTitle(rs.getString(3));
					mm.setContent(rs.getString(4));
					mm.setDate(rs.getDate(5));
					mm.setIspublic(rs.getBoolean(6));
					mm.setUserimage(rs.getString(7));
					return mm;
				}
			});
			return memos;
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return null;
	}
	@Override
	public boolean updateMemoContent(Memo memo) {
		System.out.println("update memo dao.");
		String sql="UPDATE memo.tbmemo SET content=?,ispublic=? "
								      +"WHERE id=?;";
		Object[] obj=new Object[]{memo.getContent(),memo.isIspublic(),memo.getId()};
		try{
			int i=jdbcTemplate.update(sql,obj);
			if(i>0) return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	@Override
	public List<Memo> listMemo(int limit, boolean isenabled) {
		String sql="SELECT m.id,m.userid,m.title,m.content,m.domain, "+
				"m.url,m.date,m.isenable,m.ispublic ,u.username,u.userimageurl "+
				"FROM memo.tbmemo m inner join public.tbluser u on m.userid = u.userid "+
				"WHERE m.isenable=? "+
				"ORDER BY id DESC LIMIT ? OFFSET 0";
		try{
			return jdbcTemplate.query(sql, new Object[]{isenabled,limit},new AdminMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}		
	}
}
