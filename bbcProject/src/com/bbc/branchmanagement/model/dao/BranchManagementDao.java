package com.bbc.branchmanagement.model.dao;

import static com.bbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.bbc.branchmanagement.model.vo.BranchManagement;

public class BranchManagementDao {
	private Properties prop = new Properties();
	
	public BranchManagementDao() {
		String fileName = BranchManagementDao.class.getResource("/sql/branchmanagement/branchmanagement-query.properties").getPath(); 
		
		try {
			prop.load(new FileReader(fileName));		
		} catch (IOException e) {	
			e.printStackTrace();
		}		
	}

	public ArrayList<BranchManagement> selectListArea(Connection conn, int areano) {
		
		ArrayList<BranchManagement> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListArea");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, areano);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new BranchManagement(rset.getInt("BRANCH_NO"),
						                      rset.getString("BRANCH_NAME"),
						                      "",
						                      ""));
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// ---------------------------- 민기 Dao
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
	
	public ArrayList<BranchManagement> adminBranchList(Connection conn){
		ArrayList<BranchManagement> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminBranchList");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new BranchManagement(rset.getInt("branch_no"),
											  rset.getString("area_name"),
											  rset.getString("branch_name"),
											  rset.getString("branch_phone"),
											  rset.getString("FULL_ADDRESS"),
											  rset.getString("mapx"),
											  rset.getString("mapy")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public int adminInsertBranch(Connection conn, BranchManagement bm) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsertBranch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bm.getBranchName());
			pstmt.setString(2, bm.getBranchPhone());
			pstmt.setString(3, bm.getBranchAddress());
			pstmt.setString(4, bm.getBranchHrs());
			pstmt.setString(5, bm.getBranchDir());
			pstmt.setInt(6, bm.getMemberNo());
			pstmt.setInt(7, bm.getAreaCode());
			pstmt.setString(8, bm.getMapX());
			pstmt.setString(9, bm.getMapY());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
