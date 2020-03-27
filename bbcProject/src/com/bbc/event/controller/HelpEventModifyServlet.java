package com.bbc.event.controller;

import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.event.model.service.EventService;
import com.bbc.event.model.vo.Event;

/**
 * Servlet implementation class HelpEventModifyServlet
 */
@WebServlet("/modifyEvent.b.ev")
public class HelpEventModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpEventModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				
		String title = request.getParameter("title");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int rate = Integer.parseInt(request.getParameter("rate"));
		String content = request.getParameter("content");
//		
//		System.out.println(startDate);
//		System.out.println(endDate);
		
		Event e = new Event();
		
		e.setEventTitle(title);
//		e.setEventStartDate(startDate);
//		e.setEventEndDate(endDate);
		e.setDiscountRate(rate);
		e.setEventContent(content);
		
//		int result = new EventService().updateEvent(e);
//		
//		if(result > 0) {
//			
//		} else {
//			
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
