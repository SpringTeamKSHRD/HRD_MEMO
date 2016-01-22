package com.memo.app.repo;

import com.memo.app.entities.Memo;
import com.memo.app.entities.User;
public interface IEmebededMemoRepo {
	public String listByIdAndURL(int id,String url);
	public User login(String email,String password);
	public Boolean insert(Memo m);
	public Boolean delete(int id);
	public Boolean update(Memo m);
	public Boolean register(User u);
}
