package com.bbc.carinfo.model.dao;

import static com.bbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.bbc.carinfo.model.vo.CarInfo;
import com.bbc.common.page.vo.PageInfo;

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
		
		String sql;
		if(carType == 0) {
			sql = prop.getProperty("selectCarTypeAllRv");
		}else {
			sql = prop.getProperty("selectCarTypeRv");
		}
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			if(carType == 0) {
				pstmt.setInt(1, rent_branch);
			}else {
				pstmt.setInt(1, carType);
				pstmt.setInt(2, rent_branch);
			}
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				HashMap<String,String> hashMap = new HashMap<>();
				
 	            hashMap.put("CAR_TYPE_NO",String.valueOf(rset.getInt("CAR_TYPE_NO")));
 	            hashMap.put("CAR_NO",String.valueOf(rset.getInt("CAR_NO")));
 	            hashMap.put("CAR_TYPE_NAME", rset.getString("CAR_TYPE_NAME"));
 	            hashMap.put("CAR_MODIFY_NAME", rset.getString("CAR_MODIFY_NAME"));
  	            
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
					 hashMap.put("PRICE", String.valueOf(rset.getInt("RENT_7DP") * dayCount));		 	           
				 }else if(dayCount <= 2) {
					 // 2일 이하인 경우
					 hashMap.put("PRICE", String.valueOf(rset.getInt("RENT_1D") * dayCount));		
				 }else {
					 // 3~6일
					 hashMap.put("PRICE", String.valueOf(rset.getInt("RENT_1D_6D") * dayCount));		
				 }
 	            
 	            hashMap.put("CAR_RIDE_PEOPLE",String.valueOf(rset.getInt("CAR_RIDE_PEOPLE")));
 	            hashMap.put("CAR_OPTION",rset.getString("CAR_OPTION")); 	           
 	            hashMap.put("MEMBER_CAR",String.valueOf(rset.getInt("MEMBER_CAR")));
 	            
 	            // 보험료금액
 	            hashMap.put("RENT_INSU_TYPE1",String.valueOf(rset.getInt("RENT_INSU_TYPE1")));
 	            hashMap.put("RENT_INSU_TYPE2",String.valueOf(rset.getInt("RENT_INSU_TYPE2")));
 	            hashMap.put("ACCIDENT_PRICE_TYPE1",String.valueOf(rset.getInt("ACCIDENT_PRICE_TYPE1")));
 	            hashMap.put("ACCIDENT_PRICE_TYPE2",String.valueOf(rset.getInt("ACCIDENT_PRICE_TYPE2")));
 	            hashMap.put("ACCIDENT_EXEMPTION",String.valueOf(rset.getInt("ACCIDENT_EXEMPTION")));
 	                
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
	public int adminAddCar(Connection conn, CarInfo ci) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminAddCar");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ci.getCarTypeName());
			pstmt.setString(2, ci.getCarNum());
			pstmt.setString(3, ci.getCarFuel());
			pstmt.setString(4, ci.getCarColor());
			pstmt.setString(5, ci.getCarLunchYear());
			pstmt.setString(6, ci.getCarOption());
			pstmt.setInt(7, ci.getCarRidePeople());
			pstmt.setString(8, ci.getCarModifyName());
			pstmt.setInt(9, ci.getCarTypeNo());
			
			System.out.println(ci.getCarTypeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// --- 민진
	public int getCarEnrollCount(Connection conn) {
		
		int carEnrollCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getCarEnrollCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				carEnrollCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return carEnrollCount;
	}
	
	public int getCarListCount(Connection conn, int branch) {
		
		int carListCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getCarListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, branch);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				carListCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return carListCount;
	}
	

	public ArrayList<CarInfo> branchCarList(Connection conn, PageInfo pi, int branch){
		
		ArrayList<CarInfo> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("carList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getTableLimit() + 1;
			int endRow = startRow + pi.getTableLimit() - 1;
			
			pstmt.setInt(1,branch);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CarInfo ci = new CarInfo(rset.getInt("car_no"),
										rset.getString("car_name"),
										rset.getString("car_num"),
										rset.getString("car_fuel"),
										rset.getString("car_color"),
										rset.getString("car_lunch_year"),
										rset.getString("car_option"),
										rset.getInt("car_ride_people"),
										rset.getString("car_modify_name"),
										rset.getString("car_type_name"));
				
				list.add(ci);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<CarInfo> branchCarEnrollList(Connection conn, PageInfo pi){
		
		ArrayList<CarInfo> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("carEnrollList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getTableLimit() + 1;
			int endRow = startRow + pi.getTableLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				CarInfo ci = new CarInfo(rset.getInt("car_no"),
										rset.getString("car_name"),
										rset.getString("car_num"),
										rset.getString("car_fuel"),
										rset.getString("car_color"),
										rset.getString("car_lunch_year"),
										rset.getString("car_option"),
										rset.getInt("car_ride_people"),
										rset.getString("car_modify_name"),
										rset.getString("car_type_name"));
				
				list.add(ci);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	public int branchDeleteChkCar(Connection conn, String arr) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCar");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, arr);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int branchEnrollChkCar(Connection conn, String arr, int branch) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("carEnroll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, branch);
			pstmt.setString(2, arr);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
