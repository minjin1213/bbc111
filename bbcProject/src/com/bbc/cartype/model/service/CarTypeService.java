package com.bbc.cartype.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.cartype.model.dao.CarTypeDao;
import com.bbc.cartype.model.vo.CarType;
import static com.bbc.common.JDBCTemplate.*;

public class CarTypeService {
	
	public ArrayList<CarType> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<CarType> list = new CarTypeDao().selectListRv(conn);
		
		close(conn);
		
		return list;
		
	}
	
	// ------------------------------------ 민기 Service
	/**
	 * 1. 입력되어있는 금액정보 불러오는 서비스(1,2,3)
	 * @return 금액정보 객체 리턴
	 */
	public ArrayList<CarType> adminPriceSelectList1(){
		Connection conn = getConnection();
		
		ArrayList<CarType> list1 = new CarTypeDao().adminPriceSelectList1(conn);
		
		close(conn);
		
		return list1;
	}
	public ArrayList<CarType> adminPriceSelectList2(){
		Connection conn = getConnection();
		
		ArrayList<CarType> list2 = new CarTypeDao().adminPriceSelectList2(conn);
		
		close(conn);
		
		return list2;
	}
	public ArrayList<CarType> adminPriceSelectList3(){
		Connection conn = getConnection();
		
		ArrayList<CarType> list3 = new CarTypeDao().adminPriceSelectList3(conn);
		
		close(conn);
		
		return list3;
	}
	
	
	/** 2. 차량금액 정보 업데이트용 서비스
	 * @param c1
	 * @param c2
	 * @param c3
	 * @param list1	경차 분류 정보가 담겨있는 ArrayList
	 * @param list2	중형 분류 정보가 담겨있는 ArrayList
	 * @param list3	대형 분류 정보가 담겨있는 ArrayList
	 * @return
	 */
	public int adminCarPrice(CarType c1, CarType c2, CarType c3, ArrayList<String> list1, ArrayList<String> list2, ArrayList<String> list3) {
		Connection conn = getConnection();
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		if(list1 != null) {
			result1 = new CarTypeDao().adminCarPrice1(conn, c1);			
		}
		if(list2 != null) {
			result2 = new CarTypeDao().adminCarPrice2(conn, c2);			
		}
		if(list3 != null) {
			result3 = new CarTypeDao().adminCarPrice3(conn, c3);			
		}
		
		int result = result1 + result2 + result3;
		
		
		if(result == 0) {
			rollback(conn);
		}else {
			commit(conn);
		}
		close(conn);
		
		return result;
	}


}
