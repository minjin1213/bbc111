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
@WebServlet("/MyInquiryDetail.my")
public class InquiryDetailsServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDetailsServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int min = Integer.parseInt(request.getParameter("min"));
		
		MyInquiry m = new MyInquiryService().UserSelectDetail(min);
		
		request.setAttribute("parentMenu", "마이페이지 / 나의 문의 내역 ");
		request.setAttribute("currentMenu", "상세조회");
		
		request.setAttribute("m", m);
		
	
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/userInquiryDetailsCheck.jsp");
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
