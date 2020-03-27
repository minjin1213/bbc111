package com.bbc.coupon.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.coupon.model.service.CouponService;
import com.bbc.coupon.model.vo.Coupon;

/**
 * Servlet implementation class AdminCouponAddServlet
 */
@WebServlet("/addCoupon.t.co")
public class AdminCouponAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCouponAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("coupon-title");
		int couponV = Integer.parseInt(request.getParameter("couponV"));
		int couponDc = Integer.parseInt(request.getParameter("couponDc"));
		int loginUser = Integer.parseInt(request.getParameter("loginUser"));
		
		 Coupon c = new Coupon(); 
		 c.setCouponName(title); 
		 c.setCouponGive(couponV);
		 c.setCouponDc(couponDc); 
		 c.setMemberNo(loginUser);
		 
		 int result = new CouponService().adminCouponAdd(c);
		  
		 if(result > 0) { HttpSession session = request.getSession();
		 session.setAttribute("addCoupon", "쿠폰 등록이 완료되었습니다.");
		 response.sendRedirect("list.t.co"); }else { request.setAttribute("msg", "쿠폰 등록에 실패했습니다.");
		 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response); }
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
