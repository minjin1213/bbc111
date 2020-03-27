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

}
