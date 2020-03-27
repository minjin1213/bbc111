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
 * Servlet implementation class AdminCouponUpdateServlet
 */
@WebServlet("/update.t.co")
public class AdminCouponUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCouponUpdateServlet() {
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
		int conponNo = Integer.parseInt(request.getParameter("couponNo"));
		
		Coupon c = new Coupon();
		c.setCouponName(title);
		c.setCouponGive(couponV);
		c.setCouponDc(couponDc);
		c.setCouponNo(conponNo);
		
		int result = new CouponService().adminUPdateCoupon(c);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("updateC", "쿠폰 수정이 완료되었습니다");
			response.sendRedirect("list.t.co");
		}else {
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
