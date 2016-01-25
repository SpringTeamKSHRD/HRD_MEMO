package com.memo.app.services;

import java.util.List;

import com.memo.app.entities.HistoryMemo;
import com.memo.app.entities.Memo;

public interface MemoService {
	public List<Memo> listMemo();
	public List<Memo> listMemo(int limit, int page, boolean isenabled);	
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
	//Sona
	public List<Memo> listMemo(boolean isenabled);
	//Phalleak
	public List<Memo> pluginGetMemoOwner(int userid,String url);
	public List<Memo> pluginGetMemoPulic(int userid,String url);
	public boolean updateMemoContent(Memo memo);
	
}
