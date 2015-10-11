package org.admin.board.model;

public class BoardCriteria {

	private int page;
	private int perPageNum;
	private String keyword = "";
	private String searchType = "t1.title";
	private String boardType = "ÀüÃ¼";
	private String sortkey = "t1.boardno";
	private String sortType = "desc";

	public BoardCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	public BoardCriteria() {
		this(1, 10);
	}
	
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getSortkey() {
		return sortkey;
	}

	public void setSortkey(String sortkey) {
		this.sortkey = sortkey;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum
				+ ", keyword=" + keyword + ", searchType=" + searchType
				+ ", boardType=" + boardType + ", sortkey=" + sortkey
				+ ", sortType=" + sortType + "]";
	}

}
