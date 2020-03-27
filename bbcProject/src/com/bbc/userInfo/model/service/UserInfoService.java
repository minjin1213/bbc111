package com.bbc.userInfo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.bbc.common.JDBCTemplate.*;
import com.bbc.userInfo.model.dao.UserInfoDao;
import com.bbc.userInfo.model.vo.UserInfo;

import com.bbc.common.page.vo.PageInfo;

public class UserInfoService{

	//로그인
	public UserInfo loginUserInfo(String memberId, String memberPwd) {
		
		Connection conn = getConnection();
		
		UserInfo loginUser = new UserInfoDao().loginUserInfo(conn, memberId, memberPwd);
		
		close(conn);
		
		return loginUser;
	}
	
	//회원가입용
  public int insertUser(UserInfo mem) {
		
		Connection conn = getConnection();
		
		int result = new UserInfoDao().insertUser(conn,mem);
		
		if (result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
  
  //회원정보 조회용 
	public ArrayList<UserInfo> viewMyInfo(int mno) {
		  
		 Connection conn = getConnection();
		  
		 ArrayList<UserInfo> info = new UserInfoDao().viewMyInfo(conn, mno);
		 
		 close(conn);
		
		 return info;
		  
	  }
  public UserInfo selectUser(int userNo) {
		  Connection conn = getConnection();
		  
		  UserInfo mem = new UserInfoDao().selectUser(conn,userNo);
		  
		  close(conn);
		  
		  return mem;
	  }

	// ---------------------------------- 민기 Service
	/**
	 * 1. 등록된 유저수 조회용 서비스
	 * @return	유저 수 리턴
	 */
	public int adminGetListCount() {
		Connection conn = getConnection();
		
		int listCount = new UserInfoDao().adminGetListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 2. 유저 전체 리스트 조회용 서비스
	 * @param pi	페이지 정보 담긴 객체	
	 * @return		유저 리스트가 담긴 객체 리턴
	 */
	public ArrayList<UserInfo> adminSelectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<UserInfo> list = new UserInfoDao().adminSelectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 3. 회원 정지시키는 서비스
	 * @param blackNo	정지시킬 회원 번호
	 * @return			처리 결과 리턴
	 */
	public int adminBlackUser(int blackNo) {
		Connection conn = getConnection();
		
		int result = new UserInfoDao().adminBlackUser(conn, blackNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 4. 블랙 회원수 조회용 서비스
	 * @return	블랙회원 인원수 리턴
	 */
	public int adminGetBlackListCount() {
		Connection conn = getConnection();
		
		int listCount = new UserInfoDao().adminGetBlackListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 5. 블랙 회원 리스트 조회용 서비스
	 * @param pi	페이지 정보가 담긴 객체
	 * @return		블랙 회원 리스트가 담긴 객체 리턴
	 */
	public ArrayList<UserInfo> adminBlackSelectList(){
		Connection conn = getConnection();
		
		ArrayList<UserInfo> list = new UserInfoDao().adminBlackSelectList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 6. 정지된 회원 해제하는 서비스
	 * @param no	정지 해제할 회원 번호
	 * @return		처리 결과 리턴
	 */
	public int adminBlackUpdate(int no) {
		Connection conn = getConnection();
		
		int result = new UserInfoDao().adminBlackUpdate(conn, no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
}
