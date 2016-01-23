package com.memo.app.entities;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;


@Entity
@Table(name="tbluser",schema="public")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int userid;	
	private String username;
	private String password;
	private String gender;
	private String email;
	@Column(name="dateofbirth")
	private Date dob;
	@Column(name="phonenumber")
	private String phone;
	@Column(name="userimageurl")
	private String image;
	@Transient
	private boolean ismemoenable;
	@Transient
	private String type;
	@Transient
	private Date registerdate;
	@Transient
	private String oldpwd;
	@Transient
	private String newpwd;
	@Transient
	private String conpwd;
	
	
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public String getConpwd() {
		return conpwd;
	}
	public void setConpwd(String conpwd) {
		this.conpwd = conpwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public boolean isIsmemoenable() {
		return ismemoenable;
	}
	public void setIsmemoenable(boolean ismemoenable) {
		this.ismemoenable = ismemoenable;
	}
	public Date getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", gender=" + gender
				+ ", email=" + email + ", image=" + image + ", ismemoenable=" + ismemoenable + ", type=" + type
				+ ", registerdate=" + registerdate + "]";
	}

}
