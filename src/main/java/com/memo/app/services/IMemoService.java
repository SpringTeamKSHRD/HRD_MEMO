package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoFilter;
import com.memo.app.entities.Pagination;

public interface IMemoService {
	public List<Memo> listMemo(Memo m,int limit,int offset);
	public List<Memo> listMemoWithPrivacy(Memo m,int limit,int offset);
	public List<String> listAllDomain(int userid);
	public Long count(MemoFilter filter);
	public Boolean deleteMemo(int id);
	public Boolean updateMemo(Memo m);
	public List<Memo> listAllMemos(MemoFilter filter, Pagination pagination);
	public String dashboardSummary(int userid);
}
