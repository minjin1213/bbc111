package com.bbc.carinfo.model.dao;

import static com.bbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.bbc.attachment.model.vo.Attachment;
import com.bbc.carinfo.model.vo.CarInfo;

public class CarInfoDao {
	private Properties prop = new Properties();
	
	public CarInfoDao() {
		String fileName = CarInfoDao.class.getResource("/sql/cartype/cartype-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, String>> selectCarTypeRv(Connection conn, int carType, int rent_branch, long dayCount){
		
		ArrayList<HashMap<String, String>> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCarTypeRv");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, carType);
			pstmt.setInt(2, rent_branch);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				HashMap<String,String> hashMap = new HashMap<>();
				
 	            hashMap.put("CAR_TYPE_NO",String.valueOf(rset.getInt("CAR_TYPE_NO")));
 	            hashMap.put("CAR_NO",String.valueOf(rset.getInt("CAR_NO")));
 	            hashMap.put("CAR_TYPE_NAME", rset.getString("CAR_TYPE_NAME"));
 	            hashMap.put("CAR_MODIFY_NAME", rset.getString("CAR_MODIFY_NAME"));
 	            //hashMap.put("CAR_FUEL", rset.getString("CAR_FUEL"));
 	            
				// 연료타입으로 이미지값 변경
				String fuel = rset.getString("CAR_FUEL");
				if(fuel.equals("LPG")) {
					hashMap.put("FUEL_IMG", "ico_lpg_new.png");		 	     
				}else if(fuel.equals("가솔린")) {
					hashMap.put("FUEL_IMG", "ico_gas_new.png");	
				}else if(fuel.equals("디젤")) {
					hashMap.put("FUEL_IMG", "ico_diesel_new.png");	
				}else {
					hashMap.put("FUEL_IMG", "ico_diesel_new.png");	
				}
				
				//예약일수에 따른 대여료 셋팅            	
				 if(dayCount >= 7) {
					 // 7일 이상인 경우
					 hashMap.put("PRICE", String.valueOf(rset.getInt("RENT_7DP")));		 	           
				 }else if(dayCount <= 2) {
					 // 2일 이하인 경우
					 hashMap.put("PRICE", String.valueOf(rset.getInt("RENT_1D")));		
				 }else {
					 // 3~6일
					 hashMap.put("PRICE", String.valueOf(rset.getInt("RENT_1D_6D")));		
				 }
 	            
 	            hashMap.put("CAR_RIDE_PEOPLE",String.valueOf(rset.getInt("CAR_RIDE_PEOPLE")));
 	            hashMap.put("MEMBER_CAR",String.valueOf(rset.getInt("MEMBER_CAR")));
 	            
 			    list.add(hashMap);
 			 }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// -------------------------------------- 민기 Dao
	public int adminAddCar(Connection conn, CarInfo ci, ArrayList<Attachment> list) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminAddCar");
		
	}

}
