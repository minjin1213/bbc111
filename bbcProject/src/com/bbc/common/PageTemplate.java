package com.bbc.common;

import com.bbc.common.page.vo.PageInfo;

public class PageTemplate {
	
	public static PageInfo getPageInfo(int listCount, int currentPage) {
		
		int startPage;			// 현제 페이지 하단에 보여지는 페이징 바의 시작 수
		int endPage;			// 현재 페이지 하단에 보여지는 페이징 바의 끝 수
		int maxPage;			// 전체 페이지에서의 가장 마지막 페이지
		
		int pageLimit = 5;			// 한 페이지 하단에 보여질 페이지 최대 갯수
		int myInquiryLimit = 15;		// 한 페이지 하단에 보여질 게시글 최대 갯수
		
		maxPage = (int)Math.ceil((double)listCount/myInquiryLimit);
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		// 단, maxPage가 8까지밖에 안된다면?	--> endPage를 8로 해야한다.
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, myInquiryLimit);
	}

}
