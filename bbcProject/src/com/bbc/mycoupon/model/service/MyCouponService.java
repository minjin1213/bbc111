package com.bbc.mycoupon.model.service;

import static com.bbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.mycoupon.model.dao.MyCouponDao;
import com.bbc.mycoupon.model.vo.MyCoupon;

public class MyCouponService {
	public ArrayList<MyCoupon> selectCouponList(int mno){
		
		Connection conn = getConnection();
		
		ArrayList<MyCoupon> couponlist = new MyCouponDao().selectCouponList(conn,mno);
		
		close(conn);
		return couponlist;
	}
}
