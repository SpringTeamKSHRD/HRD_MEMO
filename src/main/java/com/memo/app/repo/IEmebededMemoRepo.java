package com.memo.app.repo;

import com.memo.app.entities.Memo;
import com.memo.app.entities.Report;
import com.memo.app.entities.User;
public interface IEmebededMemoRepo {
	public String listByIdAndURL(int id,String url);
	public User login(String email,String password);
	public Boolean insert(Memo m);
	public Boolean delete(int id);
	public Boolean update(Memo m);
	public User register(User u);
	public Boolean isExistEmail(String email);
	public Boolean isReported(int memoid);
	public Boolean insertReport(Report rp);
}