package com.bbc.driverlicense.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import static com.bbc.common.JDBCTemplate.*;

import com.bbc.area.model.vo.Area;
import com.bbc.driverlicense.model.vo.DriverLicense;


public class DriverLicenseDao {
	
	private Properties prop = new Properties();
	
	public DriverLicenseDao() {
		String fileName = DriverLicenseDao.class.getResource("/sql/driverlicense/driverlicense-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public DriverLicense selectByMemberId(Connection conn, int memberNo) {
		
		DriverLicense d = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		 
		 String sql = prop.getProperty("selectByMemberId");
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				d = new DriverLicense(rset.getInt("DRIVER_LICENSE_NO"),
								  rset.getString("LICENSE_TYPE"),
								  rset.getString("RENT_NUMBER1"),
								  rset.getString("RENT_NUMBER2"),
								  rset.getDate("LICENSE_ISSUE_DATE"),
								  rset.getDate("LICENSE_RETURN_DATE"),
								  rset.getString("LICENSE_MODIFY_NAME"),	
								  rset.getInt("MEMBER_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		 return d;
	}

}
