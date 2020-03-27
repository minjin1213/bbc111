package com.bbc.area.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.bbc.area.model.vo.Area;
import static com.bbc.common.JDBCTemplate.*;

public class AreaDao {
	private Properties prop = new Properties();
	
	public AreaDao() {
		String fileName = AreaDao.class.getResource("/sql/area/area-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Area> selectList(Connection conn) {
		
		 ArrayList<Area> list = new ArrayList<>();
		 
		 Statement stmt = null;
		 ResultSet rset = null;
		 
		 String sql = prop.getProperty("selectList");
		 
		 try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Area(rset.getInt("AREA_CODE"),
									rset.getString("AREA_NAME")));
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
