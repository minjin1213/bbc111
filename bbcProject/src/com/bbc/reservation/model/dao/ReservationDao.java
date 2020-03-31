package com.bbc.reservation.model.dao;

import static com.bbc.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.bbc.common.page.vo.PageInfo;
import com.bbc.payment.model.vo.Payment;
import com.bbc.reservation.model.vo.Reservation;
import com.bbc.userInfo.model.vo.UserInfo;

public class ReservationDao {
	
	Properties prop = new Properties();
	
	public ReservationDao() {
		
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Reservation> selectWholeList(Connection conn, PageInfo pi, String st){
		
		ArrayList<Reservation> wholeList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("wholeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, st);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation r = new Reservation(rset.getString("member_name"),
												rset.getInt("reservation_no"),
												rset.getString("car_name"),
												rset.getInt("car_no"),
												rset.getDate("rent_date"),
												rset.getDate("return_date"));
				wholeList.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return wholeList;
	}
	
	public int getListCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	
	public int selectCarListRv(Connection conn, int car_no, String rent_date, String return_date) {
		int result = -1;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectCarListRv");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, car_no);
			pstmt.setString(2, rent_date + ":00");
			pstmt.setString(3, return_date + ":00");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<Reservation> selectRentList(Connection conn, PageInfo pi, String st){
		
		ArrayList<Reservation> rentList = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("rentList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, st);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Reservation r = new Reservation(rset.getInt("member_no"),
												rset.getInt("reservation_no"),
												rset.getDate("rent_date"),
												rset.getDate("return_date"),
												rset.getInt("car_no"),
												rset.getString("member_name"),
												rset.getString("car_name"));
				rentList.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rentList;
		
	}
	
	public UserInfo selectRentDetailMember(Connection conn, int no) {
		
		UserInfo ui = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("rentDetailMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ui = new UserInfo(rset.getInt("member_no"),
						rset.getString("member_name"),
						rset.getString("member_zipcode"),
						rset.getString("member_address"),
						rset.getString("rrn"),
						rset.getString("phone"),
						rset.getString("member_email"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ui;
	}
	
	public Payment selectRentDetailPay(Connection conn, int no) {
		
		Payment p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("rentDetailPay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Payment(rset.getInt("pay_no"),
								rset.getString("pay_method"),
								rset.getInt("pay_amount"),
								rset.getDate("pay_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	public ArrayList<Reservation> selectReservClientList(Connection conn, PageInfo pi){
		
		ArrayList<Reservation> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reservClientList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);

			while(rset.next()) {
				Reservation u = new Reservation(rset.getInt("member_no"),
											rset.getString("member_id"),
											rset.getString("member_name"),
											rset.getString("phone"),
											rset.getString("member_email"));
				
				list.add(u);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	public UserInfo selectReservDetailMember(Connection conn, int no) {

		UserInfo ui = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reservClientMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ui = new UserInfo(rset.getInt("member_no"),
									rset.getString("member_name"),
									rset.getString("member_zipcode"),
									rset.getString("member_address"),
									rset.getString("rrn"),
									rset.getString("phone"),
									rset.getString("member_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ui;
		
	}
	
	public ArrayList<Payment> selectReservDetailPay(Connection conn, int no) {
		
		ArrayList<Payment> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("reservClientDetailPay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Payment p = new Payment(rset.getInt("reservation_no"),
						rset.getDate("rent_date"),
						rset.getDate("return_date"),
						rset.getInt("car_no"),
						rset.getString("car_name"),
						rset.getInt("pay_amount"),
						rset.getDate("pay_date"),
						rset.getString("pay_method"),
						rset.getString("refund_statement"),
						rset.getDate("refund_date"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public Reservation selectRentDetailReserv(Connection conn, int no) {
		
		Reservation r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("rentDetailReserv");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Reservation(rset.getInt("reservation_no"),
								rset.getInt("car_no"),
								rset.getString("car_name"),
								rset.getDate("rent_date"),
								rset.getDate("return_date"),
								rset.getString("branch_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	
	// 요한 
	
	
	  public ArrayList<Reservation> selectReservationList(Connection conn, int
	  mno){
	  
	  ArrayList<Reservation> reservationlist = new ArrayList<Reservation>();
	  
	  PreparedStatement pstmt = null; ResultSet rset = null;
	  
	  String sql = prop.getProperty("viewMyReservation");
	  
	  try { pstmt = conn.prepareStatement(sql);
	  
	  pstmt.setInt(1, mno);
	  
	  rset = pstmt.executeQuery();
	  
	  while(rset.next()) {
			reservationlist.add(new Reservation(rset.getInt("RESERVATION_NO"),
												rset.getDate("RENT_DATE"),
												rset.getDate("RETURN_DATE"),
												rset.getString("CAR_NAME"),
												rset.getString("RentBranch"),
												rset.getString("ReturnBranch"),
												rset.getString("RESERVATION_STATUS"),
												rset.getInt("CWD_PRICE"),
												rset.getInt("PRICE"),
												rset.getInt("DISCOUNT_PRICE"),
												rset.getInt("TOTAL_PRICE"),
												rset.getDate("PAY_DATE"),
												rset.getInt("PAY_AMOUNT"),
												rset.getString("PAY_METHOD"),
												rset.getString("REFUND_STATEMENT"),
												rset.getDate("REFUND_DATE"),
												rset.getString("CAR_MODIFY_NAME")
												));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
		
	}
	return reservationlist;
	  }
	  
	  public ArrayList<Reservation> selectTotalReservationList(Connection conn, int
	  mno){
	  
	  ArrayList<Reservation> reservationtotal = new ArrayList<Reservation>();
	  
	  PreparedStatement pstmt = null; ResultSet rset = null;
	  
	  String sql = prop.getProperty("viewMyHistory");
	  
	  try { pstmt = conn.prepareStatement(sql);
	  
	  pstmt.setInt(1, mno);
	  
	  rset = pstmt.executeQuery();
	  
	  while(rset.next()) {
			reservationtotal.add(new Reservation(rset.getInt("RESERVATION_NO"),
												rset.getDate("RENT_DATE"),
												rset.getDate("RETURN_DATE"),
												rset.getString("CAR_NAME"),
												rset.getString("RentBranch"),
												rset.getString("ReturnBranch"),
												rset.getString("RESERVATION_STATUS"),
												rset.getInt("CWD_PRICE"),
												rset.getInt("PRICE"),
												rset.getInt("DISCOUNT_PRICE"),
												rset.getInt("TOTAL_PRICE"),
												rset.getDate("PAY_DATE"),
												rset.getInt("PAY_AMOUNT"),
												rset.getString("PAY_METHOD"),
												rset.getString("REFUND_STATEMENT"),
												rset.getDate("REFUND_DATE"),
												rset.getString("CAR_MODIFY_NAME")
												));
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
		
	}
	return reservationtotal;

	  
	  }
	 
	
	public int deleteMyReservation(Connection conn, int userno, int rno) {
		
		int result = 0;
		
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		
		String sql = prop.getProperty("updateReservationInfo");
		String sql1 = prop.getProperty("updateReservationPayment");
		
		try {
			pstmt1 = conn.prepareStatement(sql);
				pstmt1.setInt(1, userno);
				pstmt1.setInt(2, rno);
		
			pstmt2 = conn.prepareStatement(sql1);
				pstmt2.setInt(1, rno);
				
			result = pstmt1.executeUpdate();
			result += pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt1);
			close(pstmt2);
		} 
		return result;
	}

	public int insertReservation(Connection conn, Reservation r) {
		int result = 0;
	
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReservation");

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getMemberStatus());
			pstmt.setString(2, r.getReservationStatus());
			pstmt.setDate(3, r.getRentDate());
			pstmt.setDate(4, r.getReturnDate());
			pstmt.setString(5, r.getOption());
			pstmt.setInt(6, r.getPrice());
			pstmt.setString(7, r.getDiscountCategory());
			pstmt.setInt(8, r.getDiscountNo());
			pstmt.setInt(9, r.getDiscountPrice());
			pstmt.setInt(10, r.getCwdPrice());
			pstmt.setInt(11, r.getTotalPrice());
			pstmt.setInt(12, r.getOilRent());
			pstmt.setInt(13,  r.getCarNo());
			pstmt.setInt(14, r.getMemberNo());
			pstmt.setInt(15, r.getBranchReservationNo());
			pstmt.setInt(16,  r.getBranchReturnNo());
			pstmt.setInt(17, r.getPayNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);			
		}
		
		return result;
		
	}
}
