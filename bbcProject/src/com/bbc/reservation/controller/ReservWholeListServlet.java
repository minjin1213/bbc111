package com.bbc.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.common.PageTemplate;
import com.bbc.common.page.vo.PageInfo;
import com.bbc.reservation.model.service.ReservationService;
import com.bbc.reservation.model.vo.Reservation;
import com.google.gson.Gson;

/**
 * Servlet implementation class ReservWholeListServlet
 */
@WebServlet("/wholeList.b.rv")
public class ReservWholeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservWholeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount;			// 총 게시글 갯수
		int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
		
		listCount = new ReservationService().getListCount();
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		PageInfo pi = PageTemplate.getPageInfo(listCount, currentPage);
		
		String fr = request.getParameter("fr");
		int st = Integer.parseInt(request.getParameter("st"));

		ArrayList<Reservation> wholeList = new ReservationService().selectWholeList(pi, st);
		
		request.setAttribute("pi", pi);
				
		if(fr.equals("menu")) {
			request.setAttribute("wholeList", wholeList);
			request.getRequestDispatcher("views/branch/reservmanagement/wholeList.jsp").forward(request, response);
		} else {
			response.setContentType("application/json; charset=utf-8");
			
			Gson gson = new Gson();
			gson.toJson(wholeList, response.getWriter());

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
