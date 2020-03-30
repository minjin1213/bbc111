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
									 rset.getInt("accident_price_type3"),
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
									 rset.getInt("accident_price_type3"),
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
									 rset.getInt("accident_price_type3"),
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
	
	public int adminCarPrice1(Connection conn, CarType c1) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminCarPrice1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c1.getRent1D());
			pstmt.setInt(2, c1.getRent1D6D());
			pstmt.setInt(3, c1.getRent7DP());
			pstmt.setInt(4, c1.getOver6T());
			pstmt.setInt(5, c1.getOver9T());
			pstmt.setInt(6, c1.getOver12T());
			pstmt.setInt(7, c1.getMemberCar());
			
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
			pstmt.setInt(4, c2.getOver6T());
			pstmt.setInt(5, c2.getOver9T());
			pstmt.setInt(6, c2.getOver12T());
			pstmt.setInt(7, c2.getMemberCar());
			
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
			pstmt.setInt(4, c3.getOver6T());
			pstmt.setInt(5, c3.getOver9T());
			pstmt.setInt(6, c3.getOver12T());
			pstmt.setInt(7, c3.getMemberCar());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 보험유형1 : 보험금 부분
	public int adminInsuranceUpdate1(Connection conn, CarType c1) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate1");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c1.getRentInsuType1());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int adminInsuranceUpdate2(Connection conn, CarType c1) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c1.getRentInsuType2());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int adminInsuranceUpdate3(Connection conn, CarType c1) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate3");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c1.getAccidentExemption());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	// 보험유형1 : 면책금 부분
	public int adminInsuranceUpdate4(Connection conn, CarType c2) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate4");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c2.getAccidentPriceType1());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int adminInsuranceUpdate5(Connection conn, CarType c2) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate5");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c2.getAccidentPriceType2());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public int adminInsuranceUpdate6(Connection conn, CarType c2) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate6");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c2.getAccidentPriceType3());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	// 보험유형1 : 휴차료 부분
	public int adminStopUpdate(Connection conn, int stopDay) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminStopUpdate1");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stopDay);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 보험유형2 시작
	// 보험유형2 : 휴차료 부분
	public int adminStopUpdate2(Connection conn, int stopDay) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminStopUpdate2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stopDay);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	// 보험유형2 : 보험료 부분
	public int adminInsuranceUpdate11(Connection conn, CarType c1) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate11");
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(c1.getRentInsuType1());
			pstmt.setInt(1, c1.getRentInsuType1());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int adminInsuranceUpdate12(Connection conn, CarType c1) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate12");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c1.getRentInsuType2());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int adminInsuranceUpdate13(Connection conn, CarType c1) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate13");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c1.getAccidentExemption());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int adminInsuranceUpdate14(Connection conn, CarType c2) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate14");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c2.getAccidentPriceType1());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int adminInsuranceUpdate15(Connection conn, CarType c2) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate15");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c2.getAccidentPriceType2());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int adminInsuranceUpdate16(Connection conn, CarType c2) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate16");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c2.getAccidentPriceType3());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 보험유형3 시작
	// 보험유형3 : 보험료 부분
	public int adminInsuranceUpdate21(Connection conn, CarType c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate21");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getRentInsuType1());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int adminInsuranceUpdate22(Connection conn, CarType c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate22");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getRentInsuType2());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int adminInsuranceUpdate23(Connection conn, CarType c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminInsuranceUpdate23");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getAccidentExemption());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
