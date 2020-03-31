package com.bbc.reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.coupon.model.service.CouponService;
import com.bbc.coupon.model.vo.Coupon;
import com.bbc.event.model.service.EventService;
import com.bbc.event.model.vo.Event;
import com.bbc.mycoupon.model.service.MyCouponService;
import com.bbc.mycoupon.model.vo.MyCoupon;
import com.bbc.userInfo.model.vo.UserInfo;

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
		
		//request.setCharacterEncoding("UTF-8");
		
		// 이전페이지에서 넘겨준 값
		String rentBrCode = request.getParameter("rent_branch");
		String returnBrCode = request.getParameter("return_branch");
		String rentDate = request.getParameter("rentDate");
		String returnDate = request.getParameter("returnDate");
		String carPrice = request.getParameter("carpay");
		String carNo = request.getParameter("carno");
		
		String rentBrName = request.getParameter("rent_branchnm");
		String returnBrName = request.getParameter("return_branchnm");		
		String carName = request.getParameter("carname");
		String carImg = request.getParameter("carimg");
		
		String carType = request.getParameter("carType");
		
		// 보험금액정보
		String accidentPrice1 = request.getParameter("accidentPrice1"); 	// 5만원
		String accidentPrice2 = request.getParameter("accidentPrice2");		// 30만원
		String rentInsuPrice1 = request.getParameter("rentInsuPrice1");		// 12000
		String rentInsuPrice2 = request.getParameter("rentInsuPrice1");		// 10000
		String exemptionPrice = request.getParameter("rentInsuPrice1");		// 20000(고객부담금면제)
		
		// 기타옵션
		String navigation = request.getParameter("navigation");				// 1
		String babySeat = request.getParameter("babySeat");					// 1
				
		// 이벤트 정보 가져오기
		ArrayList<Event> elist = new EventService().selectListBranch(Integer.parseInt(rentBrCode)); 
								
		// 나의쿠폰번호 가져오기
		int memberNo = ((UserInfo)request.getSession().getAttribute("loginUser")).getMemberNo();
		ArrayList<MyCoupon> clist = new MyCouponService().selectByMemberNo(memberNo);
			
		// 쿠폰리스트 가져오기
		ArrayList<Coupon> myclist = new ArrayList<>();
		if(clist != null) {
			for(int i=0; i<clist.size(); i++) {
				
				// 쿠폰리스트 가져오기
				Coupon cp = new CouponService().selectListByCoupon(clist.get(i).getCouponNo());
				System.out.println(cp);
				if(cp != null) {
					myclist.add(cp);
				}
			}
		}
								
		// 전체정보 담기
		HashMap<String, String> carOptionMap = new HashMap<String, String>();		
		carOptionMap.put("rentBrCode", rentBrCode);
		carOptionMap.put("returnBrCode", returnBrCode);
		carOptionMap.put("rentDate", rentDate);
		carOptionMap.put("returnDate", returnDate);
		carOptionMap.put("carPrice", carPrice);
		carOptionMap.put("carNo", carNo);
		
		carOptionMap.put("rentBrName", rentBrName);
		carOptionMap.put("returnBrName", returnBrName);
		carOptionMap.put("carName", carName);
		carOptionMap.put("carImg", carImg);
		
		carOptionMap.put("accidentPrice1", accidentPrice1);
		carOptionMap.put("accidentPrice2", accidentPrice2);
		carOptionMap.put("rentInsuPrice1", rentInsuPrice1);
		carOptionMap.put("rentInsuPrice2", rentInsuPrice2);
		carOptionMap.put("exemptionPrice", exemptionPrice);
		
		carOptionMap.put("navigation", navigation);
		carOptionMap.put("babySeat", babySeat);
		carOptionMap.put("carType", carType);
				
		request.setAttribute("parentMenu", "차량예약^차량선택");
		request.setAttribute("currentMenu", "옵션선택");
		request.setAttribute("carOption", carOptionMap);	
		request.setAttribute("elist", elist);
		request.setAttribute("myclist", myclist);
		
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
