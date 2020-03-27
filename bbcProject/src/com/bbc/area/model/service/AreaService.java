package com.bbc.area.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.area.model.dao.AreaDao;
import com.bbc.area.model.vo.Area;
import static com.bbc.common.JDBCTemplate.*;

public class AreaService {
	
	/**
	 * 1. 지역  리스트 조회용 서비스
	 * @return	조회된 지역 리스트가 담겨있는 ArrayList 객체
	 */
	public ArrayList<Area> selectList() {
		
		Connection conn = getConnection();
		
		ArrayList<Area> list = new AreaDao().selectList(conn);
		
		close(conn);
		
		return list;
		
	}
	

}
