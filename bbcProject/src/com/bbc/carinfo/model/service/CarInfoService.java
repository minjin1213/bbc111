package com.bbc.carinfo.model.service;

import static com.bbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.bbc.carinfo.model.dao.CarInfoDao;
import com.bbc.carinfo.model.vo.CarInfo;
import com.bbc.common.page.vo.PageInfo;

public class CarInfoService {

	public ArrayList<HashMap<String, String>> selectCarTypeRv(int carType, int rent_branch, long dayCount){
		Connection conn = getConnection();
		
		ArrayList<HashMap<String, String>> list = new CarInfoDao().selectCarTypeRv(conn, carType, rent_branch, dayCount);

		
		//HashMap<String, String[]> carList = new CarInfoDao().selectCarLisrRv(conn, carType, rent_branch);
		
		close(conn);
		
		return list;
		
	}
	
	// ----------------------------- 민기 Service
	public int adminAddCar(CarInfo ci) {
		Connection conn = getConnection();
		
		// 차량 정보 등록하는 Dao 호출
		int result = new CarInfoDao().adminAddCar(conn, ci);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	// --------- 민진
	
	public int getCarEnrollCount() {
		
		Connection conn = getConnection();
		
		int result = new CarInfoDao().getCarEnrollCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public int getCarListCount(int branch) {
		
		Connection conn = getConnection();
		
		int result = new CarInfoDao().getCarListCount(conn, branch);
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 보유차량 조회
	 * @param pi	페이지 객체
	 * @return		지점에 등록된 차량 객체
	 */
	public ArrayList<CarInfo> branchCarList(PageInfo pi, int branch){
		
		Connection conn = getConnection();
		
		ArrayList<CarInfo> list = new CarInfoDao().branchCarList(conn, pi, branch);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<CarInfo> branchCarEnrollList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<CarInfo> list = new CarInfoDao().branchCarEnrollList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int branchDeleteChkCar(String[] arr) {
	
		Connection conn = getConnection();
		
		int result = 0;
		
		for(int i=0; i<arr.length; i++) {
			
			result = new CarInfoDao().branchDeleteChkCar(conn, arr[i]);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int branchEnrollChkCar(String[] arr, int branch) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		for(int i=0; i<arr.length; i++) {
			
			result = new CarInfoDao().branchEnrollChkCar(conn, arr[i], branch);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
