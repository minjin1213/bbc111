package com.bbc.cartype.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.cartype.model.service.CarTypeService;
import com.bbc.cartype.model.vo.CarType;

/**
 * Servlet implementation class InsurancePriceServlet
 */
@WebServlet("/iPrice1.t.ct")
public class InsurancePriceServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsurancePriceServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//// 체크박스 상태값 받기
		// 보험료 부분
		String sInsuCheck = request.getParameter("sInsuCheck");
		String mInsuCheck = request.getParameter("mInsuCheck");
		String lInsuCheck = request.getParameter("mInsuCheck");
		// 면책금 부분
		String sAcciCheck = request.getParameter("sAcciCheck");
		String mAcciCheck = request.getParameter("mAcciCheck");
		String lAcciCheck = request.getParameter("lAcciCheck");
		// 휴차료 부분
		String stopCheck = request.getParameter("stopCheck");
		// ------------------ 전달 상태 확인
//		System.out.println(sInsuCheck);
//		System.out.println(mInsuCheck);
//		System.out.println(lInsuCheck);
//		System.out.println(sAcciCheck);
//		System.out.println(mAcciCheck);
//		System.out.println(lAcciCheck);
//		System.out.println(sStopCheck);
//		System.out.println(mStopCheck);
//		System.out.println(lStopCheck);
		// ----------- 체크값 상태 전달 잘 넘어옴
		
		
		// input박스 value값 받기
		// 보험료 전달 부분
		int sInsurance = Integer.parseInt(request.getParameter("s-insurance1"));
		int mInsurance = Integer.parseInt(request.getParameter("m-insurance1"));
		int lInsurance = Integer.parseInt(request.getParameter("l-insurance1"));
		// 면책금 전달 부분
		int sAccident = Integer.parseInt(request.getParameter("s-accident1"));
		int mAccident = Integer.parseInt(request.getParameter("m-accident1"));
		int lAccident = Integer.parseInt(request.getParameter("l-accident1"));
		// 휴차료 부분
		int stopDay = Integer.parseInt(request.getParameter("stopDay"));
		// ---------------------- 전달 상태확인
//		System.out.println(sInsurance);
//		System.out.println(mInsurance);
//		System.out.println(lInsurance);
//		System.out.println(sAccident);
//		System.out.println(stopDay);
//		System.out.println(mAccident);
//		System.out.println(lAccident);
//		System.out.println(sStopDay);
//		System.out.println(mStopDay);
//		System.out.println(lStopDay);
		// ---------------------- value값 잘 넘어 옴
		
		
		// 체크값 상태로 선택한 열 업데이트 할 수 있게끔 체크값 담아주는 ArrayList 생성
		// 보험, 면책금으로 나눠서 생성
		ArrayList<String> list1 = new ArrayList<>();
		list1.add(sInsuCheck);
		list1.add(mInsuCheck);
		list1.add(lInsuCheck);
		ArrayList<String> list2 = new ArrayList<>();
		list2.add(sAcciCheck);
		list2.add(mAcciCheck);
		list2.add(lAcciCheck);
		// ---------------------- 저장 상태확인
//		System.out.println(list1);
//		System.out.println(list2);
//		System.out.println(list3);
		// ---------------------- 정상 저장 확인
		
		
		// DB로 넘기기 위해 update값들 CarType 객체에 저장
		// 보험, 면책금으로 나눠서 저장
		CarType c1 = new CarType();
		c1.setRentInsuType1(sInsurance);
		c1.setRentInsuType2(mInsurance);
		c1.setAccidentExemption(lInsurance);
		CarType c2 = new CarType();
		c2.setAccidentPriceType1(sAccident);
		c2.setAccidentPriceType2(mAccident);
		c2.setAccidentPriceType3(lAccident);
		// ------------------------ 저장 상태 확인
//		System.out.println(c1);
//		System.out.println(c2);
		// ------------------------ 정상 저장 확인
		
		
		// update를 위해 Service - Dao 전달
		int result = new CarTypeService().adminInsuranceUpdate(c1, c2, list1, list2);
		
		// 휴차료는 따로 진행
		if(stopCheck != null) {
			new CarTypeService().adminStopUpdate(stopDay);			
		}
		
		
		// 처리결과 상태에 따라 페이지 이동
		if(result > 0) {
			// 성공한 case
			response.sendRedirect("price.t.ct");
		}else {
			// 실패한 case
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
