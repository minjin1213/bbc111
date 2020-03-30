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
 * Servlet implementation class FindMyIdServlet2
 */
@WebServlet("/findmyid2.ui")
public class FindMyIdServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMyIdServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
	
		// 이메일로 받아올경우 
		if (request.getParameter("email") != null) {
	
			String email = request.getParameter("email");
			String name = request.getParameter("NameE");
			UserInfo findId = new UserInfoService().findMyIdEmail(name,email);
		
			if(findId != null) {
				request.setAttribute("currentMenu", "아이디찾기");
				request.setAttribute("findId", findId);
				
				request.getRequestDispatcher("views/mypage/afterFindmyId.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "아이디 찾기 실패");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
		
		}
		
		// 휴대폰으로 받아올경우 	
		if(request.getParameter("phone") != null){
			String phone = request.getParameter("phone");
			String name = request.getParameter("NameP");

			UserInfo findId = new UserInfoService().findMyIdPhone(name,phone);
			
			System.out.println(phone);
			System.out.println(name);
			System.out.println(findId);
				
			if(findId != null) {
				request.setAttribute("currentMenu", "아이디찾기");
				request.setAttribute("findId", findId);
				
				RequestDispatcher view = request.getRequestDispatcher("views/mypage/afterFindmyId.jsp");
				view.include(request, response);
				
			}else {
				request.setAttribute("msg", "아이디 찾기 실패");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
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
