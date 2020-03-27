package com.bbc.event.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.event.model.service.EventService;
import com.bbc.event.model.vo.Event;

/**
 * Servlet implementation class HelpEventDetailServlet
 */
@WebServlet("/detail.b.ev")
public class HelpEventDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpEventDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int eno = Integer.parseInt(request.getParameter("eno"));
		
		Event eList = new EventService().selectEvent(eno);
		
		if(eList != null) {
			request.setAttribute("eList", eList);
			request.getRequestDispatcher("views/branch/helpcenter/eventDetail.jsp").forward(request, response);
		} else {
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
