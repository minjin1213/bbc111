package com.bbc.branchmanagement.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.branchmanagement.model.dao.BranchManagementDao;
import com.bbc.branchmanagement.model.vo.BranchManagement;
import static com.bbc.common.JDBCTemplate.*;

public class BranchManagementService {
	
	public ArrayList<BranchManagement> selectListArea(int areano) {
		
		Connection conn = getConnection();
		
		ArrayList<BranchManagement> list = new BranchManagementDao().selectListArea(conn, areano);
		
		close(conn);
		
		return list;
	}
	
	// ------------------------------ 민기 Service
	/**
	 * 1. 공지사항 전체 리스트 갯수 조회용 서비스
	 * @return 공지사항 리스트 갯수 리턴
	 */
	public int adminGetListCount() {
		Connection conn = getConnection();
		
		int listCount = new BranchManagementDao().adminGetListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 2. 지점리스트 조회용 서비스
	 * @return	지점 리스트를 담은 ArrayList객체
	 */
	public ArrayList<BranchManagement> adminBranchList(){
		Connection conn = getConnection();
		
		ArrayList<BranchManagement> list = new BranchManagementDao().adminBranchList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 3. 지점 추가용 서비스
	 * @param bm	등록할 지점 정보가 담긴 객체
	 * @return		처리 결과 리턴
	 */
	public int adminInsertBranch(BranchManagement bm) {
		Connection conn = getConnection();
		
		int result = new BranchManagementDao().adminInsertBranch(conn, bm);
		
		if(result > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
