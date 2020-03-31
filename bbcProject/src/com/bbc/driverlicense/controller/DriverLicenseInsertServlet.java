package com.bbc.driverlicense.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbc.driverlicense.model.service.DriverLicenseService;
import com.bbc.driverlicense.model.vo.DriverLicense;
import com.bbc.userInfo.model.vo.UserInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class DriverLicenseInsertServlet
 */
@WebServlet("/insert.dl")
public class DriverLicenseInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverLicenseInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(ServletFileUpload.isMultipartContent(request)) {
		
		// 로그인 회원 번호
		HttpSession session = request.getSession();
		UserInfo loginUser = (UserInfo)session.getAttribute("loginUser");
		
		int mno = loginUser.getMemberNo();
		
		// 파일 사이즈 제한
		int maxSize = 1024*1024*10;
		
		String resources = request.getSession().getServletContext().getRealPath("/resources");
		
		// 파일 경로 설정
		String savePath = resources + "\\driverlicense_upfile\\";
		
		// 사진 객체 생성 
		MultipartRequest multiRequest = 
				new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		// 운전면허종류 변수담기
		String type = multiRequest.getParameter("dlType");
		
	
	
		String newDate = multiRequest.getParameter("new");
		String expDate = multiRequest.getParameter("expire");
	
		
		java.util.Date newdate = null;
		java.util.Date exdate = null;
		
		Date newd = Date.valueOf(newDate);
		Date exd = Date.valueOf(expDate);
		
		System.out.println(newd);
		System.out.println(exd);
	
		// 새로운 운전 번호 변환
		// 번호 스트링으로 더한다음 인트로 변환 그리고 담기 
		String areaNum = multiRequest.getParameter("dlNum");
		String num2 = multiRequest.getParameter("dlNum1");
		String num3 = multiRequest.getParameter("dlNum2");
		String num4 = multiRequest.getParameter("dlNum3");
		
		String num = num2 + num3 +num4;

		

		DriverLicense d = new DriverLicense();
		d.setLicenseType(type);
		d.setLicenseIssueDate(newd);
		d.setLicenseReturnDate(exd);
		d.setRentNumber1(areaNum);
		d.setRentNumber2(num);
		d.setMemberNo(mno);
		System.out.println(mno);
		System.out.println(d.getMemberNo());

	
	String name = "fileUpload";
	if(multiRequest.getOriginalFileName(name) != null) {
		
		String originName = multiRequest.getFilesystemName(name);
		
		d.setLicenseModifyName(originName);
	}
	
	int result = new DriverLicenseService().insertDriverLicense(d);
	
	if(result >0) {
		request.setAttribute("d", d);
		request.setAttribute("currentMenu", "운전면허 조회");
		response.sendRedirect("driverLicense.dl");
	}else {
		request.setAttribute("msg", "운전면허 등록실패");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
	}

	
		
		
		
		
		
	
		

		
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
