package com.bbc.myinquiry.model.vo;

public class UserPageInfo {

	private int listCount;			// 총 게시글 갯수
	private int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
	private int startPage;			// 현재페이지 하단의 시작 수 
	private int endPage;			// 현재페이지 하단의 끝 수
	private int maxPage;			// 가장 마지막 페이지	

	private int pageLimit;			// 한페이지 하단에 보여질 최대 갯수
	private int boardLimit;			// 한페이지  보여질 최대 갯수	

	public UserPageInfo() {		

	}
 
 
	public UserPageInfo(int listCount, int currentPage, int startPage, int endPage, int maxPage, int pageLimit,
			int boardLimit) {
		super();

		this.listCount = listCount;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

 
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
 
	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

 
	@Override
	public String toString() {
		return "UserPageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", maxPage=" + maxPage + ", pageLimit=" + pageLimit + ", boardLimit="
				+ boardLimit + "]";

	}

	

	

	

	

	

	

}
