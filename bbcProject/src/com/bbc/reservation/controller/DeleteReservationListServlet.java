package com.bbc.reservation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.reservation.model.service.ReservationService;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class DeleteReservationListServlet
 */
@WebServlet("/delete.rv")
public class DeleteReservationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReservationListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		
		int userno = loginUser.getMemberNo();
		
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		int result = new ReservationService().deletemyReservation(userno,rno);
		
		if(result > 0 ) {
				response.sendRedirect("viewReservation.rv");
		} else {
			request.setAttribute("msg", "예약삭제 실패");
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
