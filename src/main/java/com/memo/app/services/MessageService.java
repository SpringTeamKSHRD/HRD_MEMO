package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Message;

public interface MessageService {
	public boolean saveMessage(List<Message> messages);
	public List<Message> getUserMessage(int userid);
	public int getNumberMessage(int userid);
    public boolean changeIsView(int messageid);
    public int getAllNumberMessage(int userid,int limit,int page);
    //sona 
    public boolean changeMessageIsViewed(int userid);
    public List<Message> getOldMessage(int userid);

}
