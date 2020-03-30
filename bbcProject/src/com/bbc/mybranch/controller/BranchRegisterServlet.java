package com.bbc.mybranch.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.mybranch.model.service.MyBranchService;
import com.bbc.mybranch.model.vo.MyBranch;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class BranchRegisterServlet
 */
@WebServlet("/myBranch.mb")
public class BranchRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		
		
		HttpSession session = request.getSession();
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		

		
		int mno = loginUser.getMemberNo();
		
		
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		
		
		MyBranch mb = new MyBranch(mno, bno);
		
		int result = new MyBranchService().insertMyBranch(mb);
		
	
		
		if (result>0) {
			
				response.sendRedirect("areaSearch.mb");
				//request.getRequestDispatcher("views/mypage/myBranch.jsp").forward(request, response);담은게 없어서 안됨 서블릿 보내줘서 다른 서블릿이 처리하게 해야z
	
		}else {
			

			request.setAttribute("msg", "이미 등록되었습니다.");
			
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
