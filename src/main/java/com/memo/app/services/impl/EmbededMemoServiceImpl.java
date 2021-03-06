package com.memo.app.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.memo.app.entities.Memo;
import com.memo.app.entities.Report;
import com.memo.app.entities.User;
import com.memo.app.repo.IEmebededMemoRepo;
import com.memo.app.services.IEmbededMemoService;

@Service
public class EmbededMemoServiceImpl implements IEmbededMemoService {
	@Autowired
	private IEmebededMemoRepo embededMemoRepo;
	
	@Override
	public String listMemoByUserIdAndURL(int id,String url) {
		return embededMemoRepo.listByIdAndURL(id,url);
	}

	@Override
	public User memoLogin(String email, String password) {
		return embededMemoRepo.login(email, password);
	}

	@Override
	public Boolean addMemo(Memo m) {
		
		return embededMemoRepo.insert(m);
	}

	@Override
	public Boolean deleteMemo(int id) {
		return embededMemoRepo.delete(id);
		
	}

	@Override
	public Boolean updateMemo(Memo m) {
		return embededMemoRepo.update(m);
	}

	@Override
	public User RegisterUser(User m) {
		return embededMemoRepo.register(m);
	}

	@Override
	public Boolean isExistedEmail(String email) {
		return embededMemoRepo.isExistEmail(email);
	}

	@Override
	public Boolean isReportedMemo(int memoid) {
		return embededMemoRepo.isReported(memoid);
	}

	@Override
	public Boolean insertReport(Report rp) {
		return embededMemoRepo.insertReport(rp);
	}

}
