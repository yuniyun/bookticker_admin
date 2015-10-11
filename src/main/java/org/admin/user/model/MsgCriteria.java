package org.admin.user.model;

import org.common.model.PageCriteria;

public class MsgCriteria extends PageCriteria {
	
	private String msgReadState;

	public String getMsgReadState() {
		return msgReadState;
	}

	public void setMsgReadState(String msgReadState) {
		this.msgReadState = msgReadState;
	}

	@Override
	public String toString() {
		return "MsgCriteria [msgReadState=" + msgReadState + "]";
	}
}
