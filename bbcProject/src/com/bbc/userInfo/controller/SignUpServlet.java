package com.bbc.userInfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.userInfo.model.service.UserInfoService;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class SignUpFormServlet
 */
@WebServlet("/insert.ui")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("Password");
		String phone = request.getParameter("Phone");
		String rrn = request.getParameter("RRN");
		String email = request.getParameter("userEmail");
		String userName = request.getParameter("Name");
		String zipcode = request.getParameter("address");
		String address = request.getParameter("detailAddress");
		String gender = request.getParameter("gender");
		
		UserInfo mem = new UserInfo(userId,userPwd, userName, zipcode, address, phone, rrn, email, gender);
												                 
		int result = new UserInfoService().insertUser(mem);
		
		if(result>0) {
			request.setAttribute("currentMenu", "회원가입");
			response.sendRedirect(request.getContextPath());
			
		}else {
			
			request.setAttribute("msg", "회원가입 실패!");
			request.setAttribute("currentMenu", "회원가입");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
			
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
