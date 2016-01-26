package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Message;

public interface MessageDao {
	public int[] saveMessage(List<Message> messages);
	public List<Message> getUserMessage(int userid);
	public int getNumberMessage(int userid);
    public int changeIsView(int messageid);
    //sona
    public boolean changeMessageIsViewed(int userid);
    public List<Message> getOldMessage(int userid);
}
