package com.memo.app.services.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.memo.app.entities.HistoryMemo;
import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoSearch;
import com.memo.app.repo.MemoDao;
import com.memo.app.services.MemoService;

@Service
@Lazy
public class MemoServiceImpl implements MemoService{
	
	@Autowired
	private MemoDao memoDao;

	//admin page
	@Override
	public List<Memo> listMemo(int limit, int page, boolean isenabled, boolean ispublic){
		//maximum 100 rows
		if(limit > 100) limit = 100;
		//minimum 10 rows
		if(limit < 10) limit = 10;
		//default is first page
		if(page < 1) page = 1;
		//calculate offset for database
		int offset = limit * page - limit;
		//filter only memo that is public
		return memoDao.listMemo(limit, offset, isenabled, ispublic);
	}

	@Override
	public boolean deleteMemo(int id) {
		return memoDao.deleteMemo(id);
	}

	@Override
	public List<Memo> searchMemo(int limit, int page, boolean isenabled, boolean ispublic, String column,
			String keyword) {
		//maximum 100 rows
		if(limit > 100) limit = 100;
		//minimum 10 rows
		if(limit < 10) limit = 10;
		//default is first page
		if(page < 1) page = 1;
		//calculate offset for database
		int offset = limit * page - limit;
		//filter only memo that is public
		if(column.equals("title"))		return memoDao.searchMemo(limit, offset, isenabled, ispublic, "title", keyword);
		if(column.equals("domain"))		return memoDao.searchMemo(limit, offset, isenabled, ispublic, "domain", keyword);
		if(column.equals("username"))	return memoDao.searchMemo(limit, offset, isenabled, ispublic, "username", keyword);
		return null;
	}

	@Override
	public Memo getMemoDetail(int id) {
		return memoDao.getMemoDetail(id);
	}

	@Override
	public boolean toggleMemo(int id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	//other
	@Override
	public Memo getMemo(int id) {
		return memoDao.getMemo(id);
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

	@Override
	public List<Memo> pluginGetMemoOwner(int userid, String url) {
		return memoDao.pluginGetMemoOwner(userid, url);
	}	
	
	@Override
	public boolean updateMemoContent(Memo memo) {
		return memoDao.updateMemoContent(memo);
	}

	@Override
	public List<Memo> listMemo(boolean isenabled) {
		return memoDao.listMemo(isenabled);
	}

	@Override
	public List<Memo> pluginGetMemoPulic(int userid,String url) {
		return memoDao.pluginGetMemoPublic(userid,url);
	}

	@Override
	public int getMemoNumber(MemoSearch memo) {
		return memoDao.getMemoNumber(memo);
	}

	@Override
	public List<Memo> listMemoNew(MemoSearch memo) {
		return memoDao.listMemoNew(memo);
	}

	@Override
	public int getMemoNumberNew(MemoSearch memo) {
		return memoDao.getMemoNumberNew(memo);
	}	
	
	@Override
	public List<Memo> listMemo(MemoSearch memo) {
		return memoDao.listMemo(memo);
	}
}