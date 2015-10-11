package org.common.model;

public class PageCriteria {

	protected int page;
	protected int perPageNum;

	public PageCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	public PageCriteria() {
		this(1, 10);
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
		return "PageCriteria [page=" + page + ", perPageNum=" + perPageNum
				+ "]";
	}

}
