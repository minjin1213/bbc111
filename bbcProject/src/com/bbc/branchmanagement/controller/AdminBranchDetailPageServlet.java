package com.bbc.branchmanagement.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.branchmanagement.model.service.BranchManagementService;
import com.bbc.branchmanagement.model.vo.BranchManagement;

/**
 * Servlet implementation class AdminBranchDetailServlet
 */
@WebServlet("/detail.t.br")
public class AdminBranchDetailPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBranchDetailPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		BranchManagement b = new BranchManagementService().adminBranchDetail(no);
		
		if(b != null) {
			request.setAttribute("b", b);
			request.getRequestDispatcher("views/admin/branch/branchInfo.jsp").forward(request, response);			
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
