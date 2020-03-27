package com.bbc.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.notice.model.service.NoticeService;

/**
 * Servlet implementation class UserDeleteServlet
 */
@WebServlet("/uDelete.t.no")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("noticeNo"));
		
		int result = new NoticeService().adminUserNoticeDelete(no);
		
		if(result > 0) {
			
			HttpSession session = request.getSession();
			
			session.setAttribute("deleteCom", "공지사항 삭제가 완료되었습니다.");
			
			response.sendRedirect("uList.t.no");
		}else {
			request.setAttribute("msg", "공지사항 삭제에 실패했습니다.");
			request.getRequestDispatcher("views/admin/common/errorPage.jsp").forward(request, response);
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
