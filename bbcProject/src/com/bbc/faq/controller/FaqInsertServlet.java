package com.bbc.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.faq.model.service.FaqService;
import com.bbc.faq.model.vo.Faq;

/**
 * Servlet implementation class FaqInsertServlet
 */
@WebServlet("/insert.fa")
public class FaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("q-title");
		String content = request.getParameter("q-content");
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		
		Faq f = new Faq();
		f.setFaqTitle(title);
		f.setFaqContent(content);
		f.setMemberNo(memNo);
		
		int result = new FaqService().insertFaq(f);
		
		if(result > 0) {
			// alert창 인코딩 처리해주는 부분
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			// alert바로 띄우는 기능 설정해주는 부분
			out.println("<script>alert('FAQ 등록이 완료되었습니다.'); location.href='list.t.fa';</script>");
		}else {
			request.setAttribute("msg", "FAQ 등록 실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
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
