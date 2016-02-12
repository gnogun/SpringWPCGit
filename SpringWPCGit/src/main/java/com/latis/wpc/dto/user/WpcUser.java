package com.latis.wpc.dto.user;

public class WpcUser {

	private int idx;
	private String id;
	private String pwd;
	private String user_name;
	private String mail;
	private String phone;
	private String mobile;
	private String title;//직책
	private String department;//부서
	private String manage_auth;// a = admin, s = super_admin, u= user
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getManage_auth() {
		return manage_auth;
	}
	public void setManage_auth(String manage_auth) {
		this.manage_auth = manage_auth;
	}
	
	
	
}
