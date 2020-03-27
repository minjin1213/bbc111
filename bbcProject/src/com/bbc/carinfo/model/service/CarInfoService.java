package com.bbc.carinfo.model.service;

import static com.bbc.common.JDBCTemplate.close;
import static com.bbc.common.JDBCTemplate.commit;
import static com.bbc.common.JDBCTemplate.getConnection;
import static com.bbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.bbc.attachment.model.dao.AttachmentDao;
import com.bbc.attachment.model.vo.Attachment;
import com.bbc.carinfo.model.dao.CarInfoDao;
import com.bbc.carinfo.model.vo.CarInfo;

public class CarInfoService {

	public ArrayList<HashMap<String, String>> selectCarTypeRv(int carType, int rent_branch, long dayCount){
		Connection conn = getConnection();
		
		ArrayList<HashMap<String, String>> list = new CarInfoDao().selectCarTypeRv(conn, carType, rent_branch, dayCount);

		
		//HashMap<String, String[]> carList = new CarInfoDao().selectCarLisrRv(conn, carType, rent_branch);
		
		close(conn);
		
		return list;
		
	}
	
	// ----------------------------- 민기 Service
	public int adminAddCar(CarInfo ci, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		// 차량 정보 등록하는 Dao 호출
		int result = new CarInfoDao().adminAddCar(conn, ci, list);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
