package com.memo.app.entities;

import java.sql.Date;

public class Report {
	private int id;
	private int reporterid;
	private String reportname;
	private int memoid;
	private String memo;
	private int ownermemoid;
	private String ownermemoname;
	private Date reportdate;
	private boolean isblock;
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
	public String getReportname() {
		return reportname;
	}
	public void setReportname(String reportname) {
		this.reportname = reportname;
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
}
