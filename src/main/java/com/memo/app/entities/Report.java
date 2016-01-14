package com.memo.app.entities;

import java.sql.Date;

public class Report {
	private int id;
	private int reporterid;
	private String reportername;
	private String reporterimage;
	private int memoid;
	private String memo;
	private int ownermemoid;
	private String ownermemoname;
	private String ownermemoimage;
	private Date reportdate;
	private boolean isblock;
	private String description;
	private Date memodate;
	private String memotitle;
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
		return isblock;
	}
	public void setIsblock(boolean isblock) {
		this.isblock = isblock;
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
}
