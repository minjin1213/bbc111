package com.bbc.myinquiry.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.myinquiry.model.service.MyInquiryService;
import com.bbc.myinquiry.model.vo.MyInquiry;
import com.bbc.myinquiry.model.vo.UserPageInfo;

/**
 * Servlet implementation class InquiryDetailsServlet
 */
@WebServlet("/MyInquiryList.my")
public class InquiryDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDetailsServlet() {
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
		
		listCount = new MyInquiryService().UserGetListCount();
		
		currentPage = 1;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 5;
		boardLimit = 10;		

		maxPage = (int)Math.ceil((double)listCount/boardLimit); 

		startPage = (currentPage - 1 ) / pageLimit * pageLimit + 1;
		

		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		UserPageInfo pi = new UserPageInfo(listCount,currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
		ArrayList<MyInquiry> list = new MyInquiryService().UserselectList(pi);
		
		request.setAttribute("parentMenu", "마이페이지");
		request.setAttribute("currentMenu", "나의 문의 내역");
		
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		

		
		 
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/userInquiryDetails.jsp");
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
