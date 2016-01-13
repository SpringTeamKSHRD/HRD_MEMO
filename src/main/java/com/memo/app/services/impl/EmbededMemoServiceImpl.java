package com.memo.app.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.memo.app.entities.Memo;
import com.memo.app.repo.IEmebededMemoRepo;
import com.memo.app.service.IEmbededMemoService;

@Service
public class EmbededMemoServiceImpl implements IEmbededMemoService {
	@Autowired
	private IEmebededMemoRepo embededMemoRepo;
	
	@Override
	public List<Memo> listMemoByUserId(int id) {
		return embededMemoRepo.listById(id);
	}

}
