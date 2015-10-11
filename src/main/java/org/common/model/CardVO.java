package org.common.model;

import java.sql.Date;

public class CardVO {

	private Integer cardno;
	private String cardkey;
	private String usingstate;
	private Integer starpoint;
	private String review;
	private String likestate;
	private Integer continuepage;
	private String userid;
	private Integer bookno;
	private Date cardregdate;
	private Date userregdate;

	public Integer getCardno() {
		return cardno;
	}

	public void setCardno(Integer cardno) {
		this.cardno = cardno;
	}

	public String getCardkey() {
		return cardkey;
	}

	public void setCardkey(String cardkey) {
		this.cardkey = cardkey;
	}

	public String getUsingstate() {
		return usingstate;
	}

	public void setUsingstate(String usingstate) {
		this.usingstate = usingstate;
	}

	public Integer getStarpoint() {
		return starpoint;
	}

	public void setStarpoint(Integer starpoint) {
		this.starpoint = starpoint;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getLikestate() {
		return likestate;
	}

	public void setLikestate(String likestate) {
		this.likestate = likestate;
	}

	public Integer getContinuepage() {
		return continuepage;
	}

	public void setContinuepage(Integer continuepage) {
		this.continuepage = continuepage;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Integer getBookno() {
		return bookno;
	}

	public void setBookno(Integer bookno) {
		this.bookno = bookno;
	}

	public Date getCardregdate() {
		return cardregdate;
	}

	public void setCardregdate(Date cardregdate) {
		this.cardregdate = cardregdate;
	}

	public Date getUserregdate() {
		return userregdate;
	}

	public void setUserregdate(Date userregdate) {
		this.userregdate = userregdate;
	}

	@Override
	public String toString() {
		return "CardVO [cardno=" + cardno + ", cardkey=" + cardkey
				+ ", usingstate=" + usingstate + ", starpoint=" + starpoint
				+ ", review=" + review + ", likestate=" + likestate
				+ ", continuepage=" + continuepage + ", userid=" + userid
				+ ", bookno=" + bookno + ", cardregdate=" + cardregdate
				+ ", userregdate=" + userregdate + "]";
	}

}
