package com.bbc.mycoupon.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.bbc.mycoupon.model.vo.MyCoupon;
import static com.bbc.common.JDBCTemplate.*;

public class MyCouponDao {
	
	private Properties prop = new Properties();
	
	public MyCouponDao() {
		
		String fileName = MyCouponDao.class.getResource("/sql/mycoupon/mycoupon-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<MyCoupon> selectByMemberNo(Connection conn, int memberNo) {
		
		 ArrayList<MyCoupon> clist = new ArrayList<MyCoupon>();
		 
		 PreparedStatement pstmt = null;
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("selectByMemberNo");
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				clist.add(new MyCoupon(rset.getInt("COUPON_NO")));
			}
		} catch (SQLException e) {	
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 
		return clist; 
	}

}
