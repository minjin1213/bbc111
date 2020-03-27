package com.bbc.faq.model.service;

import static com.bbc.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.faq.model.dao.FaqDao;
import com.bbc.faq.model.vo.Faq;

public class FaqService {
	
	/**
	 * 1. FAQ 리스트 조회용 서비스
	 * @return	조회된 FAQ 리스트가 담겨있는 ArrayList객체
	 */
	public ArrayList<Faq> selectList(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectList(conn);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 2. FAQ 게시글 등록용 서비스
	 * @param f	글제목, 글내용, 작성자no를 담은 객체
	 * @return	처리된 행의 갯수
	 */
	public int insertFaq(Faq f) {
		Connection conn = getConnection();
		
		int result = new FaqDao().insertFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;	
	}
	
	/**
	 * 3. FAQ 게시글 수정용 서비스
	 * @param f	글제목, 글내용, 글번호를 담은 객체
	 * @return	처리된 행의 갯수
	 */
	public int updateFaq(Faq f) {
		Connection conn = getConnection();
		
		int result = new FaqDao().updateFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	/**
	 * 4. FAQ 게시글 삭제용 서비스
	 * @param no	삭제할 게시글 번호
	 * @return		처리된 행의 갯수
	 */
	public int deleteFaq(int no) {
		Connection conn = getConnection();
		
		int result = new FaqDao().deleteFaq(conn, no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
