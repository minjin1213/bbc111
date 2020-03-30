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
 * Servlet implementation class PriceInfoPageServlet
 */
@WebServlet("/price.t.ct")
public class PriceInfoPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PriceInfoPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<CarType> list1 = new CarTypeService().adminPriceSelectList1();
		ArrayList<CarType> list2 = new CarTypeService().adminPriceSelectList2();
		ArrayList<CarType> list3 = new CarTypeService().adminPriceSelectList3();
		
		System.out.println(list1);
		System.out.println(list2);
		System.out.println(list3);
		
		if(list1.isEmpty() && list2.isEmpty() && list3.isEmpty()) {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}else {
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.getRequestDispatcher("views/admin/car/priceInfo.jsp").forward(request, response);			
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
