package com.bbc.event.model.vo;

import java.sql.Date;

// 이벤트 테이블	.ev
public class Event {
	
	private int eventNo;			// 이벤트 번호
	private String eventTitle;		// 제목
	private Date eventEnrollDate;	// 작성일
	private Date eventStartDate;	// 시작일
	private Date eventEndDate;		// 만료일
	private int eventReadCnt;		// 조회수
	private int discountRate;		// 할인율
	private String eventContent;	// 내용
	private int memberNo;			// 회원 번호
	
	private String memberName;		// 이벤트 리스트 조회시 필요한 회원 이름
	private int rowNum;				// 조회 번호
	
	private int prev;				// 이전글
	private int next;				// 다음글
	
	private int branchNo;			// 이벤트를 등록한 지점관리자의 지점번호
	
	public Event() {
		
	}
	
	public Event(int eventNo, String eventTitle, Date eventEnrollDate, Date eventStartDate, Date eventEndDate,
			int eventReadCnt, int discountRate, String eventContent, int memberNo, int prev, int next) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventEnrollDate = eventEnrollDate;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.eventReadCnt = eventReadCnt;
		this.discountRate = discountRate;
		this.eventContent = eventContent;
		this.memberNo = memberNo;
		this.prev = prev;
		this.next = next;
	}
	
	// 이벤트 리스트 조회용 매개변수
	public Event(int rowNum, int eventNo, String eventTitle, String memberName, Date eventStartDate, Date eventEndDate, int eventReadCnt) {
		super();
		this.rowNum = rowNum;
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.memberName = memberName;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.eventReadCnt = eventReadCnt;
	}
	
	// 지점선택시 해당 지점의 이벤트 조회시 사용
	public Event(int eventNo, String eventTitle, Date eventStartDate, Date eventEndDate, int discountRate, int branchNo) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.discountRate = discountRate;
		this.branchNo = branchNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Date getEventEnrollDate() {
		return eventEnrollDate;
	}

	public void setEventEnrollDate(Date eventEnrollDate) {
		this.eventEnrollDate = eventEnrollDate;
	}

	public Date getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public int getEventReadCnt() {
		return eventReadCnt;
	}

	public void setEventReadCnt(int eventReadCnt) {
		this.eventReadCnt = eventReadCnt;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	
	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventEnrollDate=" + eventEnrollDate
				+ ", eventStartDate=" + eventStartDate + ", eventEndDate=" + eventEndDate + ", eventReadCnt="
				+ eventReadCnt + ", discountRate=" + discountRate + ", eventContent=" + eventContent + ", memberNo="
				+ memberNo + ", memberName=" + memberName + "]";
	}
	
	
}
