package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Message;

public interface MessageService {
	public boolean saveMessage(List<Message> messages);
	public List<Message> getUserMessage(int userid,int page,int limit);
	public int getNumberMessage(int userid);
    public boolean changeIsView(int messageid);
    public int getAllNumberMessage(int userid,String date);
    public List<Message> getOldMessage(int userid,int page,int limit,String date);
    //sona 
    public boolean changeMessageIsViewed(int userid);
    public List<Message> getOldMessage(int userid);

}
