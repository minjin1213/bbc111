package com.bbc.reservation.controller;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.payment.model.service.PaymentService;
import com.bbc.payment.model.vo.Payment;
import com.bbc.reservation.model.service.ReservationService;
import com.bbc.reservation.model.vo.Reservation;
import com.bbc.userInfo.model.vo.UserInfo;

/**
 * Servlet implementation class InsertReservationServlet
 */
@WebServlet("/insertReservation.rv")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReservationServlet() {
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
		String oilRent = request.getParameter("oilRent");
		
		// 결재정보
		String payAmount = request.getParameter("payAmount"); 
		String payMethod = request.getParameter("payMethod"); 
		
		// 로그인하지 않은 경우의 처리프로세스  추가 필요
		int memberNo = ((UserInfo)request.getSession().getAttribute("loginUser")).getMemberNo();
						
		// 결재정보 테이블 생성
		Payment p = new Payment();
		p.setPayAmount(Integer.parseInt(payAmount));
		p.setPayMethod(payMethod);
		p.setMemberNo(memberNo);
		int presult = new PaymentService().insertPayment(p, memberNo);
		
		System.out.println("presult : " + presult);
				
		if(presult > 0) {
			
			// 추가된 결재정보 번호 알아오기
			ArrayList<Payment> list = new PaymentService().selectPaymentByMemberNo(memberNo);
			if(list == null) {
				request.setAttribute("msg", "결재정보 리스트 조회 오류");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}else {
				
				System.out.println(list.size());
				int payNo = list.get(0).getPayNo();						
				
				Reservation r = new Reservation();
				
				r.setMemberStatus("Y");
				r.setReservationStatus("1");
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
				java.util.Date rtdate = new java.util.Date();
				try {
					rtdate = (Date)sdf.parse(rentDate+":00");
					java.sql.Date sqlDate = new java.sql.Date(rtdate.getTime());
					r.setRentDate(sqlDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}			
				
				java.util.Date rndate = new java.util.Date();		
				try {
					rndate = (Date)sdf.parse(returnDate+":00");
					java.sql.Date sqlDate = new java.sql.Date(rndate.getTime());
					r.setReturnDate(sqlDate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
							
				r.setOption(optionInfo);
				r.setPrice(Integer.parseInt(carPrice));
				r.setDiscountCategory(discountCate);
				r.setDiscountNo(Integer.parseInt(discountNo));
				r.setDiscountPrice(Integer.parseInt(discountPrice));
				r.setCwdPrice(Integer.parseInt(carPrice));
				r.setTotalPrice(Integer.parseInt(totalPrice));
				
				r.setCarNo(Integer.parseInt(carNo));
				r.setMemberNo(memberNo);
				r.setBranchReservationNo(Integer.parseInt(rentBrCode));
				r.setBranchReturnNo(Integer.parseInt(returnBrCode));
				r.setPayNo(payNo);
						
				int result = new ReservationService().insertResevation(r);
				
				System.out.println("result : " + result);
				
				if(result > 0) {
					// 본인의 차량예약내역 페이지로 이동				
					response.sendRedirect("view.rv");
				}else {
					request.setAttribute("msg", "차량예약정보 저장 실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			}
												

		
		}else {
			request.setAttribute("msg", "차량예약정보 작성 실패-결재정보 저장 실패");
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
