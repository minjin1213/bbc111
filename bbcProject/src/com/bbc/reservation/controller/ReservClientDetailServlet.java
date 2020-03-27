package com.bbc.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.payment.model.vo.Payment;
import com.bbc.reservation.model.service.ReservationService;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class ReservClientDetailServlet
 */
@WebServlet("/reservClientDetail.b.rv")
public class ReservClientDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservClientDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("nno"));
		
		UserInfo ui = new ReservationService().selectReservDetailMember(no);
		ArrayList<Payment> list = new ReservationService().selectReservDetailPay(no);
		
		request.setAttribute("ui", ui);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/branch/reservmanagement/reservClientDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
