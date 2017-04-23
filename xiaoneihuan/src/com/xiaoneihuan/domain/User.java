package com.xiaoneihuan.domain;

public class User implements java.io.Serializable {
	private static final long serialVersionUID = -9206226603045752202L;
	private Integer id;
	private java.util.Date registerDate;
	private String username;
	private String password;
	private String sex;
	private String  stuId;
	private String realName;
	private String school;
	private String isChecked;
	public String getIsChecked() {
		return isChecked;
	}
	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public java.util.Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(java.util.Date registerDate) {
		this.registerDate = registerDate;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
}
