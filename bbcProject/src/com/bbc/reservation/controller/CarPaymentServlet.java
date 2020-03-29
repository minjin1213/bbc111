package com.bbc.reservation.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.driverlicense.model.service.DriverLicenseService;
import com.bbc.driverlicense.model.vo.DriverLicense;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class CarPaymentServlet
 */
@WebServlet("/carPayment.rv")
public class CarPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("UTF-8");
		
		String rentBrCode = request.getParameter("rentBrCode");
		String returnBrCode = request.getParameter("returnBrCode");
		String rentDate = request.getParameter("rentDate");
		String returnDate = request.getParameter("returnDate");
		String carPrice = request.getParameter("carPrice"); 
		String carNo = request.getParameter("carNo"); 
		String optionInfo = request.getParameter("optionInfo");
		String discountCate = request.getParameter("discountCate");
		String discountNo = request.getParameter("discountNo");
		String discountPrice = request.getParameter("discountPrice");
		String cwdTotalPrice = request.getParameter("cwdTotalPrice");
		String totalPrice = request.getParameter("totalPrice");
				
		String rentBrName = request.getParameter("rentBrName");
		String returnBrName = request.getParameter("returnBrName");
		String carName = request.getParameter("carName");
		String carImg = request.getParameter("carImg");
		String cwdPrice = request.getParameter("cwdPrice");
		String babySeatPrice = request.getParameter("babySeatPrice");
		
		HashMap<String, String> carInfoMap = new HashMap<String, String>();

		carInfoMap.put("rentBrCode", rentBrCode);
		carInfoMap.put("returnBrCode", returnBrCode);
		carInfoMap.put("rentDate", rentDate);
		carInfoMap.put("returnDate", returnDate);
		carInfoMap.put("carPrice", carPrice);
		carInfoMap.put("carNo", carNo);
		carInfoMap.put("optionInfo", optionInfo);
		carInfoMap.put("discountCate", discountCate);
		carInfoMap.put("discountNo", discountNo);
		carInfoMap.put("discountPrice", discountPrice);
		carInfoMap.put("cwdTotalPrice", cwdTotalPrice);
		carInfoMap.put("totalPrice", totalPrice);
				
		carInfoMap.put("rentBrName", rentBrName);
		carInfoMap.put("returnBrName", returnBrName);		
		carInfoMap.put("carName", carName);
		carInfoMap.put("carImg", carImg);
		carInfoMap.put("cwdPrice", cwdPrice);
		carInfoMap.put("babySeatPrice", babySeatPrice);			

		request.setAttribute("parentMenu", "차량예약^차량선택^옵션선택^정보입력");
		request.setAttribute("currentMenu", "결제");
		request.setAttribute("carInfo", carInfoMap);	
		request.getRequestDispatcher("views/reservation/reservationOption3.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
