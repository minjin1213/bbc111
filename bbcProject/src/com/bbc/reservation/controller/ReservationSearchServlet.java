package com.bbc.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.area.model.service.AreaService;
import com.bbc.area.model.vo.Area;

/**
 * Servlet implementation class ReservationSearchServlet
 */			  
@WebServlet("/reservationSearch.rv")
public class ReservationSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* parentMenu가 없으면 널값으로 셋팅, 여러 단계인 경우 ^로 구분 */

		ArrayList<Area> list = new AreaService().selectList();
		
		request.setAttribute("parentMenu", "차량예약");
		request.setAttribute("currentMenu", "차량선택");
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/reservation/reservationSearchForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
