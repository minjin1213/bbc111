package com.bbc.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.attachment.model.vo.Attachment;
import com.bbc.notice.model.service.NoticeService;
import com.bbc.notice.model.vo.Notice;

/**
 * Servlet implementation class HelpNoticeDetailServlet
 */
@WebServlet("/detail.b.no")
public class HelpNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpNoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		Notice nList = new NoticeService().branchSelectNotice(nno);
		ArrayList<Attachment> aList = new NoticeService().branchSelectAttachment(nno);
		
		if(nList != null) {
			request.setAttribute("nList", nList);
			request.setAttribute("aList", aList);
			request.getRequestDispatcher("views/branch/helpcenter/noticeDetail.jsp").forward(request, response);
		} else {
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
