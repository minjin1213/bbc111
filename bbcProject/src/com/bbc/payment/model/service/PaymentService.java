package com.bbc.payment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.payment.model.dao.PaymentDao;
import com.bbc.payment.model.vo.Payment;
import static com.bbc.common.JDBCTemplate.*;

public class PaymentService {
	
	public int insertPayment(Payment p, int memberNo) {
		
		Connection conn = getConnection();
		
		int result = new PaymentDao().insertPayment(conn, p, memberNo);
		
		if(result > 0) {
			commit(conn);		
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Payment> selectPaymentByMemberNo(int memberNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Payment> list = new PaymentDao().selectPaymentByMemberNo(conn, memberNo);
		
		close(conn);
		
		return list;
	}

}
