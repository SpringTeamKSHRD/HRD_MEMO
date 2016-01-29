package com.memo.app.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.memo.app.entities.Message;
import com.memo.app.repo.MessageDao;
import com.memo.app.services.MessageService;

@Service
@Lazy
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageDao messageDao;

	@Override
	public boolean saveMessage(List<Message> messages) {
		if(messageDao.saveMessage(messages).length>1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Message> getUserMessage(int userid) {
		return messageDao.getUserMessage(userid);
	}

	@Override
	public int getNumberMessage(int userid) {
		return messageDao.getNumberMessage(userid);
	}

	@Override
	public boolean changeIsView(int messageid) {
		if(messageDao.changeIsView(messageid)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean changeMessageIsViewed(int userid) {
		return messageDao.changeMessageIsViewed(userid);
	}

	@Override
	public List<Message> getOldMessage(int userid) {
		return messageDao.getOldMessage(userid);
	}

	@Override
	public int getAllNumberMessage(int userid) {
		return messageDao.getAllNumberMessage(userid);
	}

	@Override
	public List<Message> getOldMessage(int userid, int page, int limit) {
		return messageDao.getOldMessage(userid, page, limit);
	}

}
