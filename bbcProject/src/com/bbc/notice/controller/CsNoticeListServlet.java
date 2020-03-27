package com.bbc.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.notice.model.service.NoticeService;
import com.bbc.notice.model.vo.Notice;
import com.bbc.notice.model.vo.UserPageInfo;

/**
 * Servlet implementation class CsNoticeListServlet
 */
@WebServlet("/CsList.no")
public class CsNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;			// 총 게시글 갯수
		int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
		int startPage;			// 현재페이지 하단의 시작 수 
		int endPage;			// 현재페이지 하단의 끝 수
		int maxPage;			// 가장 마지막 페이지
		
		int pageLimit;			// 한페이지 하단에 보여질 최대 갯수
		int boardLimit;			// 한페이지  보여질 최대 갯수
		
		// 총게시글 갯수
		listCount = new NoticeService().UserGetListCount();
		
		// * currentPage : 현재페이지
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit); 
		
		/*
		 * startpage: 1,6,11,16,21,26  n*5 + 1 인가?
		 * 
		 * currentpage = 1			--> 0  + 1
		 * currentpage = 5          --> 0  + 1
		 * 
		 * currentpage = 6		   --> 1*5 + 1
		 * c           = 10        --> 1*5 + 1 
		 * 
		 * c   =  1 ~ 5   --> n = 0
		 * c   =  6 ~ 10  --> n = 1
		 * c   =  11~ 15  --> n = 2 
		 * 								 0~ 4  = 0    /5    0
		 * 								 5~ 9  = 1    /5    1
		 * 							    11~ 15 = 2    /5    2
		 * 							n = (currentpage - 1 ) /pageLimit
		 * 								
		 */
		startPage = (currentPage - 1 ) / pageLimit * pageLimit + 1;
		
		// startPage : 1     -- > end  5
		// startPage : 6     -- > end  10
		
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 구해진 정보들 UserPageInfo 객체 담기
		
		UserPageInfo pi = new UserPageInfo(listCount,currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		
		
		
		ArrayList<Notice> list = new NoticeService().userSelectList(pi);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		request.setAttribute("parentMenu", "고객센터");
		request.setAttribute("currentMenu", "공지사항");
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/customerservice/userNotice.jsp");
		view.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
