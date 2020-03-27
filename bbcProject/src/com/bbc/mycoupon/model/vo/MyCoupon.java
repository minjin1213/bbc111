package com.bbc.mycoupon.model.vo;

import java.sql.Date;

// 나의 쿠폰 테이블	.mc
public class MyCoupon {
	
	private int memberNo;		// 회원 번호
	private int couponNo;		// 쿠폰 번호
	private String couponUsage;	// 쿠폰 사용 여부
	private Date couponUseDate;	// 쿠폰 사용 날짜
	
	public MyCoupon() {
		
	}
	
	public MyCoupon(int memberNo, int couponNo, String couponUsage, Date couponUseDate) {
		super();
		this.memberNo = memberNo;
		this.couponNo = couponNo;
		this.couponUsage = couponUsage;
		this.couponUseDate = couponUseDate;
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
