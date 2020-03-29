package com.bbc.notice.model.service;

import static com.bbc.common.JDBCTemplate.close;
import static com.bbc.common.JDBCTemplate.commit;
import static com.bbc.common.JDBCTemplate.getConnection;
import static com.bbc.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.bbc.attachment.model.vo.Attachment;
import com.bbc.common.page.vo.PageInfo;
import com.bbc.notice.model.dao.NoticeDao;
import com.bbc.notice.model.vo.Notice;
import com.bbc.notice.model.vo.UserPageInfo;

public class NoticeService {
	
	/**
	 * 1. 공지사항 리스트 조회
	 * @param memNo		관리자 번호
	 * @param pi		페이지 객체
	 * @return			조회된 공지사항 리스트 객체
	 */
	public ArrayList<Notice> branchSelectNoticeList(int memNo, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().branchSelectNoticeList(conn, memNo, pi);
		
		close(conn);
		
		return list;
	}
	
	/**
	 * 2. 공지사항 상세 조회
	 * @param nno		조회하고자 하는 공지사항 번호
	 * @return			조회된 공지사항 객체
	 */
	public Notice branchSelectNotice(int nno) {
		
		Connection conn = getConnection();
		
		Notice nList = null;
		
		// 조회수 증가
		int result = new NoticeDao().increaseCount(conn, nno);
		
		if(result > 0) {
			commit(conn);
			
			// 공지사항 조회
			nList = new NoticeDao().branchSelectNotice(conn, nno);
		} else {
			rollback(conn);
		}
		
		return nList;
	}
	
	/**
	 * 3. 공지사항 한개 삭제
	 * @param nno		삭제할 공지사항 번호
	 * @return			삭제 후 조회되는 행의 개수
	 */
	public int branchDeleteOneNotice(int nno) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().branchDeleteOneNotice(conn, nno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	/**
	 * 4. 공지사항 등록
	 * @param n			등록할 공지사항 객체
	 * @param list		등록할 첨부파일 객체
	 * @param memNo		로그인한 관리자 번호
	 * @param flag		중요 공지사항 체크여부
	 * @return			공지사항 등록 후 행의 개수
	 */
	public int branchInsertNotice(Notice n, ArrayList<Attachment> list, int memNo) {
		
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().branchInsertNotice(conn, n, memNo);
		int result2 = new NoticeDao().branchInsertAttachment(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 * result2;
	}
	
	
	/**
	 * 5. 공지사항 수정용 조회
	 * @param nno	수정할 공지사항 번호
	 * @return		수정할 공지사항 객체
	 */
	public Notice branchSelectUpdateNotice(int nno) {
		
		Connection conn = getConnection();
		
		Notice nList = new NoticeDao().branchSelectNotice(conn, nno);

		close(conn);
		
		return nList;
	}
	
	/**
	 * 6. 공지사항 수정용 서비스
	 * @param n		입력했던 공지사항 객체
	 * @param list	첨부파일 리스트
	 * @param memNo	로그인한 회원 번호
	 * @return		두 실행 결과를 곱한 값
	 */
	public int branchUpdateNotice(Notice n, ArrayList<Attachment> list, int memNo) {
		
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().branchUpdateNotice(conn, n, memNo);
		int result2 = new NoticeDao().branchInsertAttachment(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1 * result2;
	}
	
	/**
	 * 7. 첨부파일 조회 서비스
	 * @param nno	해당 파일을 조회할 공지사항 번호
	 * @return		첨부파일 리스트
	 */
	public ArrayList<Attachment> branchSelectAttachment(int nno) {
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> aList = new NoticeDao().branchSelectAttachment(conn, nno);
		
		close(conn);
		
		return aList;
	}
	
	/**
	 * 8. 공지사항 리스트 개수
	 * @return	실행후 행의 값
	 */
	public int getNoticeCount() {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().getNoticeCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public int getMainNoticeCount() {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().getMainNoticeCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public int branchDeleteChkNotice(String[] arr) {
		
		Connection conn = getConnection();
		
		int result = 0;
		
		for(int i=0; i<arr.length; i++) {
			
			result = new NoticeDao().branchDeleteChkNotice(conn, arr[i]);
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Notice> branchMainNoticeList(int memNo, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().branchMainNoticeList(conn, memNo, pi);
		
		close(conn);
		
		return list;
	}
	
	
	/**
	 * 9. 차랑예약시 지점선택시 선택한 지점의 공지사항 리스트 조회
	 * @param branchNo	조회할 지점 번호
	 * @return			지점의 공지사항 리스트
	 */
	public Notice selectListByBr(int branchNo) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectByBranch(conn, branchNo);
		
		close(conn);
		
		return n;
		
	}
	
	//------------------------------------------ 민기 Service
	/**
	 * 1_1. 공지사항 전체 리스트 갯수 조회용 서비스
	 * 
	 * @return 공지사항 리스트 갯수
	 */
	public int adminGetListCount() {
		Connection conn = getConnection();

		int listCount = new NoticeDao().adminGetListCount(conn);

		close(conn);

		return listCount;
	}

	/**
	 * 2. 공지사항 전체 리스트 조회용 서비스
	 * 
	 * @param pi 페이징바 정보 담은 객체
	 * @return 공지사항 리스트 담은 객체
	 */
	public ArrayList<Notice> adminSelectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Notice> list = new NoticeDao().adminSelectList(conn, pi);

		close(conn);

		return list;
	}

	/**
	 * 3. 공지사항 등록용 서비스
	 * 
	 * @param n    Notice테이블에 insert할 정보가 담겨있는 객체
	 * @param list Attachment테이블에 insert할 정보가 담겨있는 객체
	 * @return 처리 결과 리턴
	 */
	public int adminUserAddNotice(Notice n, ArrayList<Attachment> list) {
		Connection conn = getConnection();

//		System.out.println(n.getNoticeField());

		// 공지사항 작성 전달 
		int result1 = new NoticeDao().adminUserNotice(conn, n); 
		// 첨부파일 저장 전달 
		int result2 = new NoticeDao().adminUserAttachment(conn, list);
	

		return result1 * result2;
	}
	
	/**
	 * 4. 공지사항 상세보기 서비스
	 * @param no	조회할 공지사항 번호
	 * @return		공지사항 정보를 담은 객체
	 */
	 public Notice adminUserNoticeDetail(int no){ 		 
		 Connection conn = getConnection();
	 
		 Notice n = new NoticeDao().adminUserNoticeDetail(conn, no);
	 
		 close(conn);
	 
		 return n; 
	 }
	 
	 /**
	  * 5. 공지사항 수정용 서비스
	 * @param n		수정할 공지사항 정보를 담은 객체
	 * @return		처리 결과 리턴
	 */
	public int adminUserNoticeUpdate(Notice n) {		 
		 Connection conn = getConnection();
		 
		 int result = new NoticeDao().adminUserNoticeUpdate(conn, n);
		 
		 if(result > 0) {
			 commit(conn);
		 }else {
			 rollback(conn);
		 }
		 close(conn);
		 
		 return result;
	 }
	
	/**
	 * 6. 공지사항 삭제용 서비스
	 * @param no	삭제할 공지사항 번호
	 * @return		처리 결과 리턴
	 */
	public int adminUserNoticeDelete(int no) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().adminUserNoticeDelete(conn, no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	/**
	 * 사용자 공지사항 리스트 개수 조회 서비스
	 * @return 공지사항 리스트 개수
	 */
	public int UserGetListCount() {

		Connection conn = getConnection();

		int listCount = new NoticeDao().UserGetListCount(conn);

		close(conn);

		return listCount;
	}
	
	/**
	 * user. 공지사항  리스트 조회용 서비스
	 * @return	공지사항 리스트 담은 객체
	 */
	public ArrayList<Notice> userSelectList(UserPageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().userSelectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public Notice UserSelectNotice(int nno) {
		Connection conn = getConnection();		

		int result = new NoticeDao().UserincreaseCount(conn, nno);
		Notice n = null;
		if(result > 0) {
			commit(conn);
			n = new NoticeDao().UserSelectNotice(conn, nno);
		}else {
			rollback(conn);
		}
		close(conn);
		return n;

	}
	
	
	


}
