package com.memo.app.services;

import com.memo.app.entities.Memo;
import com.memo.app.entities.Report;
import com.memo.app.entities.User;

public interface IEmbededMemoService {
	public String listMemoByUserIdAndURL(int id,String url);
	public User memoLogin(String email,String password);
	public Boolean addMemo(Memo m);
	public Boolean deleteMemo(int id);
	public Boolean updateMemo(Memo m);
	public User RegisterUser(User m);
	public Boolean isExistedEmail(String email);
	public Boolean isReportedMemo(int memoid);
	public Boolean insertReport(Report rp);
}
