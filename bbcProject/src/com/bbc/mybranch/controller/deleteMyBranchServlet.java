package com.bbc.mybranch.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.mybranch.model.service.MyBranchService;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class deleteMyBranchServlet
 */
@WebServlet("/deletemb.mb")
public class deleteMyBranchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMyBranchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		
		int userno = loginUser.getMemberNo();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result = new MyBranchService().deleteMyBranch(userno, bno);
		
		if(result > 0) {
			response.sendRedirect("areaSearch.mb");
		}else {
			request.setAttribute("msg", "내지점삭제 실패");
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
