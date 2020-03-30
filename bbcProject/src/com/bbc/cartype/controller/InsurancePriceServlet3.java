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
 * Servlet implementation class InsurancePriceServlet3
 */
@WebServlet("/iPrice3.t.ct")
public class InsurancePriceServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsurancePriceServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sInsuCheck = request.getParameter("sInsuCheck");
		String mInsuCheck = request.getParameter("mInsuCheck");
		String lInsuCheck = request.getParameter("lInsuCheck");
		
		ArrayList<String> list = new ArrayList<>();
		list.add(sInsuCheck);
		list.add(mInsuCheck);
		list.add(lInsuCheck);
		
		int sInsurance = Integer.parseInt(request.getParameter("s-insurance1"));
		int mInsurance= Integer.parseInt(request.getParameter("m-insurance1"));
		int lInsurance = Integer.parseInt(request.getParameter("l-insurance1"));
		
		CarType c = new CarType();
		c.setRentInsuType1(sInsurance);
		c.setRentInsuType2(mInsurance);
		c.setAccidentExemption(lInsurance);
		
		int result = new CarTypeService().adminInsuranceUpdate3(c, list);
		
		if(result > 0) {
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
