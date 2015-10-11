package org.login.model;

import java.sql.Date;

public class LoginVO {

	private String userid;
	private String userpw;
	private String username;
	private String grade;
	private String gender;
	private String birth;
	private String phone;
	private String livestate;
	private Date regdate;
	private String sessionid;
	private Integer sessionlimit;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLivestate() {
		return livestate;
	}

	public void setLivestate(String livestate) {
		this.livestate = livestate;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public Integer getSessionlimit() {
		return sessionlimit;
	}

	public void setSessionlimit(Integer sessionlimit) {
		this.sessionlimit = sessionlimit;
	}

	@Override
	public String toString() {
		return "LoginVO [userid=" + userid + ", userpw=" + userpw
				+ ", username=" + username + ", grade=" + grade + ", gender="
				+ gender + ", birth=" + birth + ", phone=" + phone
				+ ", livestate=" + livestate + ", regdate=" + regdate
				+ ", sessionid=" + sessionid + ", sessionlimit=" + sessionlimit
				+ "]";
	}

}
