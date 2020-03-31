package com.bbc.driverlicense.controller;

import java.io.IOException;

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
 * Servlet implementation class DeleteDriverLicense
 */
@WebServlet("/delete.dl")
public class DeleteDriverLicense extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDriverLicense() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		
		int mno = loginUser.getMemberNo();
		
		
		int result = new DriverLicenseService().deletemyDriverLicense(mno);
		
		if(result > 0) {
			request.setAttribute("currentMenu", "운전면허");
			request.getRequestDispatcher("views/mypage/myDriverLicense.jsp").forward(request, response);;
		}else {
			request.setAttribute("currentMenu", "마이페이지/운전면허");
			request.setAttribute("msg", "면허 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
