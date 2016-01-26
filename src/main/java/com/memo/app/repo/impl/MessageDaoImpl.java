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
		String sql="INSERT INTO memo.tbmessage(userid,messageid) VALUES(?,?)";
			int[] inserts= jdbcTemplate.batchUpdate(sql,new BatchPreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement ps, int i) throws SQLException {
					Message msg=messages.get(i);
					ps.setInt(1,msg.getUserid());
					ps.setInt(2, msg.getMessageid());
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
		/*String sql="SELECT msg.id,dmsg.message "
				+ "FROM memo.tbmessage msg "
				+ "INNER JOIN memo.tbdefualtmessage dmsg "
				+ "ON msg.messageid=dmsg.id "
				+ "WHERE msg.isviewed=FALSE AND msg.userid=?";*/
		String sql="SELECT ms.id,dfm.messsage"
				+" FROM memo.tbdefaultmessage dfm INNER JOIN memo.tbmessage ms"
				+" ON dfm.id=ms.message_id"
				+" WHERE userid=? AND isviewed=FALSE;";
		List<Message> messages=jdbcTemplate.query(sql,new Object[]{userid},new RowMapper<Message>(){
			@Override
			public Message mapRow(ResultSet rs, int i) throws SQLException {
				Message msg=new Message();
				msg.setId(rs.getInt(1));
				msg.setMessage(rs.getString(2));
				return msg;
			}
			
		});
		return messages;
	}
	@Override
	public int getNumberMessage(int userid) {
		String sql="SELECT count(userid) FROM memo.tbmessage WHERE isviewed=false AND userid=?";
		return jdbcTemplate.queryForObject(sql,new Object[]{userid},Integer.class);
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
		String sql="UPDATE memo.tbmessage SET isviewed=TRUE WHERE userid=?;";
		try{	
			int i=jdbcTemplate.update(sql,userid);
			if(i>0) return true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
		return false;	
	}

}
