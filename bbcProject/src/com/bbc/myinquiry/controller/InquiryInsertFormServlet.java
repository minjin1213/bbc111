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
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class InquiryInsertFormServlet
 */
@WebServlet("/MyInquiryInsert.my")
public class InquiryInsertFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String name = request.getParameter("userName");
//		UserInfo us = new UserInfo();
//		us.setMemberName(name);	
//		request.setAttribute("us", us);
		ArrayList<UserInfo> list = new MyInquiryService().userInfoGetList();
		
		request.setAttribute("parentMenu", "마이페이지 / 나의 문의 내역 ");
		request.setAttribute("currentMenu", "상세조회");
		
		
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/userToInquiryDetails.jsp");
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
