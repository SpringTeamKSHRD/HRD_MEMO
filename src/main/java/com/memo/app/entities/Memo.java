package com.memo.app.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Formula;

@Entity
@Table(name="tbmemo",schema="memo")
public class Memo {
	@Id
	private int id;
	private int userid;
	private String title;
	private String content;
	@Column(name="domain_name")
	private String domainName;
	private String url;
	private Date date;
	private boolean isenable = true;
	private boolean ispublic;
	@Formula(value="domain_name || url")
	private String fullDomain;

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
	public String getDomain() {
		return domainName;
	}
	public void setDomain(String domainName) {
		this.domainName = domainName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public boolean isIsenable() {
		return isenable;
	}
	public void setIsenable(boolean isenable) {
		this.isenable = isenable;
	}
	public boolean isIspublic() {
		return ispublic;
	}
	public void setIspublic(boolean ispublic) {
		this.ispublic = ispublic;
	}
	public String getFullDomain() {
		return fullDomain;
	}
	public void setFullDomain(String fullDomain) {
		this.fullDomain = fullDomain;
	}
	@Override
	public String toString() {
		return "Memo [id=" + id + ", userid=" + userid + ", title=" + title + ", content=" + content + ", domain="
				+ domainName + ", url=" + url + ", date=" + date + ", isenable=" + isenable + ", ispublic=" + ispublic
				+ "]";
	}
	
}
