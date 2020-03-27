package com.bbc.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;

import com.bbc.branchmanagement.model.service.BranchManagementService;
import com.bbc.branchmanagement.model.vo.BranchManagement;
import com.bbc.event.model.service.EventService;
import com.bbc.event.model.vo.Event;
import com.bbc.notice.model.service.NoticeService;
import com.bbc.notice.model.vo.Notice;
import com.google.gson.Gson;

/**
 * Servlet implementation class ReservationBrSearchServlet
 */
@WebServlet("/reservationBrSearch.rv")
public class ReservationBrSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationBrSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int areano = Integer.parseInt(request.getParameter("areano"));
		
		ArrayList<BranchManagement> list = new BranchManagementService().selectListArea(areano);
					
		
		String eventList;	
		String noticeList;
		
		for(int i=0; i<list.size(); i++) {
			
			// 각 지점별 이벤트 리스트 가져오기
			ArrayList<Event> elist = new EventService().selectListBranch(list.get(i).getBranchNo());
							
			eventList = "";
			for (int j=0; j<elist.size(); j++) {
				eventList += elist.get(j).getEventTitle() + "^" + elist.get(j).getEventStartDate() + "^" +
						     elist.get(j).getEventEndDate() + "^" + elist.get(j).getDiscountRate() + "$";
				//list.set(3, eventList);
				list.get(i).setEventContent(eventList);				
			}
			
			// 각 지점별 공지사항 가져오기
			noticeList = "";
			Notice n = new NoticeService().selectListByBr(list.get(i).getBranchNo());
			if(n != null) {
				noticeList = n.getNoticeTitle() + "^" + n.getNoticeContent();
				list.get(i).setNoticeContent(noticeList);	
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
