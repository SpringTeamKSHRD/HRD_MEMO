package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Memo;

public interface IEmbededMemoService {
	public List<Memo> listMemoByUserId(int id);
	public Boolean memoLogin(String email,String password);
}
