
package com.bbc.mycoupon.model.service;

import static com.bbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.mycoupon.model.dao.MyCouponDao;
import com.bbc.mycoupon.model.vo.MyCoupon;

public class MyCouponService {
	/*
	 * public ArrayList<MyCoupon> selectCouponList(int mno){
	 * 
	 * Connection conn = getConnection();
	 * 
	 * ArrayList<MyCoupon> couponlist = new
	 * MyCouponDao().selectCouponList(conn,mno);
	 * 
	 * close(conn); return couponlist; }
	 */
		/**
	 * 1. 마이쿠폰리스트 조회용 서비스
	 * @param memberNo	회원번호
	 * @return		         조회된 리스트
	 */
	public ArrayList<MyCoupon> selectByMemberNo(int memberNo) {
		
		Connection conn = getConnection();
		
		ArrayList<MyCoupon> clist = new MyCouponDao().selectByMemberNo(conn, memberNo);
		
		close(conn);
		
		return clist;
		
	}
}
