package com.bbc.carinfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.carinfo.model.service.CarInfoService;
import com.bbc.carinfo.model.vo.CarInfo;
import com.bbc.common.PageTemplate;
import com.bbc.common.page.vo.PageInfo;
import com.bbc.notice.model.service.NoticeService;

/**
 * Servlet implementation class CarListServlet
 */
@WebServlet("/carList.b.ci")
public class CarListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;			// 총 게시글 갯수
		int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
		
		listCount = new NoticeService().getNoticeCount();
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		PageInfo pi = PageTemplate.getPageInfo(listCount, currentPage);
		ArrayList<CarInfo> list = new CarInfoService().branchCarList(pi); 
		
		request.getRequestDispatcher("views/branch/carmanagement/myCar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
