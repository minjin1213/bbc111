package com.bbc.cartype.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	// -------------------------------- 민기 Dao
	public ArrayList<CarType> amdinPriceSelectList(Connection conn){
		ArrayList<CarType> allList = new ArrayList<>();
		ArrayList<CarType> list1 = new ArrayList<>();
		ArrayList<CarType> list2 = new ArrayList<>();
		ArrayList<CarType> list3 = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql1 = prop.getProperty("amdinPriceSelectList1");
		String sql2 = prop.getProperty("amdinPriceSelectList2");
		String sql3 = prop.getProperty("amdinPriceSelectList3");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql1);
			while(rset.next()) {
			list1.add(new CarType(rset.getInt("car_type_no"),
								 rset.getInt("rent_1d"),
								 rset.getInt("rent_1d_6d"),
								 rset.getInt("rent_7dp"),
								 rset.getInt("over_6t"),
								 rset.getInt("over_9t"),
								 rset.getInt("over_12t"),
								 rset.getInt("member_car"),
								 rset.getInt("rent_insu_type1"),
								 rset.getInt("rent_insu_type2"),
								 rset.getInt("accident_price_type1"),
								 rset.getInt("accident_price_type2"),
								 rset.getInt("accident_exemption"),
								 rset.getInt("recess_price")));
			}
			rset = stmt.executeQuery(sql2);
			while(rset.next()) {
			list2.add(new CarType(rset.getInt("car_type_no"),
								 rset.getInt("rent_1d"),
								 rset.getInt("rent_1d_6d"),
								 rset.getInt("rent_7dp"),
								 rset.getInt("over_6t"),
								 rset.getInt("over_9t"),
								 rset.getInt("over_12t"),
								 rset.getInt("member_car"),
								 rset.getInt("rent_insu_type1"),
								 rset.getInt("rent_insu_type2"),
								 rset.getInt("accident_price_type1"),
								 rset.getInt("accident_price_type2"),
								 rset.getInt("accident_exemption"),
								 rset.getInt("recess_price")));
			}
			rset = stmt.executeQuery(sql3);
			while(rset.next()) {
			list3.add(new CarType(rset.getInt("car_type_no"),
								 rset.getInt("rent_1d"),
								 rset.getInt("rent_1d_6d"),
								 rset.getInt("rent_7dp"),
								 rset.getInt("over_6t"),
								 rset.getInt("over_9t"),
								 rset.getInt("over_12t"),
								 rset.getInt("member_car"),
								 rset.getInt("rent_insu_type1"),
								 rset.getInt("rent_insu_type2"),
								 rset.getInt("accident_price_type1"),
								 rset.getInt("accident_price_type2"),
								 rset.getInt("accident_exemption"),
								 rset.getInt("recess_price")));
			}

//			rset = stmt.executeQuery(sql);
//			
//			while(rset.next()) {
//				list.add(new CarType(rset.getInt("car_type_no"),
//									 rset.getInt("rent_1d"),
//									 rset.getInt("rent_1d_6d"),
//									 rset.getInt("rent_7dp"),
//									 rset.getInt("over_6t"),
//									 rset.getInt("over_9t"),
//									 rset.getInt("over_12t"),
//									 rset.getInt("member_car"),
//									 rset.getInt("rent_insu_type1"),
//									 rset.getInt("rent_insu_type2"),
//									 rset.getInt("accident_price_type1"),
//									 rset.getInt("accident_insu_type2"),
//									 rset.getInt("accident_exemption"),
//									 rset.getInt("recess_price")));
//			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		System.out.println(allList);
		
		return allList;
	}
	public ArrayList<CarType> adminPriceSelectList1(Connection conn){
		ArrayList<CarType> list1 = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql1 = prop.getProperty("amdinPriceSelectList1");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql1);
			while(rset.next()) {
				list1.add(new CarType(rset.getInt("car_type_no"),
									 rset.getInt("rent_1d"),
									 rset.getInt("rent_1d_6d"),
									 rset.getInt("rent_7dp"),
									 rset.getInt("over_6t"),
									 rset.getInt("over_9t"),
									 rset.getInt("over_12t"),
									 rset.getInt("member_car"),
									 rset.getInt("rent_insu_type1"),
									 rset.getInt("rent_insu_type2"),
									 rset.getInt("accident_price_type1"),
									 rset.getInt("accident_price_type2"),
									 rset.getInt("accident_exemption"),
									 rset.getInt("recess_price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list1;
	}
	public ArrayList<CarType> adminPriceSelectList2(Connection conn){
		ArrayList<CarType> list2 = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql2 = prop.getProperty("amdinPriceSelectList2");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql2);
			while(rset.next()) {
				list2.add(new CarType(rset.getInt("car_type_no"),
									 rset.getInt("rent_1d"),
									 rset.getInt("rent_1d_6d"),
									 rset.getInt("rent_7dp"),
									 rset.getInt("over_6t"),
									 rset.getInt("over_9t"),
									 rset.getInt("over_12t"),
									 rset.getInt("member_car"),
									 rset.getInt("rent_insu_type1"),
									 rset.getInt("rent_insu_type2"),
									 rset.getInt("accident_price_type1"),
									 rset.getInt("accident_price_type2"),
									 rset.getInt("accident_exemption"),
									 rset.getInt("recess_price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list2;
	}
	public ArrayList<CarType> adminPriceSelectList3(Connection conn){
		ArrayList<CarType> list3 = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql3 = prop.getProperty("amdinPriceSelectList3");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql3);
			while(rset.next()) {
				list3.add(new CarType(rset.getInt("car_type_no"),
									 rset.getInt("rent_1d"),
									 rset.getInt("rent_1d_6d"),
									 rset.getInt("rent_7dp"),
									 rset.getInt("over_6t"),
									 rset.getInt("over_9t"),
									 rset.getInt("over_12t"),
									 rset.getInt("member_car"),
									 rset.getInt("rent_insu_type1"),
									 rset.getInt("rent_insu_type2"),
									 rset.getInt("accident_price_type1"),
									 rset.getInt("accident_price_type2"),
									 rset.getInt("accident_exemption"),
									 rset.getInt("recess_price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list3;
	}
	
	
	
	public int adminCarPrice(Connection conn, CarType c1, CarType c2, CarType c3, ArrayList<ArrayList> allList) {
		int allResult = 0;
		int result1 = 2;
		int result2 = 2;
		int result3 = 2;
		
		PreparedStatement pstmt = null;
		String sql1 = prop.getProperty("adminCarPrice1");
		String sql2 = prop.getProperty("adminCarPrice2");
		String sql3 = prop.getProperty("adminCarPrice3");
		
		ArrayList<String> check1 = allList.get(0);
		ArrayList<String> check2 = allList.get(1);
		ArrayList<String> check3 = allList.get(2);
		
		try {
			// 차량 금액 부분
			if(check1.get(0) != null) {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, c1.getRent1D());
				pstmt.setInt(2, c1.getRent1D6D());
				pstmt.setInt(3, c1.getRent7DP());
				result1= pstmt.executeUpdate();
			}
			if(check2.get(0) != null) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, c2.getRent1D());
				pstmt.setInt(2, c2.getRent1D6D());
				pstmt.setInt(3, c2.getRent7DP());
				result2 = pstmt.executeUpdate();
			}
			if(check3.get(0) != null) {
				pstmt = conn.prepareStatement(sql3);
				pstmt.setInt(1, c3.getRent1D());
				pstmt.setInt(2, c3.getRent1D6D());
				pstmt.setInt(3, c3.getRent7DP());
				result3 = pstmt.executeUpdate();
			}
			System.out.println(result1);
			System.out.println(result2);
			System.out.println(result3);
			
			allResult = result1 * result2 * result3;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println(allResult);
		
		if(allResult > 3) {
			return 0;
		}else {
			return 1;
		}
	}
	
	public int adminCarPrice1(Connection conn, CarType c1) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminCarPrice1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c1.getRent1D());
			pstmt.setInt(2, c1.getRent1D6D());
			pstmt.setInt(3, c1.getRent7DP());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int adminCarPrice2(Connection conn, CarType c2) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminCarPrice2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c2.getRent1D());
			pstmt.setInt(2, c2.getRent1D6D());
			pstmt.setInt(3, c2.getRent7DP());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int adminCarPrice3(Connection conn, CarType c3) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminCarPrice3");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c3.getRent1D());
			pstmt.setInt(2, c3.getRent1D6D());
			pstmt.setInt(3, c3.getRent7DP());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
}
