package org.common.model;

import java.sql.Date;

public class BookVO {

	private Integer bookno;
	private String title;
	private String bookcategory;
	private String pubcompany;
	private String pubdate;
	private String overview;
	private String series;
	private String pdfpath;
	private float bookversion;
	private Date applydate;
	private String convertstate;
	private Integer totalpage;
	private Integer sellcnt;
	private float starpoint;
	private Integer reportcnt;
	private String userid;
	private String username;
	private String grade;

	public Integer getBookno() {
		return bookno;
	}

	public void setBookno(Integer bookno) {
		this.bookno = bookno;
	}

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

	public String getPdfpath() {
		return pdfpath;
	}

	public void setPdfpath(String pdfpath) {
		this.pdfpath = pdfpath;
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

	public String getConvertstate() {
		return convertstate;
	}

	public void setConvertstate(String convertstate) {
		this.convertstate = convertstate;
	}

	public Integer getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(Integer totalpage) {
		this.totalpage = totalpage;
	}

	public Integer getSellcnt() {
		return sellcnt;
	}

	public void setSellcnt(Integer sellcnt) {
		this.sellcnt = sellcnt;
	}

	public float getStarpoint() {
		return starpoint;
	}

	public void setStarpoint(float starpoint) {
		this.starpoint = starpoint;
	}

	public Integer getReportcnt() {
		return reportcnt;
	}

	public void setReportcnt(Integer reportcnt) {
		this.reportcnt = reportcnt;
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "BookVO [bookno=" + bookno + ", title=" + title
				+ ", bookcategory=" + bookcategory + ", pubcompany="
				+ pubcompany + ", pubdate=" + pubdate + ", overview="
				+ overview + ", series=" + series + ", pdfpath=" + pdfpath
				+ ", bookversion=" + bookversion + ", applydate=" + applydate
				+ ", convertstate=" + convertstate + ", totalpage=" + totalpage
				+ ", sellcnt=" + sellcnt + ", starpoint=" + starpoint
				+ ", reportcnt=" + reportcnt + ", userid=" + userid
				+ ", username=" + username + ", grade=" + grade + "]";
	}
}
