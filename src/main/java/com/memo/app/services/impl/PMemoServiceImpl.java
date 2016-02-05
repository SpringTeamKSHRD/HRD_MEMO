package com.memo.app.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.memo.app.entities.Memo;
import com.memo.app.entities.MemoFilter;
import com.memo.app.entities.Pagination;
import com.memo.app.repo.IMemoDao;
import com.memo.app.repo.impl.PMemoDaoImp;
import com.memo.app.services.IMemoService;

@Service
public class PMemoServiceImpl implements IMemoService {

	@Autowired
	private IMemoDao memoservice;
	
	@Override
	public List<Memo> listMemo(Memo m, int limit, int offset) {
		return memoservice.list(m, limit, offset);
	}

	@Override
	public List<String> listAllDomain() {
		return memoservice.listAllDomain();
	}

	@Override
	public List<Memo> listMemoWithPrivacy(Memo m, int limit, int offset) {
		return memoservice.listWithPrivacy(m, limit, offset);
	}
	
	@Override
	public Long count(MemoFilter filter) {
		return memoservice.count(filter);
	}
	@Override
	public Boolean deleteMemo(int id) {
		return memoservice.delete(id);
		
	}

	@Override
	public Boolean updateMemo(Memo m) {
		return memoservice.update(m);
	}

	@Override
	public List<Memo> listAllMemos(MemoFilter filter, Pagination pagination) {
		return memoservice.listAllMemos(filter, pagination);
	}

	@Override
	public String dashboardSummary(int userid) {
		return memoservice.dashboardSumary(userid);
	}

}
