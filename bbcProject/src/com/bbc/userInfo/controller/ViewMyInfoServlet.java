package com.bbc.userInfo.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ViewMyInfoServlet
 */
@WebServlet("/view.ui")
public class ViewMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewMyInfoServlet() {
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
		
		ArrayList<UserInfo> info = new UserInfoService().viewMyInfo(userNo);
	
		
		if(info != null) {
			request.setAttribute("info", info);
			request.setAttribute("currentMenu", "마이페이지/회원정보");
			RequestDispatcher view = request.getRequestDispatcher("views/mypage/memInfo.jsp"); // 뿌리는것
			view.forward(request, response);
		
		} else {
			
			request.setAttribute("msg", "조회 실패");
			request.setAttribute("currentMenu", "마이페이지/회원정보");
			
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
