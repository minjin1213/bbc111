package com.bbc.mycoupon.model.vo;

import java.sql.Date;

// 나의 쿠폰 테이블	.mc
public class MyCoupon {
	
	private int memberNo;		// 회원 번호
	private int couponNo;		// 쿠폰 번호
	private String couponUsage;	// 쿠폰 사용 여부
	private Date couponUseDate;	// 쿠폰 사용 날짜
	
	
	//추가한것 
	private String couponName;
	private Date couponEndDate; // 쿠폰 만료 날짜
	
	public MyCoupon() {
		
	}
	
	public MyCoupon(int memberNo, int couponNo, String couponUsage, Date couponUseDate, Date couponEndDate, String couponName) {
		super();
		this.memberNo = memberNo;
		this.couponNo = couponNo;
		this.couponUsage = couponUsage;
		this.couponUseDate = couponUseDate;
		this.couponEndDate = couponEndDate;
		this.couponName = couponName;
		
	}
	
	
	
	public MyCoupon(String couponUsage,String couponName, Date couponEndDate,Date couponUseDate ) {
		super();
		this.couponUsage = couponUsage;
		this.couponUseDate = couponUseDate;
		this.couponEndDate = couponEndDate;
		this.couponName = couponName;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	// 차량예약시 나의 쿠폰조회시 사용
	public MyCoupon(int couponNo) {
		super();		
		this.couponNo = couponNo;
	}

	public Date getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponEndDate(Date couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponUsage() {
		return couponUsage;
	}

	public void setCouponUsage(String couponUsage) {
		this.couponUsage = couponUsage;
	}

	public Date getCouponUseDate() {
		return couponUseDate;
	}

	public void setCouponUseDate(Date couponUseDate) {
		this.couponUseDate = couponUseDate;
	}

	@Override
	public String toString() {
		return "MyCoupon [memberNo=" + memberNo + ", couponNo=" + couponNo + ", couponUsage=" + couponUsage
				+ ", couponUseDate=" + couponUseDate + "]";
	}

	
}

