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
 * Servlet implementation class ReservReturnManageServlet
 */
@WebServlet("/returnManage.b.rv")
public class ReservReturnManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservReturnManageServlet() {
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
		int st = (Integer.parseInt(request.getParameter("st")));
//		int branch=21;
		
		ArrayList<Reservation> rentList = new ReservationService().selectRentList(pi, st);
		
		if(fr.equals("menu")) {	// 사이드바 메뉴에서 클릭시 보여지는 대여중 리스트
			request.setAttribute("rentList", rentList);
			request.setAttribute("pi", pi);
			
			request.getRequestDispatcher("views/branch/reservmanagement/returnManage.jsp").forward(request, response);
		
		} else {	// 탭 메뉴 반납완료 (ajax 반환)
			
			response.setContentType("application/json; charset=utf-8"); 
			
//			HashMap<String, Object> map = new HashMap<>();
//			map.put("rentList", rentList);
//			map.put("pi", pi);
			
			Gson gson = new Gson();
			//gson.toJson(rentList, response.getWriter());
			gson.toJson(rentList, response.getWriter());
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
