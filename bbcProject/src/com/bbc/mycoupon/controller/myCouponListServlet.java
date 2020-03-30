package com.bbc.mycoupon.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.mycoupon.model.service.MyCouponService;
import com.bbc.mycoupon.model.vo.MyCoupon;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class myCouponListServlet
 */
@WebServlet("/list.mc")
public class myCouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myCouponListServlet() {
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
		
		
		ArrayList<MyCoupon> couponlist = new MyCouponService().selectCouponList(userNo);
		
		request.setAttribute("currentMenu", "마이페이지/쿠폰함");
		
		request.setAttribute("couponlist", couponlist); //만들기 
		
		
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/couponList.jsp"); // 뿌리는것
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
