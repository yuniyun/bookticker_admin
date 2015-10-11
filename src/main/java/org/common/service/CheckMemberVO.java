package org.common.service;

import org.admin.user.model.MemberVO;

public class CheckMemberVO extends MemberVO {

	private String sessionid;
	private String sessionlimit;

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getSessionlimit() {
		return sessionlimit;
	}

	public void setSessionlimit(String sessionlimit) {
		this.sessionlimit = sessionlimit;
	}

	@Override
	public String toString() {
		return "CheckMemberVO [sessionid=" + sessionid + ", sessionlimit="
				+ sessionlimit + "]";
	}

}
