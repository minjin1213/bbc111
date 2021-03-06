package com.bbc.myinquiry.model.service;

import static com.bbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.common.page.vo.PageInfo;
import com.bbc.myinquiry.model.dao.MyInquiryDao;
import com.bbc.myinquiry.model.vo.MyInquiry;
import com.bbc.myinquiry.model.vo.UserPageInfo;
import com.bbc.userInfo.model.vo.UserInfo;

public class MyInquiryService {
	// ---------------------------------- 민기 Service
	/**
	 * 1_1. 문의내역 리스트 총 갯수 조회용 서비스
	 * @return	게시판 리스트 총 갯수
	 */
	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new MyInquiryDao().adminGetListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/**
	 * 1_2. 문의내역 리스트 조회용 서비스
	 * @param pi	currentPage, TableLimit 값이 담겨있는 PageInfo객체
	 * @return		현재페이지에 보여져야할 게시판리스트
	 */
	public ArrayList<MyInquiry> adminSelectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<MyInquiry> list = new MyInquiryDao().adminSelectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 2. 문의내역 상세조회용 서비스
	 * @param iNo	조회하고자 하는 게시글 번호
	 * @return		조회된 게시글 객체
	 */
	public MyInquiry adminSelectDetail(int iNo) {
		Connection conn = getConnection();
		
		MyInquiry mi = new MyInquiryDao().adminSelectDetail(conn, iNo);
				
		close(conn);
		
		return mi;
	}
	
	/**
	 * 3. 문의내역 답변 업데이트 서비스
	 * @param iNo	업데이트할 게시글 번호
	 * @return		처리된 행의 갯수
	 */
	public int adminUpdate(int no, String answer) {
		Connection conn = getConnection();
		
		int result = new MyInquiryDao().adminUpdate(conn, no, answer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}
	
	//사용자 총 리스트(용환)
	public int UserGetListCount(int memNo1) {
		Connection conn = getConnection();
		
		int listCount = new MyInquiryDao().UserGetListCount(conn, memNo1);
		
		close(conn);
		
		return listCount;
		
	}
	//사용자 목록 리스트(용환)
	public ArrayList<MyInquiry> UserselectList(int memNo1,UserPageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<MyInquiry> list = new MyInquiryDao().UserselectList(conn,memNo1, pi);
		
		close(conn);
		
		return list;
	}
	
	//상세조회에서 유저정보 가져오는거(용환)
	public ArrayList<UserInfo> userInfoGetList(int memNo1){
		Connection conn = getConnection();
		
		ArrayList<UserInfo> list = new MyInquiryDao().userInfoGetList(conn,memNo1);
		
		close(conn);
		
		return list;
	}
	
	//사용자(용환)
	public int insertUserMyInquiry(MyInquiry m) {
		Connection conn = getConnection();
		
		int result = new MyInquiryDao().insertUserMyInquiry(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	//사용자(용환)
	public MyInquiry UserSelectDetail(int min,int memNo1) {
		Connection conn = getConnection();
		
		MyInquiry m = new MyInquiryDao().UserSelectDetail(conn, min, memNo1);
		
		
		close(conn);
		
		return m;
	}

}
