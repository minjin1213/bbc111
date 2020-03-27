package com.bbc.cartype.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.bbc.cartype.model.vo.CarType;
import static com.bbc.common.JDBCTemplate.*;

public class CarTypeDao {
	private Properties prop = new Properties();
	
	public CarTypeDao() {
		String fileName = CarTypeDao.class.getResource("/sql/cartype/cartype-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<CarType> selectListRv(Connection conn){
		ArrayList<CarType> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListRv");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			while(rset.next()) {
				CarType c = new CarType(rset.getInt("CAR_TYPE_NO"),
										rset.getString("CAR_TYPE_NAME"),
										rset.getInt("RENT_1D"),
										rset.getInt("RENT_1D_6D"),
										rset.getInt("RENT_7DP"),
										rset.getInt("MEMBER_CAR"));
				list.add(c);			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);			
		}
		
		return list;
		
		
	}
}
