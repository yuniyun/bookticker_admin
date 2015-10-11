package org.admin.book.model;

import java.sql.Date;

public class PermitInfoVO {

	private Integer permitno;
	private Integer bookno;
	private String permitstate;
	private String reason;
	private Date permitdate;

	public Integer getPermitno() {
		return permitno;
	}

	public void setPermitno(Integer permitno) {
		this.permitno = permitno;
	}

	public Integer getBookno() {
		return bookno;
	}

	public void setBookno(Integer bookno) {
		this.bookno = bookno;
	}

	public String getPermitstate() {
		return permitstate;
	}

	public void setPermitstate(String permitstate) {
		this.permitstate = permitstate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getPermitdate() {
		return permitdate;
	}

	public void setPermitdate(Date permitdate) {
		this.permitdate = permitdate;
	}

	@Override
	public String toString() {
		return "PermitInfoVO [permitno=" + permitno + ", bookno=" + bookno
				+ ", permitstate=" + permitstate + ", reason=" + reason
				+ ", permitdate=" + permitdate + "]";
	}

}
