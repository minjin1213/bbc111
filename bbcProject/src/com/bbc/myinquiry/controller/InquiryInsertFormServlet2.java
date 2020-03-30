package com.bbc.myinquiry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.myinquiry.model.service.MyInquiryService;
import com.bbc.myinquiry.model.vo.MyInquiry;

/**
 * Servlet implementation class InquiryInsertFormServlet2
 */
@WebServlet("/MyInquiryInsertList.my")
public class InquiryInsertFormServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertFormServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		
		MyInquiry m = new MyInquiry();
		m.setInquiryTitle(title);
		m.setInquiryContent(contents);
		m.setMemberNo(memberNo);
		
		int result = new MyInquiryService().insertUserMyInquiry(m);
		
		//RequestDispatcher view = request.getRequestDispatcher("views/mypage/userInquiryDetails.jsp");
		//view.forward(request, response);
		
		response.sendRedirect("MyInquiryList.my");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
