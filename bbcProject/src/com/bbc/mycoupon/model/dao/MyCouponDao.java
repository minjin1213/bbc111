
package com.bbc.mycoupon.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.bbc.common.JDBCTemplate.*;

import com.bbc.coupon.model.dao.CouponDao;
import com.bbc.mycoupon.model.vo.MyCoupon;

public class MyCouponDao {

	private Properties prop = new Properties();
	
		public MyCouponDao() {
			
			String fileName = CouponDao.class.getResource("/sql/coupon/coupon-query.properties").getPath();
			
			try {
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
				
		public ArrayList<MyCoupon> selectCouponList(Connection conn,int mno){
			
			ArrayList<MyCoupon> list = new ArrayList<MyCoupon>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
		
			String sql = prop.getProperty("viewMyCoupon");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, mno);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new MyCoupon(rset.getString("COUPON_USE"),
										rset.getString("COUPON_NAME"),
										rset.getDate("COUPON_POST"),
										rset.getDate("COUPON_EXP"),
										rset.getString("COUPON_TYPE"),
										rset.getString("COUPON_CONDITION"),
										rset.getInt("COUPON_DC")
							));
				}
			

			} catch (SQLException e) {
			
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
			
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
