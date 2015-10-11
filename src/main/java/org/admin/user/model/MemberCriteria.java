package org.admin.user.model;

public class MemberCriteria extends PageCriteria {

	private String searchType;
	private String keyword;
	private String checkGender;
	private String checkGrade;
	private String checkLiveState;
	private String sortType;
	private String sortDirection;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCheckGender() {
		return checkGender;
	}

	public void setCheckGender(String checkGender) {
		this.checkGender = checkGender;
	}

	public String getCheckGrade() {
		return checkGrade;
	}

	public void setCheckGrade(String checkGrade) {
		this.checkGrade = checkGrade;
	}

	public String getCheckLiveState() {
		return checkLiveState;
	}

	public void setCheckLiveState(String checkLiveState) {
		this.checkLiveState = checkLiveState;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public String getSortDirection() {
		return sortDirection;
	}

	public void setSortDirection(String sortDirection) {
		this.sortDirection = sortDirection;
	}

	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword="
				+ keyword + ", checkGender=" + checkGender + ", checkGrade="
				+ checkGrade + ", checkLiveState=" + checkLiveState
				+ ", sortType=" + sortType + ", sortDirection=" + sortDirection
				+ "]";
	}

}