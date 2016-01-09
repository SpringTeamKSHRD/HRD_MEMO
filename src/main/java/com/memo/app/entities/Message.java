package com.memo.app.entities;

public class Message {
	private int id;
	private int  userid;
	private int messageid;
	private boolean isview;
	private String message;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getMessageid() {
		return messageid;
	}
	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}
	public boolean isIsview() {
		return isview;
	}
	public void setIsview(boolean isview) {
		this.isview = isview;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
