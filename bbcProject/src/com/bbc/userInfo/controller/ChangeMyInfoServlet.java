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
 * Servlet implementation class ChangeMyInfo
 */
@WebServlet("/change.ui")
public class ChangeMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMyInfoServlet() {
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

 		UserInfo mem = new UserInfoService().selectUser(userNo);
 		
 		if( mem != null) {
 			
 			request.setAttribute("mem", mem);
 			RequestDispatcher view = request.getRequestDispatcher("views/mypage/memInfoEdit.jsp");
 			view.forward(request, response);
 			
 		}else {
 			
 			request.setAttribute("msg", "조회에 실패했습니다.");
 			
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
