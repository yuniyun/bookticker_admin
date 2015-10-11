package org.admin.board.model;

import java.sql.Date;

public class BoardReplyVO {
	
	private Integer replyno;
	private String replyContent;
	private Date regdate;
	private Integer recomCnt;
	private Integer reportCnt;
	private Integer boardNo;
	private String userid;
	private String username;
	
	
	public Integer getReplyno() {
		return replyno;
	}
	public void setReplyno(Integer replyno) {
		this.replyno = replyno;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getRecomCnt() {
		return recomCnt;
	}
	public void setRecomCnt(Integer recomCnt) {
		this.recomCnt = recomCnt;
	}
	public Integer getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(Integer reportCnt) {
		this.reportCnt = reportCnt;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
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
}
