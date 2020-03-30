package com.bbc.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.bbc.branchmanagement.model.vo.BranchManagement;
import com.bbc.payment.model.vo.Payment;
import static com.bbc.common.JDBCTemplate.*;

public class PaymentDao {
	
	private Properties prop = new Properties();
	
	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertPayment(Connection conn, Payment p, int memberNo) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getPayAmount());
			pstmt.setString(2, p.getPayMethod());		
			pstmt.setInt(3, memberNo);	
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;		
			
	}
	
	public ArrayList<Payment> selectPaymentByMemberNo(Connection conn, int memberNo) {
		
		ArrayList<Payment> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPaymentByMemberNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo); 
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Payment(rset.getInt("PAY_NO"),
									rset.getString("PAY_METHOD"),						            
						             rset.getInt("PAY_AMOUNT"),
						             rset.getDate("PAY_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	
	}
	

}
