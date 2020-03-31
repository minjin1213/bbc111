package com.bbc.driverlicense.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.bbc.driverlicense.model.service.DriverLicenseService;
import com.bbc.driverlicense.model.vo.DriverLicense;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class MyDriverLicenseServlet
 */
@WebServlet("/driverLicense.dl")
public class MyDriverLicenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyDriverLicenseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		int userNo = loginUser.getMemberNo();
		
		DriverLicense d =  new DriverLicenseService().selectDriverlicense(userNo);
		
		request.setAttribute("d", d);
		request.setAttribute("currentMenu", "운전면허");
		
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/myDriverLicense.jsp"); // 뿌리는것
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
