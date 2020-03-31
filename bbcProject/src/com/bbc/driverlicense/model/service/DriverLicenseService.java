package com.bbc.driverlicense.model.service;

import static com.bbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.driverlicense.model.dao.DriverLicenseDao;
import com.bbc.driverlicense.model.vo.DriverLicense;



public class DriverLicenseService {
	
	/**
	 * 1. 차량예약시 회원의 운전면허정보 가져오기
	 * @param	조회할 회원의 ID
	 * @return	조회된 운전면허정보가 담겨있는 DriverLicense 객체
	 */
public DriverLicense selectByMemberId(int memberNo) {
		
		Connection conn = getConnection();
				
		DriverLicense d = new DriverLicenseDao().selectByMemberId(conn, memberNo);
		
		close(conn);
		
		return d;
	}

// 요한
public int insertDriverLicense(DriverLicense d) {
	
	Connection conn = getConnection();
	
	int result = new DriverLicenseDao().insertDriverLicense(conn, d);
	
	if(result >0) {
		commit(conn);
	}else {
		rollback(conn);
	}
	close(conn);
	
	return result;
}

public DriverLicense selectDriverlicense(int userno) {
	
	Connection conn = getConnection();
		
	DriverLicense d = new DriverLicenseDao().selectDriverLicense(conn,userno);
	
	close(conn);
	return d;
}
public int deletemyDriverLicense(int mno) {
	
	Connection conn = getConnection();
	
	int result = new DriverLicenseDao().deletemyDriverLicense(conn, mno);
	System.out.println(mno);
	if(result >0) {
		commit(conn);
	}else {
		rollback(conn);
	}
	close(conn);
	return result;
}
}
