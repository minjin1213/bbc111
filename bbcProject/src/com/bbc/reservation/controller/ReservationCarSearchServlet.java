package com.bbc.reservation.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbc.carinfo.model.service.CarInfoService;
import com.bbc.event.model.service.EventService;
import com.bbc.event.model.vo.Event;
import com.bbc.reservation.model.service.ReservationService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ReservationCarSearchServlet
 */
@WebServlet("/rvSearchCar.rv")
public class ReservationCarSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationCarSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int carType = Integer.parseInt(request.getParameter("carType"));
		int rent_branch = Integer.parseInt(request.getParameter("rent_branch"));
		String rent_date = request.getParameter("rent_date");
		String return_date = request.getParameter("return_date");
				
		// 대여일수 계산
		// 시간이 남는경우는 1day 추가 : 2020-03-25 10:00:00 ~ 2020-03-27 18:00:00
		// 시간이 모자라는 경우 day를 추가하지 않음: 2020-03-25 10:00:00 ~ 2020-03-27 08:00:00
		long dayCount = 0;
		String strStartDate = rent_date + ":00";
		String strEndDate = return_date + ":00";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        try{
            Date startDate =sdf.parse(strStartDate);
            Date endDate = sdf.parse(strEndDate);  
            long calDate = endDate.getTime() - startDate.getTime(); 
            dayCount = Math.abs(calDate / ( 24*60*60*1000));;
            if(!(return_date.substring(11, 16).equals(rent_date.substring(11, 16)))) {
            	dayCount = dayCount + 1;
            }     
        }catch(ParseException e){
            e.printStackTrace();
        }
          
		// 차량유형값 가져오기
		ArrayList<HashMap<String, String>> list = new CarInfoService().selectCarTypeRv(carType, rent_branch, dayCount);
		
		// 차량예약시 대여일시/반납일시/대여지점/반납지점.차량유형 선택 후 검색 처리
		
		for(int i=0; i<list.size(); i++) {		
		
			int car_no = Integer.parseInt(list.get(i).get("CAR_NO"));
			int result = new ReservationService().selectCarListRv(car_no, rent_date, return_date);

			if(result != 0) {
				// 이미 예약된 차량인경우 차량정보 삭제
				list.remove(i);
			}

		}	
							
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
