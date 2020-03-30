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
import com.bbc.event.model.service.EventService;
import com.bbc.event.model.vo.Event;
import com.bbc.notice.model.service.NoticeService;
import com.bbc.notice.model.vo.Notice;

/**
 * Servlet implementation class ReservationPreServlet
 */
@WebServlet("/reservationPre.rv")
public class ReservationPreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationPreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 이벤트 리스트 가져오기
		ArrayList<Event> elist = new EventService().selectListRv();
						
		// 공지사항 리스트 가져오기
		ArrayList<Notice> nlist = new NoticeService().selectListRv();
			
		// 지점관리 지역리스트 가져오기
		ArrayList<Area> list = new AreaService().selectList();
		
		request.setAttribute("parentMenu", "차량예약");
		request.setAttribute("currentMenu", "차량선택");
		
		// 이전페이지에서 넘겨준 값(차량옵션페이지에서 이전페이지를 호출한 경우)						
		request.setAttribute("rent_branch", request.getParameter("rent_branch"));
		request.setAttribute("return_branch", request.getParameter("return_branch"));
		request.setAttribute("rent_branchnm", request.getParameter("rent_branchnm"));
		request.setAttribute("return_branchnm", request.getParameter("return_branchnm"));
		request.setAttribute("rentDate", request.getParameter("rentDate"));
		request.setAttribute("returnDate", request.getParameter("returnDate"));
		request.setAttribute("carno", request.getParameter("carno"));
		request.setAttribute("carType", request.getParameter("carType"));
		request.setAttribute("preLink", "Y");
		
		request.setAttribute("elist", elist);
		request.setAttribute("nlist", nlist);
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
