package com.bbc.userInfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.userInfo.model.service.UserInfoService;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login.ui")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("userId");
		String memberPwd = request.getParameter("userPwd");
	
			
		UserInfo loginUser = new UserInfoService().loginUserInfo(memberId, memberPwd);
		
		int auth = loginUser.getAuthorityNo();
	
		 
		if(loginUser != null) {
			
			if(auth == 0) {    // 일반 사용자 
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				response.sendRedirect(request.getContextPath());
			}else if(auth == 1) // 지점관리자
			{
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				request.getRequestDispatcher("views/branch/common/branchmain.jsp").forward(request, response);
			}else if(auth ==2) { // 통합관리자
				HttpSession session = request.getSession();
	            session.setAttribute("loginUser", loginUser);
	            request.getRequestDispatcher("views/admin/common/admin.jsp").forward(request, response);
			}
			
		}else {
				request.setAttribute("msg", "로그인 실패");
				request.setAttribute("currentMenu", "로그인");
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
