package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Message;

public interface MessageService {
	//admin page
	public boolean saveMessage(List<Message> messages);
	//other
	public List<Message> getUserMessage(int userid,int page,int limit);
	public int getNumberMessage(int userid);
    public boolean changeIsView(int messageid);
    public int getAllNumberMessage(int userid,String date);
    public List<Message> getOldMessage(int userid,int page,int limit,String date);
    public boolean deleteMessage(int id);
    //sona 
    public boolean changeMessageIsViewed(int userid);
    public List<Message> getOldMessage(int userid);

}
