package com.memo.app.services;

import com.memo.app.entities.Memo;
import com.memo.app.entities.User;

public interface IEmbededMemoService {
	public String listMemoByUserIdAndURL(int id,String url);
	public User memoLogin(String email,String password);
	public Boolean addMemo(Memo m);
}
