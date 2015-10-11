package org.admin.user.model;

public class PageCriteria {

	private int page;
	private int perPageNum;

	public PageCriteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getStartNum() {
		return ((this.page - 1) * perPageNum);
	}
	public int getEndNum() {
		return (getStartNum() + perPageNum);
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
