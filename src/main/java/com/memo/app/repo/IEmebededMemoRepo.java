package com.memo.app.repo;

import java.util.List;

import com.memo.app.entities.Memo;
public interface IEmebededMemoRepo {
	public List<Memo> listById(int id);
	public Boolean login(String email,String password);
}
