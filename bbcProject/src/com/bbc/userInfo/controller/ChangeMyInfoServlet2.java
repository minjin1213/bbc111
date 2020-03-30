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
 * Servlet implementation class ChangeMyInfoServlet2
 */
@WebServlet("/change2.ui")
public class ChangeMyInfoServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMyInfoServlet2() {
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
		int userNo = loginUser.getMemberNo();
	
		
		String userid = request.getParameter("userId");
		String userPwd = request.getParameter("Password");
		String phone = request.getParameter("Phone");
		String email = request.getParameter("userEmail");
		String userName = request.getParameter("Name");
		String zipcode = request.getParameter("address");
		String address = request.getParameter("detailAddress");
		String gender = request.getParameter("gender");
		
		UserInfo mem = new UserInfo();
		mem.setMemberId(userid);
		mem.setMemberPwd(userPwd);
		mem.setPhone(phone);
		mem.setMemberEmail(email);
		mem.setMemberName(userName);
		mem.setMemberZipcode(zipcode);
		mem.setMemberAddress(address);
		mem.setGender(gender);
		mem.setMemberNo(userNo);
		
		int result = new UserInfoService().updateUser(mem);
			
		if(result>0) {
			request.setAttribute("currentMenu", "회원정보수정");
			response.sendRedirect("view.ui");
		
		}else {
			
			request.setAttribute("msg", "회원수정실패");
			request.setAttribute("currentMenu", "회원정보수정");
			
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
