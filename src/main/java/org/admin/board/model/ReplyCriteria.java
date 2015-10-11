package org.admin.board.model;

public class ReplyCriteria {

	private int page = 1;
	private int perPageNum = 10;
	
	public int getStartBno() {
		return ((this.page - 1) * perPageNum);
	}

	public int getEndBno() {
		return (getStartBno() + perPageNum - 1);
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
	
}
