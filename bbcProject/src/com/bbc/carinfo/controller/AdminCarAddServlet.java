package com.bbc.carinfo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbc.attachment.model.vo.Attachment;
import com.bbc.carinfo.model.service.CarInfoService;
import com.bbc.carinfo.model.vo.CarInfo;
import com.bbc.common.MyFileRenamePolicy;
import com.bbc.coupon.model.vo.Coupon;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AdminCarAddServlet
 */
@WebServlet("/add.t.ci")
public class AdminCarAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCarAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			// 전송파일 용량 제한(10Mbyte)
			int maxSize = 1024*1024*10;
			
			// 파일 저장될 폴더의 물리적인 경로 알아내기
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			
			// 파일이 실제로 저장될 진짜 폴더 경로
			String savePath = resources + "\\addcar_upfile\\";
			
			// 파일명 리네임 작업
			MultipartRequest multiRequest = 
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// DB에 저장할 데이터 뽑아서 vo객체에 담기
			String carType = multiRequest.getParameter("car-type");
			String carNum = multiRequest.getParameter("car-num");
			String fuel = multiRequest.getParameter("fuel");
			String carColor = multiRequest.getParameter("car-color");
			String year = multiRequest.getParameter("year");
			String carValue = multiRequest.getParameter("carValue");
			String naviEn = multiRequest.getParameter("naviEn");
			String baby = multiRequest.getParameter("baby");			
			
			// 차량유형번호는 int형으로 바꿔줘야한다 
			int carTypeNo = 0;
			switch(carValue) {
				case "경차" : carTypeNo = 1; break;
				case "소형" : carTypeNo = 2; break;
				case "중형" : carTypeNo = 3; break;
				case "준대형" : carTypeNo = 4; break;
				case "대형" : carTypeNo = 5; break;
				case "승합" : carTypeNo = 6; break;
				case "SUV/RV" : carTypeNo = 7; break;
				case "전기차" : carTypeNo = 8; break;
				case "수입차" : carTypeNo = 9; break;
			}
			
			// 추가 옵션도 체크값으로 들어올 경우 변환해줘야함
			if(naviEn != null) {
				naviEn = "영문 네비게이션";
			}
			if(baby != null) {
				baby = "베이비 시터";
			}	
			
			// 객체에 값들 초기화
			CarInfo ci = new CarInfo();
			ci.setCarTypeName(carType);
			ci.setCarNum(carNum);
			ci.setCarFuel(fuel);
			ci.setCarColor(carColor);
			ci.setCarLunchYear(year);
			ci.setCarTypeNo(carTypeNo);
			if(naviEn != null && baby != null) {
				ci.setCarOption(naviEn + " " + baby);
			}else if(naviEn != null) {
				ci.setCarOption(naviEn);
			}else if(baby != null) {
				ci.setCarOption(baby);
			}
			
			// 전송된 파일의 원본명, 수정명, 저장경로를 담른 Attachment 객체 --> ArrayList에 담기
			ArrayList<CarInfo> list = new ArrayList<>();
			
			String name = "fileUpload";
			
			
			
			
			
			
			
			for(int i=1; i<=4; i++) {
				// 
				String name = "fileUpload" + i;
				
				// 첨부파일이 있을 경우만 ArrayList에 담기게끔
				if(multiRequest.getOriginalFileName(name) != null) {
					// 첨부파일의 수정명
					// 이부분에서 jsp파일에 파일을 뽑아온다.(나)
					String changeName = multiRequest.getFilesystemName(name);
					
					ci.setCarModifyName(changeName);
					
					list.add(ci);
				}
			}
			System.out.println(ci);
			
			// 차량 정보 등록용 서비스 요청(CarInfo객체, 첨부파일전달)
			//int result = new CarInfoService().adminAddCar(ci, list);
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
