package org.common.model;

public class ConvertBookVO {

	private Integer convertno;
	private Integer bookno;
	private Integer pageno;
	private String imgpath;

	public Integer getConvertno() {
		return convertno;
	}

	public void setConvertno(Integer convertno) {
		this.convertno = convertno;
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

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	@Override
	public String toString() {
		return "ConvertBookVO [convertno=" + convertno + ", bookno=" + bookno
				+ ", pageno=" + pageno + ", imgpath=" + imgpath + "]";
	}

}
