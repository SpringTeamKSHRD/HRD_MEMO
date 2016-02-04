package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoFilter;

public interface IMemoDao {
	public List<Memo> list(Memo m,int limit,int offset);
	public List<Memo> listWithPrivacy(Memo m,int limit,int offset);
	public List<String>listAllDomain();
	public Long count(MemoFilter filter);
	public Boolean delete(int id);
	public Boolean update(Memo m);
}
