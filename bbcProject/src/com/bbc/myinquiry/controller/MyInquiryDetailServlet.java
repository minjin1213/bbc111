package com.bbc.myinquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.myinquiry.model.service.MyInquiryService;
import com.bbc.myinquiry.model.vo.MyInquiry;

/**
 * Servlet implementation class MyInquiryDetailServlet
 */
@WebServlet("/detail.t.mi")
public class MyInquiryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInquiryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int iNo = Integer.parseInt(request.getParameter("iNo"));
		
		MyInquiry m = new MyInquiryService().adminSelectDetail(iNo);
		
		if(m != null) {
			request.setAttribute("m", m);
			request.setAttribute("iNo", iNo);
			request.getRequestDispatcher("views/admin/support/qaFeedback.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "문의내역 정보를 불러오는데 실패했습니다.");
			request.setAttribute("iNo", iNo);
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
