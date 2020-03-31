package com.bbc.cartype.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.cartype.model.service.CarTypeService;
import com.bbc.cartype.model.vo.CarType;

/**
 * Servlet implementation class InsurancePriceServlet2
 */
@WebServlet("/iPrice2.t.ct")
public class InsurancePriceServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsurancePriceServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sInsuCheck = request.getParameter("sIncuCheck");
		String mInsuCheck = request.getParameter("mIncuCheck");
		String lInsuCheck = request.getParameter("lIncuCheck");
		String sAcciCheck = request.getParameter("sAcciCheck");
		String mAcciCheck = request.getParameter("mAcciCheck");
		String lAcciCheck = request.getParameter("lAcciCheck");
		String stopCheck = request.getParameter("stopCheck");
		
		ArrayList<String> list1 = new ArrayList<>();
		list1.add(sInsuCheck);
		list1.add(mInsuCheck);
		list1.add(lInsuCheck);
		ArrayList<String> list2 = new ArrayList<>();
		list2.add(sAcciCheck);
		list2.add(mAcciCheck);
		list2.add(lAcciCheck);
		
		int sInsurance = Integer.parseInt(request.getParameter("s-insurance1"));
		int mInsurance = Integer.parseInt(request.getParameter("m-insurance1"));
		int lInsurance = Integer.parseInt(request.getParameter("l-insurance1"));
		int sAccident = Integer.parseInt(request.getParameter("s-accident1"));
		int mAccident = Integer.parseInt(request.getParameter("m-accident1"));
		int lAccident = Integer.parseInt(request.getParameter("l-accident1"));
		int stopDay = Integer.parseInt(request.getParameter("stopDay"));
		
		CarType c1 = new CarType();
		c1.setRentInsuType1(sInsurance);
		c1.setRentInsuType2(mInsurance);
		c1.setAccidentExemption(lInsurance);
		CarType c2 = new CarType();
		c2.setAccidentPriceType1(sAccident);
		c2.setAccidentPriceType2(mAccident);
		c2.setAccidentPriceType3(lAccident);
		
		if(stopCheck != null) {
			new CarTypeService().adminStopUpdate2(stopDay);
		}
		
		int result = new CarTypeService().adminInsuranceUpdate2(c1, c2, list2, list2);
		
		if(result > 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('보험유형2 금액 업데이트가 완료되었습니다.'); location.href='price.t.ct';</script>");
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
