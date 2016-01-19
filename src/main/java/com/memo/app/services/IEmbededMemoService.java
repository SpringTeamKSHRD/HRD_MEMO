package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Memo;
import com.memo.app.entities.User;

public interface IEmbededMemoService {
	public List<Memo> listMemoByUserIdAndURL(int id,String url);
	public User memoLogin(String email,String password);
}
