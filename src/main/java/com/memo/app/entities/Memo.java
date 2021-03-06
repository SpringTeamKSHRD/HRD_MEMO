package com.memo.app.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Formula;
import org.hibernate.annotations.SelectBeforeUpdate;

@Entity
@Table(name="tbmemo",schema="memo")
@DynamicUpdate(value=true)
@SelectBeforeUpdate(value=true) 
public class Memo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int userid;
	@Transient
	private String username;
	@Transient
	private String userimage;
	private String title;
	private String content;
	@Column(name="domain")
	private String domainName;
	private String url;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="date",insertable=false,nullable=true)
	private Date date;
	private boolean isenable = true;
	private boolean ispublic;
	@Formula(value="domain || url")
	private String fullDomain;
	@Transient
	private int count;
		
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
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
	public String getUserimage() {
		return userimage;
	}
	public void setUserimage(String userimage) {
		this.userimage = userimage;
	}
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Memo [id=" + id + ", userid=" + userid + ", username=" + username + ", userimage=" + userimage
				+ ", title=" + title + ", content=" + content + ", domainName=" + domainName + ", url=" + url
				+ ", date=" + date + ", isenable=" + isenable + ", ispublic=" + ispublic + ", fullDomain=" + fullDomain
				+ ", count=" + count + "]";
	}	
}
