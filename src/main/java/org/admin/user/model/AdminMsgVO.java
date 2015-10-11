package org.admin.user.model;

import java.sql.Date;

public class AdminMsgVO {

	private Integer msgno;
	private String msg;
	private String readstate;
	private Date senddate;
	private String userid;
	private String username;

	public Integer getMsgno() {
		return msgno;
	}

	public void setMsgno(Integer msgno) {
		this.msgno = msgno;
	}
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getReadstate() {
		return readstate;
	}

	public void setReadstate(String readstate) {
		this.readstate = readstate;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "AdminMsgVO [msgno=" + msgno + ", msg=" + msg + ", readstate="
				+ readstate + ", senddate=" + senddate + ", userid=" + userid
				+ ", username=" + username + "]";
	}
	
}
