package com.bbc.event.model.dao;

import static com.bbc.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.bbc.common.page.vo.PageInfo;
import com.bbc.event.model.vo.Event;

public class EventDao {

	private Properties prop = new Properties();
	
	public EventDao() {
		
		String fileName = EventDao.class.getResource("/sql/event/event-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Event> selectEventList(Connection conn, int memNo, PageInfo pi){
		
		ArrayList<Event> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("eventList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getTableLimit() + 1;
			int endRow = startRow + pi.getTableLimit() - 1;
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Event(rset.getInt(1),
									rset.getInt("event_management_no"),
									rset.getString("event_management_title"),
						 			rset.getString("member_name"),
						 			rset.getDate("event_management_start"),
						 			rset.getDate("event_management_end"),
						 			rset.getInt("event_management_vc")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int getEventCount(Connection conn) {
		
		int eventCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getEventCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				eventCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return eventCount;
	}
	
	public int increaseCount(Connection conn, int eno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Event selectEvent(Connection conn, int eno) {
		
		Event eList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eno);
			pstmt.setInt(2, eno);
			pstmt.setInt(3, eno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				eList = new Event(rset.getInt("event_management_no"),
								rset.getString("event_management_title"),
								rset.getDate("event_management_date"),
								rset.getDate("event_management_start"),
								rset.getDate("event_management_end"),
								rset.getInt("event_management_vc"),
								rset.getInt("discount_rate"),
								rset.getString("event_management_content"),
								rset.getInt("member_no"),
								rset.getInt("prev"),
								rset.getInt("next"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return eList;
	}
	
	public int insertEvent(Connection conn, Event e, int memNo, String startDate, String endDate, String rate) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, e.getEventTitle());
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			pstmt.setString(4, rate);
			pstmt.setString(5, e.getEventContent());
			pstmt.setInt(6, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
//	public int updateEvent(Connection conn, Event e) {
//		
//		
//	}
	
	public int deleteOneEvent(Connection conn, int eno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, eno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
//	public Event prevEvent(Connection conn, int eno) {
//		
//		Event eList = null;
//		
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("prevEvent");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, eno);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				eList = new Event(rset.getInt("event_management_no"),
//								rset.getString("event_management_title"),
//								rset.getDate("event_management_date"),
//								rset.getDate("event_management_start"),
//								rset.getDate("event_management_end"),
//								rset.getInt("event_management_vc"),
//								rset.getInt("discount_rate"),
//								rset.getString("event_management_content"),
//								rset.getInt("member_no"));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return eList;
//	}
	
	public ArrayList<Event> selectListBranch(Connection conn, int branchNo) {
		
		ArrayList<Event> elist = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListBranch");
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, branchNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Event e = new Event();
				e.setEventNo(rset.getInt("EVENT_MANAGEMENT_NO"));
				e.setEventTitle(rset.getString("EVENT_MANAGEMENT_TITLE"));
				e.setEventStartDate(rset.getDate("EVENT_MANAGEMENT_START"));
				e.setEventEndDate(rset.getDate("EVENT_MANAGEMENT_END"));
				e.setDiscountRate(rset.getInt("DISCOUNT_RATE"));
				e.setBranchNo(rset.getInt("BRANCH_NO"));				
				elist.add(e);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return elist;
		
	}
	
	public int deleteChkEvent(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteEvent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, arr);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
