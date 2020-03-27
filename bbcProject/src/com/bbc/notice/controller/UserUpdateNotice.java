package com.bbc.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbc.notice.model.service.NoticeService;
import com.bbc.notice.model.vo.Notice;

/**
 * Servlet implementation class UserUpdateNotice
 */
@WebServlet("/uUpdate.t.no")
public class UserUpdateNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Notice n = new Notice();
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("q-title");
		String noticeContent = request.getParameter("q-content");
		String noticeFile = request.getParameter("file1");
		// 공지사항 분류값 받아주는 배열
		String noticeV = request.getParameter("noticeV");
		// 중요공지사항 체크 받아주는 변수
		String check = request.getParameter("importCheck");

		n.setNoticeNo(noticeNo);
		n.setNoticeTitle(noticeTitle);
		n.setNoticeContent(noticeContent);
		n.setRename(noticeFile);
		n.setNoticeField(Integer.parseInt(noticeV));
		if(check != null) {
			n.setNoticeImport(Integer.parseInt(check));			
		}
		
		int result = new NoticeService().adminUserNoticeUpdate(n);
		
		HttpSession session = request.getSession();
		
		if(result > 0) {
			response.sendRedirect("uList.t.no");
		}else {
			request.setAttribute("msg", "공지사항 수정에 실패했습니다.");
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
