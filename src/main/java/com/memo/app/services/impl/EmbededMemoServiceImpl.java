package com.memo.app.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.memo.app.entities.Memo;
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

}
