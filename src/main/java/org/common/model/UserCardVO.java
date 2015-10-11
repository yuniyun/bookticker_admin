package org.common.model;

import java.sql.Date;

public class UserCardVO extends CardVO {
	
	private String title;
	private String bookcategory;
	private String pubcompany;
	private String pubdate;
	private String overview;
	private String series;
	private float bookversion;
	private Date applydate;
	private Integer totalpage;
	private float starpoint_avg;
	private Integer reportcnt;
	private String username;
	private String grade;
	private Integer sellcnt;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBookcategory() {
		return bookcategory;
	}
	public void setBookcategory(String bookcategory) {
		this.bookcategory = bookcategory;
	}
	public String getPubcompany() {
		return pubcompany;
	}
	public void setPubcompany(String pubcompany) {
		this.pubcompany = pubcompany;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getSeries() {
		return series;
	}
	public void setSeries(String series) {
		this.series = series;
	}
	public float getBookversion() {
		return bookversion;
	}
	public void setBookversion(float bookversion) {
		this.bookversion = bookversion;
	}
	public Date getApplydate() {
		return applydate;
	}
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	public Integer getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(Integer totalpage) {
		this.totalpage = totalpage;
	}
	public float getStarpoint_avg() {
		return starpoint_avg;
	}
	public void setStarpoint_avg(float starpoint_avg) {
		this.starpoint_avg = starpoint_avg;
	}
	public Integer getReportcnt() {
		return reportcnt;
	}
	public void setReportcnt(Integer reportcnt) {
		this.reportcnt = reportcnt;
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
	
	public Integer getSellcnt() {
		return sellcnt;
	}
	public void setSellcnt(Integer sellcnt) {
		this.sellcnt = sellcnt;
	}
	@Override
	public String toString() {
		return "UserCardVO [title=" + title + ", bookcategory=" + bookcategory
				+ ", pubcompany=" + pubcompany + ", pubdate=" + pubdate
				+ ", overview=" + overview + ", series=" + series
				+ ", bookversion=" + bookversion + ", applydate=" + applydate
				+ ", totalpage=" + totalpage + ", starpoint_avg="
				+ starpoint_avg + ", reportcnt=" + reportcnt + ", username="
				+ username + ", grade=" + grade + ", sellcnt=" + sellcnt + "]";
	}
	
}
