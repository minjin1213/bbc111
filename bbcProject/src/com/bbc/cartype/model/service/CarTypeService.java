package com.bbc.cartype.model.service;

import static com.bbc.common.JDBCTemplate.close;
import static com.bbc.common.JDBCTemplate.commit;
import static com.bbc.common.JDBCTemplate.getConnection;
import static com.bbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.cartype.model.dao.CarTypeDao;
import com.bbc.cartype.model.vo.CarType;

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
	 * @param c1		경차 분류 정보가 담겨있는 객체
	 * @param c2		중형 분류 정보가 담겨있는 객체
	 * @param c3		대형 분류 정보가 담겨있는 객체
	 * @param list1		경차 분류 체크값이 담겨있는 ArrayList
	 * @param list2		중형 분류 체크값이 담겨있는 ArrayList
	 * @param list3		대형 분류 체크값이 담겨있는 ArrayList
	 * @return			처리 결과 리턴
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
	
	/**
	 * 3. 보험금액 정보 업데이트용 서비스
	 * @param c1		업데이트할 보험금 정보를 담은 객체
	 * @param c2		업데이트할 면책금 정보를 담은 객체
	 * @param list1		보험금 부분 체크값을 담은 ArrayList
	 * @param list2		면책금 부븐 체크값을 담은 ArrayList
	 * @return
	 */
	public int adminInsuranceUpdate(CarType c1, CarType c2, ArrayList<String> list1, ArrayList<String> list2) {
		Connection conn = getConnection();
		
		// 보험금, 면책금 따로 Dao 전달해서 작업처리
		// 각각 처리 결과를 받아주는 변수 선언
		int iResult = 0;	// 보험금 처리결과 변수
		int aResult = 0;	// 면책금 처리결과 변수
		
		// 체크가 한개라도 들어왔을경우에만 작업이 실행되도록 진행
		if(list1 != null) {
			// 컬럼 한개를 3개로 나눠서 업데이트 해야하기 때문에 Dao 3번으로 나눠서 호출
			// -----> 너무 비효율적인거 같아서 혹시 다른 방법이 있는지???????????????
			int result1 = new CarTypeDao().adminInsuranceUpdate1(conn, c1);
			int result2 = new CarTypeDao().adminInsuranceUpdate2(conn, c1);
			int result3 = new CarTypeDao().adminInsuranceUpdate3(conn, c1);
			
			if(result1 > 0 || result2 > 0 || result3 > 0) {
				iResult = 1;
			}
		}
		if(list2 != null) {
			int result1 = new CarTypeDao().adminInsuranceUpdate4(conn, c2);
			int result2 = new CarTypeDao().adminInsuranceUpdate5(conn, c2);
			int result3 = new CarTypeDao().adminInsuranceUpdate6(conn, c2);
			
			if(result1 > 0 || result2 > 0 || result3 > 0) {
				aResult = 1;
			}
		}
		
		close(conn);
		
		// 두개의 처리결과 합쳐서 받아주는 변수 선언
		int allResult = iResult + aResult;
		
		if(allResult> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return allResult;
	}
	public int adminStopUpdate(int stopDay) {
		Connection conn = getConnection();
		
		int result = new CarTypeDao().adminStopUpdate(conn, stopDay);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 보험유형2 시작
	public int adminStopUpdate2(int stopDay) {
		Connection conn = getConnection();
		
		int result = new CarTypeDao().adminStopUpdate2(conn, stopDay);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int adminInsuranceUpdate2(CarType c1, CarType c2, ArrayList<String> list1, ArrayList<String> list2) {
		Connection conn = getConnection();
		
		int iResult = 0;
		int aResult = 0;
		
		if(list1 != null) {
			int result1 = new CarTypeDao().adminInsuranceUpdate11(conn, c1);
			int result2 = new CarTypeDao().adminInsuranceUpdate12(conn, c1);
			int result3 = new CarTypeDao().adminInsuranceUpdate13(conn, c1);
			
			if(result1 > 0 || result2 > 0 || result3 > 0) {
				iResult = 1;
			}
		}
		if(list2 != null) {
			int result1 = new CarTypeDao().adminInsuranceUpdate14(conn, c2);
			int result2 = new CarTypeDao().adminInsuranceUpdate15(conn, c2);
			int result3 = new CarTypeDao().adminInsuranceUpdate16(conn, c2);
			
			if(result1 > 0 || result2 > 0 || result3 > 0) {
				aResult = 1;
			}
		}
		int allResult = iResult + aResult;
		
		if(allResult > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return allResult;
	}
	
	
	// 보험유형3 시작
	public int adminInsuranceUpdate3(CarType c, ArrayList<String> list) {
		Connection conn = getConnection();
		int allResult = 0;
		
		if(list != null) {
			int result1 = new CarTypeDao().adminInsuranceUpdate21(conn, c);
			int result2 = new CarTypeDao().adminInsuranceUpdate22(conn, c);
			int result3 = new CarTypeDao().adminInsuranceUpdate23(conn, c);

			if(result1 > 0 || result2 > 0 || result3 > 0) {
				allResult = 1;
			}
		}
		
		return allResult;
	}


}
