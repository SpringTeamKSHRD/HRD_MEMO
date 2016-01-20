package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Memo;
import com.memo.app.entities.User;
public interface IEmebededMemoRepo {
	public String listByIdAndURL(int id,String url);
	public User login(String email,String password);
}
