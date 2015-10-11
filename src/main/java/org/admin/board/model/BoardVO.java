package org.admin.board.model;

import java.sql.Date;

/**
 * @author Lee
 *
 */
public class BoardVO {
	private Integer boardNo;
	private String grade;
	private String title;
	private String boardContent;
	private String userid;
	private String username;
	private Date regdate;
	private Date updatedate;
	private Integer replycnt;
	private Integer viewcnt;
	private Integer recomcnt;
	private Integer reportcnt;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdate() {
		return updatedate;
	}
	public void setUpdate(Date update) {
		this.updatedate = update;
	}
	public Integer getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(Integer replycnt) {
		this.replycnt = replycnt;
	}
	public Integer getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(Integer viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Integer getRecomcnt() {
		return recomcnt;
	}
	public void setRecomcnt(Integer recomcnt) {
		this.recomcnt = recomcnt;
	}
	public Integer getReportcnt() {
		return reportcnt;
	}
	public void setReportcnt(Integer reportcnt) {
		this.reportcnt = reportcnt;
	}
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", grade=" + grade
				+ ", title=" + title + ", content=" + boardContent + ", userid="
				+ userid + ", regdate=" + regdate + ", update=" + updatedate
				+ ", replycnt=" + replycnt + ", viewcnt=" + viewcnt
				+ ", recomcnt=" + recomcnt + ", reportcnt=" + reportcnt + "]";
	}
}
