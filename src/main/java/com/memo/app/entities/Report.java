package com.memo.app.entities;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
@Entity
@Table(name="tbreport",schema="memo")
public class Report {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private int reporterid;
	@Transient
	private String reportername;
	@Transient
	private String reporterimage;
	private int memoid;
	@Transient
	private String memo;
	@Transient
	private int ownermemoid;
	@Transient
	private String ownermemoname;
	@Transient
	private String ownermemoimage;
	@Column(name="date")
	private Date reportdate;
	private boolean isblocked;
	private String description;
	@Transient
	private Date memodate;
	@Transient
	private String memotitle;
	@Transient
	private String memocontent;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getReporterid() {
		return reporterid;
	}
	public void setReporterid(int reporterid) {
		this.reporterid = reporterid;
	}
	public int getMemoid() {
		return memoid;
	}
	public void setMemoid(int memoid) {
		this.memoid = memoid;
	}
	public Date getReportdate() {
		return reportdate;
	}
	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}
	public boolean isIsblock() {
		return isblocked;
	}
	public void setIsblock(boolean isblocked) {
		this.isblocked = isblocked;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getOwnermemoid() {
		return ownermemoid;
	}
	public void setOwnermemoid(int ownermemoid) {
		this.ownermemoid = ownermemoid;
	}
	public String getOwnermemoname() {
		return ownermemoname;
	}
	public void setOwnermemoname(String ownermemoname) {
		this.ownermemoname = ownermemoname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getReportername() {
		return reportername;
	}
	public void setReportername(String reportername) {
		this.reportername = reportername;
	}
	public String getReporterimage() {
		return reporterimage;
	}
	public void setReporterimage(String reporterimage) {
		this.reporterimage = reporterimage;
	}
	public String getOwnermemoimage() {
		return ownermemoimage;
	}
	public void setOwnermemoimage(String ownermemoimage) {
		this.ownermemoimage = ownermemoimage;
	}
	public Date getMemodate() {
		return memodate;
	}
	public void setMemodate(Date memodate) {
		this.memodate = memodate;
	}
	public String getMemotitle() {
		return memotitle;
	}
	public void setMemotitle(String memotitle) {
		this.memotitle = memotitle;
	}
	public String getMemocontent() {
		return memocontent;
	}
	public void setMemocontent(String memocontent) {
		this.memocontent = memocontent;
	}
	@Override
	public String toString() {
		return "Report [id=" + id + ", reporterid=" + reporterid + ", reportername=" + reportername + ", reporterimage="
				+ reporterimage + ", memoid=" + memoid + ", memo=" + memo + ", ownermemoid=" + ownermemoid
				+ ", ownermemoname=" + ownermemoname + ", ownermemoimage=" + ownermemoimage + ", reportdate="
				+ reportdate + ", isblock=" + isblocked + ", description=" + description + ", memodate=" + memodate
				+ ", memotitle=" + memotitle + ", memocontent=" + memocontent + "]";
	}
	
}
