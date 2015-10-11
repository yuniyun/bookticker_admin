package org.admin.user.model;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private boolean firstPage;
	private boolean lastPage;
	private int last;

	private int displayPageNum = 10;

	private PageCriteria cri;

	public PageMaker() {
		this(new PageCriteria(), 0);
	}

	public PageMaker(PageCriteria cri, int totalCount) {
		this.totalCount = totalCount;
		this.cri = cri;
		calcData();
	}
	
	public void setCri(PageCriteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		calcData();
	}

	public int getLast() {
		return  (int) (Math.ceil(totalCount	/ (double) cri.getPerPageNum()));
	}

	public void setLast(int last) {
		this.last = last;
	}

	private void calcData() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount
				/ (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() > totalCount ? false : true;

		firstPage = cri.getPage() != 1 ? true : false;
		lastPage = cri.getPage() != (totalCount - 1) / cri.getPerPageNum() + 1 ? true
				: false;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public boolean isFirstPage() {
		return firstPage;
	}

	public boolean isLastPage() {
		return lastPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public PageCriteria getCri() {
		return cri;
	}

	public String makeQuery(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();

		return uriComponents.toUriString();
	}

	public String makeSearch(int page) {

		UriComponents uriComponents = UriComponentsBuilder
				.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType",
						((MemberCriteria) cri).getSearchType())
				.queryParam("keyword", ((MemberCriteria) cri).getKeyword())
				.queryParam("checkGender",
						((MemberCriteria) cri).getCheckGender())
				.queryParam("checkGrade",
						((MemberCriteria) cri).getCheckGrade())
				.queryParam("checkLiveState",
						((MemberCriteria) cri).getCheckLiveState())
				.queryParam("sortType", ((MemberCriteria) cri).getSortType())
				.queryParam("sortDirection", ((MemberCriteria) cri).getSortDirection())
				.build();

		return uriComponents.toUriString();
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage="
				+ startPage + ", endPage=" + endPage + ", prev=" + prev
				+ ", next=" + next + ", firstPage=" + firstPage + ", lastPage="
				+ lastPage + ", last=" + last + ", displayPageNum="
				+ displayPageNum + ", cri=" + cri + "]";
	}

}