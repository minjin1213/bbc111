package com.bbc.myinquiry.model.dao;

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
import com.bbc.myinquiry.model.vo.MyInquiry;
import com.bbc.myinquiry.model.vo.UserPageInfo;
 
public class MyInquiryDao {
	// ----------------------------------- 공통
	private Properties prop = new Properties();
	
	public MyInquiryDao() {
		String fileName = MyInquiry.class.getResource("/sql/myInquiry/myInquiry-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// ----------------------------------- 민기 Dao
	public int adminGetListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("adminGetListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public ArrayList<MyInquiry> adminSelectList(Connection conn, PageInfo pi){
		ArrayList<MyInquiry> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getTableLimit() + 1;
			int endRow = startRow + pi.getTableLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MyInquiry(rset.getInt("inquiry_no"),
									  rset.getString("inquiry_title"),
									  rset.getString("inquiry_content"),
									  rset.getString("member_name"),
									  rset.getDate("inquiry_date"),
									  rset.getString("inquiry_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public MyInquiry adminSelectDetail(Connection conn, int iNo) {
		MyInquiry mi = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, iNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mi = new MyInquiry(rset.getString("member_name"),
								  rset.getString("member_email"),
								  rset.getString("phone"),
								  rset.getString("inquiry_title"),
								  rset.getDate("inquiry_date"),
								  rset.getString("inquiry_status"),
								  rset.getString("inquiry_content"),
								  rset.getString("inquiry_answer"),
								  rset.getDate("inquiry_answer_date"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mi;
		
		/*
		 * 시간 될때 다시 생각해보기
		 * HashMap<String, Object> hmap = new HashMap<>(); hmap.put("mi", mi);
		 * hmap.put("m", 멤버객체);
		 * 
		 * 컬렉션 수업자료 확인하기
		 * 
		 * return hmap;
		 */
	}
	
	public int adminUpdate(Connection conn, int no, String answer) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setString(2, "완료");
			pstmt.setInt(3, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//사용자 총 리스트(용환)
	public int UserGetListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("UserGetListCount");
		
		try {
			stmt = conn.createStatement();
			rset =stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
		
	}
	
	
	//사용자  리스트 및 페이징(용환)
	public ArrayList<MyInquiry> UserselectList(Connection conn, UserPageInfo pi) {
		ArrayList<MyInquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("UserSelectList");

		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new MyInquiry(rset.getInt("inquiry_no"),
			            rset.getString("inquiry_title"),
			            rset.getDate("inquiry_date"),
			            rset.getString("inquiry_status")));
			}

		} catch (SQLException e) {
 			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}//사용자  리스트 및 페이징(용환) 끝나는부분
	


}
