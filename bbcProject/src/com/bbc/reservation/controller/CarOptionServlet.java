package com.bbc.reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CarOptionServlet
 */
@WebServlet("/carOption.rv")
public class CarOptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarOptionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
					
		int rent_branch = Integer.parseInt(request.getParameter("rent_branch"));
		int return_branch = Integer.parseInt(request.getParameter("return_branch"));
		String rent_branchnm = request.getParameter("rent_branchnm");
		String return_branchnm = request.getParameter("return_branchnm");
		String rentDate = request.getParameter("rentDate");
		String returnDate = request.getParameter("returnDate");
		String carname = request.getParameter("carname");
		String carimg = request.getParameter("carimg");
		int carpay = Integer.parseInt(request.getParameter("carpay"));
		
		int carno = Integer.parseInt(request.getParameter("carno"));		
				
		request.setAttribute("parentMenu", "차량예약^차량선택");
		request.setAttribute("currentMenu", "옵션선택");		
		
		request.setAttribute("rent_branch", rent_branch);
		request.setAttribute("return_branch", return_branch);
		request.setAttribute("rent_branchnm", rent_branchnm);
		request.setAttribute("return_branchnm", return_branchnm);
		request.setAttribute("rentDate", rentDate);
		request.setAttribute("returnDate", returnDate);
		request.setAttribute("carname", carname);
		request.setAttribute("carimg", carimg);
		request.setAttribute("carpay", carpay);
		request.setAttribute("carno", carno);
		
		request.getRequestDispatcher("views/reservation/reservationOption1.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
