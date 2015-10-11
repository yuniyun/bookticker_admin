package org.admin.book.model;

import java.util.Date;

public class BookAdditionVO {

	private Integer additionno;
	private String bookcomment;
	private String userid;
	private Integer convertno;
	private String addmode;
	private Date regdate;
	private Integer bookno;
	private Integer pageno;

	public Integer getAdditionno() {
		return additionno;
	}

	public void setAdditionno(Integer additionno) {
		this.additionno = additionno;
	}

	public String getBookcomment() {
		return bookcomment;
	}

	public void setBookcomment(String bookcomment) {
		this.bookcomment = bookcomment;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Integer getConvertno() {
		return convertno;
	}

	public void setConvertno(Integer convertno) {
		this.convertno = convertno;
	}

	public String getAddmode() {
		return addmode;
	}

	public void setAddmode(String addmode) {
		this.addmode = addmode;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public Integer getBookno() {
		return bookno;
	}

	public void setBookno(Integer bookno) {
		this.bookno = bookno;
	}

	public Integer getPageno() {
		return pageno;
	}

	public void setPageno(Integer pageno) {
		this.pageno = pageno;
	}

	@Override
	public String toString() {
		return "BookAdditionVO [additionno=" + additionno + ", bookcomment="
				+ bookcomment + ", userid=" + userid + ", convertno="
				+ convertno + ", addmode=" + addmode + ", regdate=" + regdate
				+ ", bookno=" + bookno + ", pageno=" + pageno + "]";
	}
}
