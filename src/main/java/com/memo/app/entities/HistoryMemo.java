package com.memo.app.entities;

import java.util.Date;

public class HistoryMemo {
	private int id;
	private int memoid;
	private String title;
	private String content;
	private Date date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemoid() {
		return memoid;
	}
	public void setMemoid(int memoid) {
		this.memoid = memoid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}	
	
}
