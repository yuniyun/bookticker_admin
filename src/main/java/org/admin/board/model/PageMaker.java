package org.admin.board.model;

public class PageMaker {

	private BoardCriteria cri;
	private int endPage;
	private int startPage;
	private int totalCnt;
	private int last;
	private boolean lastPage = false;
	private boolean firstPage = false;
	private boolean prev = false;
	private boolean next = false;
	
	
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public PageMaker() {
		this(new BoardCriteria(), 0);
	}

	public PageMaker(BoardCriteria cri, int totalCnt) {
		this.cri = cri;
		this.totalCnt = totalCnt;
		makePage();
	}

	public BoardCriteria getCri() {
		return cri;
	}

	public void setCri(BoardCriteria cri) {
		this.cri = cri;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isLastPage() {
		return lastPage;
	}

	public void setLastPage(boolean lastPage) {
		this.lastPage = lastPage;
	}

	public boolean isFirstPage() {
		return firstPage;
	}

	public void setFirstPage(boolean firstPage) {
		this.firstPage = firstPage;
	}

	@Override
	public String toString() {
		return "PageMaker [cri=" + cri + ", endPage=" + endPage
				+ ", startPage=" + startPage + ", totalCnt=" + totalCnt
				+ ", lastPage=" + lastPage + ", firstPage=" + firstPage
				+ ", prev=" + prev + ", next=" + next + "]";
	}

	public void makePage() {
		endPage = (int) (Math.ceil(cri.getPage() / 10.0)) * 10;

		startPage = endPage - 9;

		last = ((totalCnt-1) / cri.getPerPageNum()) + 1;
		
		prev = startPage != 1 ? true : false;
		if (endPage * cri.getPerPageNum() >= totalCnt) {
			endPage = (int) Math.ceil(totalCnt / (double) cri.getPerPageNum());
		} else {
			next = true;
		}

	    firstPage = cri.getPage() != 1 ? true : false;
	    lastPage = cri.getPage() != (totalCnt - 1) / cri.getPerPageNum() + 1 ? true : false;
	}
}
