package com.bbc.mybranch.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.bbc.common.JDBCTemplate.close;
import com.bbc.mybranch.model.vo.MyBranch;

public class MyBranchDao {
	
	private Properties prop = new Properties();
	
	public MyBranchDao() {
		String fileName = MyBranchDao.class.getResource("/sql/mybranch/mybranch-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMyBranch(Connection conn, MyBranch mb) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMyBranch");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mb.getMemberNo());
			pstmt.setInt(2, mb.getBranchNo());
			
			result = pstmt.executeUpdate();
			
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<MyBranch> selectBranchList(Connection conn, int userno){
		
		ArrayList<MyBranch> branchlist = new ArrayList<MyBranch>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("viewMyBranchList");
		
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, userno);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					branchlist.add(new MyBranch(
												 rset.getInt("BRANCH_NO"),
												 rset.getString("BRANCH_NAME"),
												 rset.getString("AREA_NAME"),
												 rset.getString("BRANCH_PHONE"),
												 rset.getString("BRANCH_ADDRESS"),
												 rset.getString("BRANCH_HRS"),
												 rset.getString("BRANCH_DIR")
												 ));
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return branchlist;
	}
	
	public int deleteMyBranch(Connection conn, int userno, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMyBranch");
		
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,  userno);
				pstmt.setInt(2,  bno);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				
			}
			return result;
		
	}
	
	
}
