package com.bbc.cartype.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.cartype.model.service.CarTypeService;
import com.bbc.cartype.model.vo.CarType;

/**
 * Servlet implementation class CarPriceServlet
 */
@WebServlet("/cPrice.t.ct")
public class CarPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarPriceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 차량금액 체크값 수신
		String sDayCheck = request.getParameter("sDayCheck");
		String mDayCheck = request.getParameter("mDayCheck");
		String lDayCheck = request.getParameter("lDayCheck");
		// 시간당 초과 요금 체크값 수신
		String sOverCheck = request.getParameter("sOverCheck");
		String mOverCheck = request.getParameter("mOverCheck");
		String lOverCheck = request.getParameter("lOverCheck");
		// 알뜰카 대여료 체크값 수신
		String sCarCheck = request.getParameter("sCarCheck");
		String mCarCheck = request.getParameter("mCarCheck");
		String lCarCheck = request.getParameter("lCarCheck");
		
		// 차량 금액
		// 경차, 준중형, 중형
		int sDay1 = Integer.parseInt(request.getParameter("s-day1"));
		int sDay6 = Integer.parseInt(request.getParameter("s-day6"));
		int sDay7 = Integer.parseInt(request.getParameter("s-day7"));
		
		// 준대형, 승합/RV
		int mDay1 = Integer.parseInt(request.getParameter("m-day1"));
		int mDay6 = Integer.parseInt(request.getParameter("m-day6"));
		int mDay7 = Integer.parseInt(request.getParameter("m-day7"));
		
		// 대형, 수입차량
		int lDay1 = Integer.parseInt(request.getParameter("l-day1"));
		int lDay6 = Integer.parseInt(request.getParameter("l-day6"));
		int lDay7 = Integer.parseInt(request.getParameter("l-day7"));
		
		
		// 시간당 초과 요금
		// 경차, 준중형, 중형
		int sOver1 = Integer.parseInt(request.getParameter("s-over1"));
		int sOver6 = Integer.parseInt(request.getParameter("s-over6"));
		int sOver7 = Integer.parseInt(request.getParameter("s-over7"));
		
		// 준대형, 승합/RV
		int mOver1 = Integer.parseInt(request.getParameter("m-over1"));
		int mOver6 = Integer.parseInt(request.getParameter("m-over6"));
		int mOver7 = Integer.parseInt(request.getParameter("m-over7"));
		
		// 대형, 수입차량
		int lOver1 = Integer.parseInt(request.getParameter("l-over1"));
		int lOver6 = Integer.parseInt(request.getParameter("l-over6"));
		int lOver7 = Integer.parseInt(request.getParameter("l-over7"));
		
		// 알뜰카 대여료
		// 경차, 준중형, 중형
		int sCar = Integer.parseInt(request.getParameter("s-car1"));
		// 준대형, 승합/RV
		int mCar = Integer.parseInt(request.getParameter("m-car1"));
		// 대형, 수입차량
		int lCar = Integer.parseInt(request.getParameter("l-car1"));

		
		CarType c1 = new CarType();
		CarType c2 = new CarType();
		CarType c3 = new CarType();
		
		//// 차량금액 선택했을 경우 실행 부분
		// 경차, 준중형, 준형 선택했을 경우
		c1.setRent1D(sDay1);
		c1.setRent1D6D(sDay6);
		c1.setRent7DP(sDay7);
		// 준대형, 승합/RV
		c2.setRent1D(mDay1);
		c2.setRent1D6D(mDay6);
		c2.setRent7DP(mDay7);
		// 대형, 수입차량
		c3.setRent1D(lDay1);
		c3.setRent1D6D(lDay6);
		c3.setRent7DP(lDay7);
		
		//// 초과 시간당 요금 선택했을 경우 실행 부분
		// 경차, 준중형, 준형
		c1.setOver6T(sOver1);
		c1.setOver9T(sOver6);
		c1.setOver12T(sOver7);
		// 준대형, 승합/RV
		c2.setOver6T(mOver1);
		c2.setOver9T(mOver6);
		c2.setOver12T(mOver7);
		// 대형, 수입차량
		c3.setOver6T(lOver1);
		c3.setOver9T(lOver6);
		c3.setOver12T(lOver7);
		
		//// 알뜰카 대여로 선택했을 경우 실행 부분
		// 경차, 준중형, 준형
		c1.setMemberCar(sCar);
		// 준대형, 승합/RV
		c2.setMemberCar(mCar);
		// 대형, 수입차량
		c3.setMemberCar(lCar);
		
		// 체크값 저장할 ArrayList 사용
		ArrayList<String> list1 = new ArrayList<>();
		list1.add(sDayCheck);
		list1.add(sOverCheck);
		list1.add(sCarCheck);
		
		ArrayList<String> list2 = new ArrayList<>();
		list2.add(mDayCheck);
		list2.add(mOverCheck);
		list2.add(mCarCheck);
		
		ArrayList<String> list3 = new ArrayList<>();
		list3.add(lDayCheck);
		list3.add(lOverCheck);
		list3.add(lCarCheck);
		
		int result = new CarTypeService().adminCarPrice(c1, c2, c3, list1, list2, list3);
			
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("priceU", "차량 금액 정보 수정에 성공했습니다.");
			response.sendRedirect("price.t.ct");
		}else {
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
