package com.bbc.event.model.service;

import static com.bbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.common.page.vo.PageInfo;
import com.bbc.event.model.dao.EventDao;
import com.bbc.event.model.vo.Event;

public class EventService {
	
	/**
	 * 1. 이벤트 리스트 조회용 서비스
	 * @param memNo	(로그인기능 전)가입한 지점관리자의 회원번호라고 침
	 * @return		조회된 리스트
	 */
	public ArrayList<Event> selectEventList(int memNo, PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Event> list = new EventDao().selectEventList(conn, memNo, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 2. 이벤트 리스트 개수 조회
	 * @return	이벤트 리스트 개수
	 */
	public int getEventCount() {
		
		Connection conn = getConnection();
		
		int result = new EventDao().getEventCount(conn);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 3. 이벤트 상세 조회
	 * @param nno	선택한 이벤트 번호
	 * @return		조회된 이벤트 상세 내용
	 */
	public Event selectEvent(int eno) {
		
		Connection conn = getConnection();
		
		Event eList = null;
		
		// 해당 이벤트 조회수 증가
		int result = new EventDao().increaseCount(conn, eno);
		
		if(result > 0) {
			commit(conn);
			
			// 해당 이벤트 조회
			eList = new EventDao().selectEvent(conn, eno);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return eList;
	}
	
	/**
	 * 4. 이벤트 등록
	 * @param e		등록할 이벤트 객체
	 * @return		insert 후 처리된 행의 개수
	 */
	public int insertEvent(Event e, int memNo, String startDate, String endDate, String rate) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().insertEvent(conn, e, memNo, startDate, endDate, rate);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 5. 수정용 이벤트 조회 서비스
	 * @return	입력했던 이벤트 객체
	 */
	public Event selectUpdateEvent(int eno) {
		
		Connection conn = getConnection();
		
		Event eList = new EventDao().selectEvent(conn, eno);
		
		close(conn);
		
		return eList;
	}
	
	/**
	 * 6. 이벤트 수정
	 * @param e		입력한 이벤트 객체
	 * @return		sql 성공 후 행의 개수
	 */
//	public int updateEvent(Event e) {
//		
//		Connection conn = getConnection();
//		
//		int result = new EventDao().updateEvent(conn, e);
//		
//		if(result > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		
//		return result;
//	}
	
	/**
	 * 7. 이벤트 한개 삭제 서비스
	 * @param eno	삭제할 이벤트 번호
	 * @return		삭제 후 조회되는 행의 개수
	 */
	public int deleteOneEvent(int eno) {
		
		Connection conn = getConnection();
		
		int result = new EventDao().deleteOneEvent(conn, eno);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
//	public Event prevEvent(int eno) {
//		
//		Connection conn = getConnection();
//		
//		Event eList = null;
//		
//		// 해당 이벤트 조회수 증가
//		int result = new EventDao().increaseCount(conn, eno);
//		
//		if(result > 0) {
//			commit(conn);
//			
//			// 해당 이벤트 조회
//			eList = new EventDao().prevEvent(conn, eno);
//		} else {
//			rollback(conn);
//		}
//		
//		return eList;
//	}
	
	/**
	 * 8. 차량예약예서 지점선택시 지점에 해당하는 이벤트 가져오기
	 * @param branchNo	조회할 지점
	 * @return		   	지점에 등록된 이벤트 리스트
	 */
	public ArrayList<Event> selectListBranch(int branchNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Event> elist = new EventDao().selectListBranch(conn, branchNo);
		
		close(conn);
		
		return elist;
		
	}
	
	public int deleteChkEvent(String[] arr) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		for(int i=0; i<arr.length; i++) {
			result = new EventDao().deleteChkEvent(conn, arr[i]);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

}
