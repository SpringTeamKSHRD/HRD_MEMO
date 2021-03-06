package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Message;

public interface MessageDao {
	public int[] saveMessage(List<Message> messages);
	public List<Message> getUserMessage(int userid,int page,int limit);
	public int getNumberMessage(int userid);
    public int changeIsView(int messageid);
    public int getAllNumberMessage(int userid,String date);
    public List<Message> getOldMessage(int userid,int page,int limit,String date);
    public int deleteMessage(int id);
    //sona
    public boolean changeMessageIsViewed(int userid);
    public List<Message> getOldMessage(int userid);
}
