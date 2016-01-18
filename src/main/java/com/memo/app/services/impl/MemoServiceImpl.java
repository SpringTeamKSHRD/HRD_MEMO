package com.memo.app.services.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.memo.app.entities.HistoryMemo;
import com.memo.app.entities.Memo;
import com.memo.app.repo.impl.MemoDaoImpl;

@Service
@Lazy
public class MemoServiceImpl implements com.memo.app.services.MemoService{
	@Autowired
	private MemoDaoImpl memoDao;

	@Override
	public List<Memo> listMemo() {
		return memoDao.listMemo();
	}

	@Override
	public List<Memo> listMemo(int limit, int page) {
		return memoDao.listMemo(limit, page);
	}
	
	@Override
	public boolean insertMemo(Memo memo) {
		return memoDao.insertMemo(memo);
	}

	@Override
	public boolean updateMemo(Memo memo) {
		return memoDao.updateMemo(memo);
	}

	@Override
	public boolean deleteMemo(int id) {
		return memoDao.deleteMemo(id);
	}

	@Override
	public Memo getMemo(int id) {
		return memoDao.getMemo(id);
	}

	@Override
	public List<Memo> filterMemoByColumnName(String column_name,String value) {
		return memoDao.filterMemoByColumnName(column_name,value);
	}

	@Override
	public List<HistoryMemo> listHistoryMemo(int memoid) {
		return memoDao.listHistoryMemo(memoid);
	}

	@Override
	public List<Memo> filterMemoByDate(Object sd, Object ed) {
		return memoDao.filterMemoByDate(sd, ed);
	}

	@Override
	public int countColumn(Object column_name, Object value) {
		return memoDao.countColumn(column_name, value);
	}

	@Override
	public Memo getMemoByUrl(String domain, String url, int userid) {
		return memoDao.getMemoByUrl(domain, url, userid);		
	}

	@Override
	public List<Memo> filterMemoByPrivacy(boolean privacy) {
		return memoDao.filterMemoByPrivacy(privacy);
	}	
}