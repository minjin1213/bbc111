package com.bbc.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.driverlicense.model.service.DriverLicenseService;
import com.bbc.driverlicense.model.vo.DriverLicense;



/**
 * Servlet implementation class CarInfoServlet
 */
@WebServlet("/carInfo.rv")
public class CarInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int rentBrCode = Integer.parseInt(request.getParameter("rentBrCode"));
		int returnBrCode = Integer.parseInt(request.getParameter("returnBrCode"));
		String rentDate = request.getParameter("rentDate");
		String returnDate = request.getParameter("returnDate");
		int carPrice = Integer.parseInt(request.getParameter("carPrice")); 
		int carNo = Integer.parseInt(request.getParameter("carNo")); 
		String optionInfo = request.getParameter("optionInfo");
		String discountCate = request.getParameter("discountCate");
		int discountNo = Integer.parseInt(request.getParameter("discountNo"));
		int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
		int cwdTotalPrice = Integer.parseInt(request.getParameter("cwdTotalPrice"));
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
		
		String rentBrName = request.getParameter("rentBrName");
		String returnBrName = request.getParameter("returnBrName");
		String carName = request.getParameter("carName");
		String carImg = request.getParameter("carImg");
		int cwdPrice = Integer.parseInt(request.getParameter("cwdPrice"));
		int babySeatPrice = Integer.parseInt(request.getParameter("babySeatPrice"));
		
		// 메뉴정보 셋팅
		request.setAttribute("parentMenu", "차량예약^차량선택^옵션선택");
		request.setAttribute("currentMenu", "정보입력");
		
		// 전달값 셋팅
		request.setAttribute("rentBrCode", rentBrCode);
		request.setAttribute("returnBrCode", returnBrCode);
		request.setAttribute("rentDate", rentDate);
		request.setAttribute("returnDate", returnDate);
		request.setAttribute("carPrice", carPrice);
		request.setAttribute("carNo", carNo);
		request.setAttribute("optionInfo", optionInfo);
		request.setAttribute("discountCate", discountCate);
		request.setAttribute("discountNo", discountNo);
		request.setAttribute("discountPrice", discountPrice);
		request.setAttribute("cwdTotalPrice", cwdTotalPrice);
		request.setAttribute("totalPrice", totalPrice);
		
		request.setAttribute("rentBrName", rentBrName);
		request.setAttribute("returnBrName", returnBrName);		
		request.setAttribute("carName", carName);
		request.setAttribute("carImg", carImg);
		request.setAttribute("cwdPrice", cwdPrice);
		request.setAttribute("babySeatPrice", babySeatPrice);
		
		// 운전면허 등록정보 가져오기
		//int memberId = Integer.parseInt(request.getParameter("memberId"));
		int memberId = 81;
		DriverLicense d = new DriverLicenseService().selectByMemberId(memberId);
		
		if(d != null) {
			request.setAttribute("d", d);
			request.getRequestDispatcher("views/reservation/reservationOption2.jsp").forward(request, response);
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
