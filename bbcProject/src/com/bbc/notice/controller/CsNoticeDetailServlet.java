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
 * Servlet implementation class CsNoticeDetailServlet
 */
@WebServlet("/CsNodetail.no")
public class CsNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsNoticeDetailServlet() {
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

		listCount = new NoticeService().UserGetListCount();
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
		ArrayList<Notice> list = new NoticeService().userSelectList(pi);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);

		int nno = Integer.parseInt(request.getParameter("nno"));
		Notice n = new NoticeService().UserSelectNotice(nno);
		request.setAttribute("n", n);
		
		request.setAttribute("parentMenu", "고객센터");
		request.setAttribute("currentMenu", "공지사항");

		
		RequestDispatcher view = request.getRequestDispatcher("views/customerservice/UserNoticeInquiry.jsp");
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
