package com.memo.app.service;

import java.util.List;

import com.memo.app.entities.Memo;

public interface IEmbededMemoService {
	public List<Memo> listMemoByUserId(int id);
}
