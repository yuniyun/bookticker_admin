package org.admin.book.model;

import org.common.model.PageCriteria;

public class BookCriteria extends PageCriteria {

	private String searchType;
	private String keyword;
	private String chargeType;
	private String categoryType;
	private String isReportZero;
	private String convertType;
	private String sortType;
	private String sortDirection;
	
	public BookCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	public BookCriteria() {
		this(1, 10);
	}
	
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
	public String getChargeType() {
		return chargeType;
	}
	public void setChargeType(String chargeType) {
		this.chargeType = chargeType;
	}
	public String getCategoryType() {
		return categoryType;
	}
	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}
	public String getIsReportZero() {
		return isReportZero;
	}
	public void setIsReportZero(String isReportZero) {
		this.isReportZero = isReportZero;
	}
	public String getConvertType() {
		return convertType;
	}
	public void setConvertType(String convertType) {
		this.convertType = convertType;
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
		return "BookCriteria [searchType=" + searchType + ", keyword="
				+ keyword + ", chargeType=" + chargeType + ", categoryType="
				+ categoryType + ", isReportZero=" + isReportZero
				+ ", convertType=" + convertType + ", sortType=" + sortType
				+ ", sortDirection=" + sortDirection + "]";
	}	
}