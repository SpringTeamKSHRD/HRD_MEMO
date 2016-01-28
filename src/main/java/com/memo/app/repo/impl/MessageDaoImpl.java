package com.memo.app.repo.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.memo.app.entities.Message;
import com.memo.app.repo.MessageDao;

@Repository
public class MessageDaoImpl implements MessageDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public int[] saveMessage(final List<Message> messages) {
		String sql="INSERT INTO memo.tbmessage(userid,message_id,memoid) VALUES(?,?,?)";
			int[] inserts= jdbcTemplate.batchUpdate(sql,new BatchPreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement ps, int i) throws SQLException {
					Message msg=messages.get(i);
					ps.setInt(1, msg.getUserid());
					ps.setInt(2, msg.getMessageid());
					ps.setInt(3, msg.getMemoid());
				}
				
				@Override
				public int getBatchSize() {
					return messages.size();
				}
			});
			return inserts;
	}
	//for user's report.
	@Override
	public List<Message> getUserMessage(int userid) {
		String sql="SELECT ms.id,dfm.messsage,ms.date,ms.memoid"
				+" FROM memo.tbldefaultmessage dfm INNER JOIN memo.tbmessage ms"
				+" ON dfm.id=ms.message_id"
				+" WHERE userid=? AND isviewed=FALSE;";
		List<Message> messages=jdbcTemplate.query(sql,new Object[]{userid},new RowMapper<Message>(){
			@Override
			public Message mapRow(ResultSet rs, int i) throws SQLException {
				Message msg=new Message();
				msg.setId(rs.getInt(1));
				msg.setMessage(rs.getString(2));
				msg.setDate(rs.getDate(3));
				msg.setMemoid(rs.getInt(4));
				return msg;
			}
			
		});
		return messages;
	}
	@Override
	public int getNumberMessage(int userid) {
		String sql="SELECT count(userid) FROM memo.tbmessage WHERE isviewed=false AND userid=?";
		try{
			return jdbcTemplate.queryForObject(sql,new Object[]{userid},Integer.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int changeIsView(int messageid) {
		String sql="UPDATE memo.tbmessage SET isviewed=TRUE WHERE id=?";
		try{	
			return jdbcTemplate.update(sql,messageid);
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return 0;
	}
	@Override
	public boolean changeMessageIsViewed(int userid) {
		String sql="UPDATE memo.tbmessage SET isviewed=TRUE"
				+" WHERE isviewed=FALSE AND userid=?;";
		try{	
			int i=jdbcTemplate.update(sql,userid);
			if(i>0) return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return false;	
	}
	@Override
	public List<Message> getOldMessage(int userid) {
		String sql="SELECT ms.id,dfm.messsage,ms.date,ms.memoid"
				+" FROM memo.tbldefaultmessage dfm INNER JOIN memo.tbmessage ms"
				+" ON dfm.id=ms.message_id"
				+" WHERE userid=? ORDER BY ms.id DESC";
		try{
		List<Message> messages=jdbcTemplate.query(sql,new Object[]{userid},new RowMapper<Message>(){
			@Override
			public Message mapRow(ResultSet rs, int i) throws SQLException {
				Message msg=new Message();
				msg.setId(rs.getInt(1));
				msg.setMessage(rs.getString(2));
				msg.setDate(rs.getDate(3));
				msg.setMemoid(rs.getInt(4));
				return msg;
			}
		});
		return messages;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

}
