package org.admin.board.model;

public class BoardReportVO {

	private Integer reportNo;
	private String reason;
	private String userid;
	private String username;
	private Integer boardNo;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getReportNo() {
		return reportNo;
	}
	public void setReportNo(Integer reportNo) {
		this.reportNo = reportNo;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "BoardReportVO [reportNo=" + reportNo + ", reason=" + reason
				+ ", userid=" + userid + ", boardNo=" + boardNo + "]";
	}
	
	
	
	
}
