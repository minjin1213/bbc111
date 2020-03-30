package com.bbc.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.reservation.model.service.ReservationService;
import com.bbc.reservation.model.vo.Reservation;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class ReservationListServlet
 */
@WebServlet("/view.rv")
public class CarRentHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarRentHistoryServlet() {
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
		
		ArrayList<Reservation> totalList = new ReservationService().selectTotalReservationList(userNo);
	
		request.setAttribute("currentMenu", "마이페이지/차량이용내역");
		
		request.setAttribute("totalList", totalList);
		
		RequestDispatcher view = request.getRequestDispatcher("views/mypage/rentalHistory.jsp");
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
