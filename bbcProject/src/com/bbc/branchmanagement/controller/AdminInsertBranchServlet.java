package com.bbc.branchmanagement.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.branchmanagement.model.service.BranchManagementService;
import com.bbc.branchmanagement.model.vo.BranchManagement;

/**
 * Servlet implementation class AdminInsertBranchServlet
 */
@WebServlet("/insert.t.br")
public class AdminInsertBranchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInsertBranchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int loginUser = Integer.parseInt(request.getParameter("loginUser"));
		String local = request.getParameter("local");
		String localSmall = request.getParameter("localSmall");
		String address = request.getParameter("address");
		String tellNo = request.getParameter("tellNo");
		String officeHours = request.getParameter("office-hours");
		String transport = request.getParameter("transport");
		// 지도 x, y값 부분
		String mapX = request.getParameter("mapX");
		String mapY = request.getParameter("mapY");
		
		int localNo = 0;
		
		switch(local) {
		case "서울" : localNo = 1; break;
		case "인천/경기/강원" : localNo = 2; break;
		case "대전/충청/세종" : localNo = 3; break;
		case "광주/전라" : localNo = 4; break;
		case "대구/부산/울산/경상" : localNo = 5; break;
		}
		
		BranchManagement bm = new BranchManagement();
		bm.setMemberNo(loginUser);
		bm.setAreaCode(localNo);
		bm.setBranchName(localSmall);
		bm.setBranchAddress(address);
		bm.setBranchPhone(tellNo);
		bm.setBranchHrs(officeHours);
		bm.setBranchDir(transport);
		bm.setMapX(mapX);
		bm.setMapY(mapY);
		
		
		int result = new BranchManagementService().adminInsertBranch(bm);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("insertBranch", "지점 등록이 완료되었습니다.");
			response.sendRedirect("list.t.br");
		}else {
			request.setAttribute("msg", "지점 등록에 실패했습니다.");
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
