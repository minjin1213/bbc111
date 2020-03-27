package com.bbc.notice.model.vo;

import java.sql.Date;

// 공지사항 테이블	.no
public class Notice {
	
	private int noticeNo;			// 문서번호
	private String noticeTitle;		// 제목
	private String noticeContent;	// 내용
	private Date enrollDate;		// 작성일
	private Date modifyDate;		// 등록일
	private int noticeReadCnt;		// 조회수
	private int memberNo;			// 회원 번호
	private int noticeImport;		// 중요공지사항 여부(1-중요공지사항)
	private int noticeField;		// 공지분류(1-사용자,2-지점)
	private int branchNo;			// 공지사항 등록자(지점관리자)의 지점번호
	
	private String memberName;		// 이벤트 리스트 조회시 필요한 회원 이름
	private int rowNum;				// 조회 번호
	
	private int prev;				// 이전글
	private int next;				// 다음글
	//-------------------- 추가된 변수(민기)
   private String rename;			// 변경된 파일이름
	
	
	public Notice() {
		
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent, Date enrollDate, Date modifyDate,
			int noticeReadCnt, int memberNo, int noticeImport, int noticeField, int branchNo, int prev, int next) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.noticeReadCnt = noticeReadCnt;
		this.memberNo = memberNo;
		this.noticeImport = noticeImport;
		this.noticeField = noticeField;
		this.branchNo = branchNo;
		this.prev = prev;
		this.next = next;
	}

	// 공지사항 리스트 조회용 매개변수
	public Notice(int rowNum, int noticeNo, String noticeTitle, String memberName, Date enrollDate, int noticeReadCnt) {
		super();
		this.rowNum = rowNum;
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.memberName = memberName;
		this.enrollDate = enrollDate;
		this.noticeReadCnt = noticeReadCnt;
	}
	
	// 차량예약시 지점별 공지사항 리스트 조회시 사용
	public Notice(String noticeTitle, String noticeContent) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	// 공지사항 전체 조회용 매개변수(민기)
   public Notice(int noticeNo, String noticeTitle, String memberName, Date modifyDate, int noticeReadCnt) {
	super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.memberName = memberName;
		this.modifyDate = modifyDate;
		this.noticeReadCnt = noticeReadCnt;
	}
   
   // 공지사항 전체 조회용 (용환)
   public Notice(int noticeNo, String noticeTitle, String noticeContent, Date enrollDate, int noticeReadCnt,
			int noticeField) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.enrollDate = enrollDate;
		this.noticeReadCnt = noticeReadCnt;
		this.noticeField = noticeField;
	}

	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getNoticeReadCnt() {
		return noticeReadCnt;
	}

	public void setNoticeReadCnt(int noticeReadCnt) {
		this.noticeReadCnt = noticeReadCnt;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getNoticeImport() {
		return noticeImport;
	}

	public void setNoticeImport(int noticeImport) {
		this.noticeImport = noticeImport;
	}

	public int getNoticeField() {
		return noticeField;
	}

	public void setNoticeField(int noticeField) {
		this.noticeField = noticeField;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public String getRename() {
		return rename;
	}

	public void setRename(String rename) {
		this.rename = rename;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", noticeReadCnt=" + noticeReadCnt
				+ ", memberNo=" + memberNo + ", noticeImport=" + noticeImport + ", noticeField=" + noticeField + "]";
	}
	
}
