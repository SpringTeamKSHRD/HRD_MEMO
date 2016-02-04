package com.memo.app.repo.impl;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.memo.app.entities.HistoryMemo;
import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoSearch;
import com.memo.app.repo.MemoDao;
import com.memo.app.rowmapper.AdminMemoDetailRowMapper;
import com.memo.app.rowmapper.AdminMemoListRowMapper;
import com.memo.app.rowmapper.HistoryMemoRowMapper;
import com.memo.app.rowmapper.UserMemoRowMapper;

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
	public List<Memo> listMemo(MemoSearch memo) {
		try{
			if(memo.getColumn().equals("")){
				String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
							+"FROM memo.tbmemo WHERE userid=? AND isenable=true ORDER BY id DESC LIMIT ? OFFSET ?";
				    int begin=memo.getPage()*memo.getLimit()-memo.getLimit(); 
					return jdbcTemplate.query(sql,new Object[]{memo.getUserid(),memo.getLimit(),begin},
							new UserMemoRowMapper());
			}else{
				String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
						+"FROM memo.tbmemo WHERE userid=? "
						+ "AND isenable=true "
						+ "AND Lower("+memo.getColumn()+"::TEXT) LIKE ? ORDER BY id DESC LIMIT ? OFFSET ?";
				int begin=memo.getPage()*memo.getLimit()-memo.getLimit(); 
				return jdbcTemplate.query(sql,new Object[]{memo.getUserid()
														   ,memo.getSearch().toLowerCase()+"%"
														   ,memo.getLimit(),begin}
						,new UserMemoRowMapper());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean insertMemo(Memo memo) {
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
		String sql="UPDATE memo.tbmemo SET title=?,content=?,ispublic=? "
								      +"WHERE id=?;";
		Object[] obj=new Object[]{memo.getTitle(),memo.getContent(),
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
		String sql = "UPDATE memo.tbmemo SET isenable=?,ispublic=? WHERE id=?";
		try{
			int i = jdbcTemplate.update(sql, new Object[]{false,false,id});
			if (i > 0) return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Memo getMemo(int id) {
		System.out.println(id);
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
					+"FROM memo.tbmemo "
					+"WHERE id=?";
		try{
			return jdbcTemplate.queryForObject(sql, new Object[]{id},new UserMemoRowMapper());
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return null;
	}
	@Override
	public List<Memo> filterMemoByColumnName(String column_name,String value) {
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic"
					+" FROM memo.tbmemo "
					+" WHERE "+column_name
					+" LIKE ?"
					+" AND isenable=TRUE;";				
		try{
			return jdbcTemplate.query(sql, new Object[]{value+"%"},new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public List<HistoryMemo> listHistoryMemo(int memoid) {
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
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
				  +"FROM memo.tbmemo "
				  +"WHERE (date BETWEEN '"+sd+"' AND '"+ed+"') "
				  +"AND isenable=TRUE "
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
		String sql="SELECT COUNT(id)"
				  +"FROM memo.tbmemo"
				  +"WHERE userid=? AND ispublic=true;";
				
		try{
			return jdbcTemplate.queryForObject(sql, new Object[]{userid},Integer.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public Memo getMemoByUrl(String domain, String url, int userid) {
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
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic"
					+" FROM memo.tbmemo"
					+" WHERE ispublic=? AND isenable=TRUE"
					+" ORDER BY title";
		try{
			return jdbcTemplate.query(sql,new Object[]{privacy},new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public List<Memo> pluginGetMemoOwner(int userid, String url) {
		String sql="SELECT mm.id,mm.userid,mm.title,mm.content,mm.date,mm.ispublic,us.userimageurl,username "
				+ "FROM memo.tbmemo mm "
				+ "INNER JOIN public.tbluser us ON mm.userid=us.userid "
				+ "WHERE (mm.userid=? AND mm.url=? AND mm.isenable=true) ORDER BY mm.id DESC";
		Object[] obj=new Object[]{userid,url};
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
					mm.setUsername(rs.getString(8));
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
	public List<Memo> listMemo(boolean isenabled) {
		String sql="SELECT m.id,m.userid,m.title,m.content,m.domain, "
					+"m.url,m.date,m.isenable,m.ispublic ,u.username,u.userimageurl "
					+"FROM memo.tbmemo m inner join public.tbluser u on m.userid = u.userid "
					+"WHERE m.isenable=? "
					+"ORDER BY id DESC";
		try{
			return jdbcTemplate.query(sql, new Object[]{isenabled},new UserMemoRowMapper());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}		
	}
	@Override
	public List<Memo> pluginGetMemoPublic(int userid,String url) {
		String sql="SELECT mm.id,mm.userid,mm.title,mm.content,mm.date,mm.ispublic,us.userimageurl,username "
				+ "FROM memo.tbmemo mm "
				+ "INNER JOIN public.tbluser us ON mm.userid=us.userid "
				+ "WHERE (mm.ispublic=true AND mm.url=? AND mm.isenable=true AND mm.userid <> ?) ORDER BY mm.id DESC";
		Object[] obj=new Object[]{url,userid};
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
					mm.setUsername(rs.getString(8));
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
	public int getMemoNumber(MemoSearch memo) {
		try{
		if(memo.getColumn().equals("")){
			String sql="SELECT count(userid) FROM memo.tbmemo WHERE userid=? AND isenable=true";
			return jdbcTemplate.queryForObject(sql,new Object[]{memo.getUserid()},Integer.class);
		}else{
			String sql="SELECT count(userid) FROM memo.tbmemo WHERE userid=? AND isenable=true AND Lower("+memo.getColumn()+"::TEXT) LIKE ?";
			return jdbcTemplate.queryForObject(sql,new Object[]{memo.getUserid(),memo.getSearch().toLowerCase()+"%"},Integer.class);
		}
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}
	@Override
	public List<Memo> searchMemo(int limit, int offset, boolean isenabled, boolean ispublic, String column,
			String keyword) {
		String sql="SELECT m.id,m.userid,m.title,m.domain, "+
				"m.url,m.date,u.username,u.userimageurl,count(*) OVER() "+
				"FROM memo.tbmemo m inner join public.tbluser u on m.userid = u.userid "+
				"WHERE m.isenable=? AND m.ispublic=? AND "+column+" LIKE ? "+
				"ORDER BY id DESC LIMIT ? OFFSET ?";
		try{
			return jdbcTemplate.query(sql, new Object[]{isenabled,ispublic,"%"+keyword+"%",limit,offset},new AdminMemoListRowMapper());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}	
	}
	@Override
	public Memo getMemo1(int id) {
		String sql="SELECT m.id,m.userid,m.title,m.content,m.domain,m.url,m.date,m.isenable,m.ispublic,u.username,u.userimageurl "
					+"FROM memo.tbmemo m inner join public.tbluser u on m.userid = u.userid "
					+"WHERE id=?";
		try{
			return (Memo)jdbcTemplate.queryForObject(sql, new Object[]{id},new AdminMemoDetailRowMapper());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}	
	@Override
	public List<Memo> listMemo(int limit, int offset, boolean isenabled, boolean ispublic){		
		String sql="SELECT m.id,m.userid,m.title,m.domain, "+
					"m.url,m.date,u.username,u.userimageurl,count(*) OVER() "+
					"FROM memo.tbmemo m inner join public.tbluser u on m.userid = u.userid "+
					"WHERE m.isenable=? AND m.ispublic=? "+
					"ORDER BY id DESC LIMIT ? OFFSET ?";
		try{
			return jdbcTemplate.query(sql, new Object[]{isenabled,ispublic,limit,offset},new AdminMemoListRowMapper());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}		
	}
	@Override
	public List<Memo> listMemoNew(MemoSearch memo) {
		String sql="SELECT id,userid,title,content,domain,url,date,isenable,ispublic "
				+ "FROM memo.tbmemo WHERE userid=? AND Lower(title) LIKE ? AND Lower(domain) LIKE ? "
				+ "AND Lower(ispublic::TEXT) LIKE ? AND isenable=TRUE AND to_char(date,'YYYY-MM-DD') LIKE ? "
				+ "ORDER BY id DESC LIMIT ? OFFSET ?";
		int begin=memo.getPage()*memo.getLimit()-memo.getLimit();
		Object[] obj=new Object[]{memo.getUserid(),memo.getTitle()+"%",
									memo.getDomain()+"%",memo.getIspublic(),
									memo.getDate(),memo.getLimit(),begin};
		try{
			return jdbcTemplate.query(sql,obj,new UserMemoRowMapper());
		}catch(Exception ex){
			System.out.println("error");
		}
		return null;
	}
	@Override
	public int getMemoNumberNew(MemoSearch memo) {
		System.out.println(memo);
		String sql="SELECT count(userid) "
				+ "FROM memo.tbmemo WHERE userid=? AND Lower(title) LIKE ? AND Lower(domain) LIKE ? "
				+ "AND Lower(ispublic::TEXT) LIKE ? AND isenable=TRUE AND to_char(date,'YYYY-MM-DD') LIKE ?";
		int begin=memo.getPage()*memo.getLimit()-memo.getLimit();
		Object[] obj=new Object[]{memo.getUserid(),memo.getTitle()+"%",
									memo.getDomain()+"%",memo.getIspublic()+"%",
									memo.getDate()};
		try{
			return jdbcTemplate.queryForObject(sql,obj,Integer.class);
		}catch(Exception ex){
			System.out.println("error");
		}
		return 0;
	}
	
}
