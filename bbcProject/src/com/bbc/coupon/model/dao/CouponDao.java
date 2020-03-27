package com.bbc.coupon.model.dao;

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

import com.bbc.common.page.vo.PageInfo;
import com.bbc.coupon.model.vo.Coupon;

public class CouponDao {
	// -------------------------- 공통부분
	private Properties prop = new Properties();
	
	public CouponDao() {
		String fileName = Coupon.class.getResource("/sql/coupon/coupon-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// ------------------------- 민기 Dao
	public int adminGetListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
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
	
	public ArrayList<Coupon> adminSelectList(Connection conn, PageInfo pi){
		ArrayList<Coupon> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminSelectList");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Coupon(rset.getInt("coupon_no"),
									rset.getString("coupon_name"),
									rset.getInt("coupon_dc"),
									rset.getInt("coupon_give"),
									rset.getDate("coupon_create_date"),
									rset.getString("member_id")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public int adminCouponDelete(Connection conn, int no) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminCouponDelete");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int adminCouponAdd(Connection conn, Coupon c) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminCouponAdd");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCouponName());
			pstmt.setInt(2, c.getCouponDc());
			pstmt.setInt(3, c.getCouponGive());
			pstmt.setInt(4, c.getMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
