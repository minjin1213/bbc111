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
 * Servlet implementation class FindMyPwServlet3
 */
@WebServlet("/updatepw.ui")
public class FindMyPwServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMyPwServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String newPw = request.getParameter("newpw");
		String id = request.getParameter("id");
		
		
		UserInfo mem = new UserInfo();
		mem.setMemberPwd(newPw);
		mem.setMemberId(id);
		
		
		int result = new UserInfoService().updatePw(mem);
		
		
		if(result>0) {
			
			response.sendRedirect(request.getContextPath());
		
		}else {
			
			request.setAttribute("msg", "비밀번호 업데이트 실패");
			request.setAttribute("churrentMenu", "비밀번호수정");
			
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
