package com.bbc.mybranch.model.service;

import static com.bbc.common.JDBCTemplate.close;
import static com.bbc.common.JDBCTemplate.commit;
import static com.bbc.common.JDBCTemplate.getConnection;
import static com.bbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.area.model.dao.AreaDao;
import com.bbc.mybranch.model.dao.MyBranchDao;
import com.bbc.mybranch.model.vo.MyBranch;

public class MyBranchService {

	public int insertMyBranch(MyBranch mb) {
		
		Connection conn = getConnection();
		
		int result = new MyBranchDao().insertMyBranch(conn, mb);
			
			if(result >0) {
				commit(conn);
			}else{
				rollback(conn);
			}
			close(conn);
			
			return result;
		
		
	}
	public ArrayList<MyBranch> selectBranchList(int userno){
		
		Connection conn = getConnection();
			
		ArrayList<MyBranch> branchList = new MyBranchDao().selectBranchList(conn,userno);
		
		
		close(conn);
		return branchList;
	}
	
	public int deleteMyBranch(int userno,int bno) {
		
		Connection conn = getConnection();
		
		int result = new MyBranchDao().deleteMyBranch(conn,userno, bno);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
