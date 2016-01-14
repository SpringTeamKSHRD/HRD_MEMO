package com.memo.app.entities;


import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="tbluser",schema="public")
public class User {
	
	@Id
	private int userid;
	
	private String username;
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", gender=" + gender
				+ ", email=" + email + ", image=" + image + ", ismemoenable=" + ismemoenable + ", type=" + type
				+ ", registerdate=" + registerdate + "]";
	}
	private String password;
	private String gender;
	private String email;
	@Transient
	private String image;
	@Transient
	private boolean ismemoenable;
	@Transient
	private String type;
	@Transient
	private Date registerdate;

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


	
	
	
	

}
