package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.HistoryMemo;
import com.memo.app.entities.Memo;

public interface MemoDao {
	public List<Memo> listMemo();
	public List<Memo> listMemo(int limit, int offset, boolean isenabled, boolean ispublic);
	public boolean insertMemo(Memo memo);
	public boolean updateMemo(Memo memo);
	public boolean deleteMemo(int id);
	public Memo getMemoByUrl(String domain, String url, int userid);
	public Memo getMemo(int id);
	public List<Memo> filterMemoByColumnName(String column_name,String value);
	public List<Memo> filterMemoByPrivacy(boolean privacy);
	public List<HistoryMemo> listHistoryMemo(int memoid);
	public List<Memo> filterMemoByDate(Object sd,Object ed);
	public int countColumn(Object column_name,Object value);
	public int countPublicMemo(int userid);
	//SONA
	public List<Memo> listMemo(boolean isenabled);
	//PHALLEAK
	public List<Memo> pluginGetMemoOwner(int userid,String url);
	public List<Memo> pluginGetMemoPublic(int userid,String url);
	public boolean updateMemoContent(Memo memo);
	
}
