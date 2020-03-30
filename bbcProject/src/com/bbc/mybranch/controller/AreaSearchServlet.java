package com.bbc.mybranch.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.area.model.service.AreaService;
import com.bbc.area.model.vo.Area;
import com.bbc.mybranch.model.service.MyBranchService;
import com.bbc.mybranch.model.vo.MyBranch;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class AreaSearchServlet
 */
@WebServlet("/areaSearch.mb")
public class AreaSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AreaSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setCharacterEncoding("UTF-8");
	
		
		HttpSession session = request.getSession();
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		int userNo = loginUser.getMemberNo();
		
		
		
		ArrayList<Area> list = new AreaService().selectList();	
		
		
		request.setAttribute("list", list);
		request.setAttribute("currentMenu", "마이페이지/나의지점");
		

		ArrayList<MyBranch> branchlist = new MyBranchService().selectBranchList(userNo);
		
		
		request.setAttribute("branchlist", branchlist);
		request.setAttribute("currentmenu", "마이페이지/나의지점");
		
		RequestDispatcher view  = request.getRequestDispatcher("views/mypage/myBranch.jsp"); 
		view.include(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
