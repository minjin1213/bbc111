package com.bbc.mycoupon.model.vo;

import java.sql.Date;

// 나의 쿠폰 테이블	.mc
public class MyCoupon {
	
	private int memberNo;		// 회원 번호
	private int couponNo;		// 쿠폰 번호
	private String couponUsage;	// 쿠폰 사용 여부
	private Date couponUseDate;	// 쿠폰 사용 날짜
	private String couponName;		// 쿠폰명
	private String couponType;		// 쿠폰종류
	private Date couponPost;		// 등록일
	private Date couponExp;			// 만료일
	private String couponCondition;	// 사용 조건
	private int couponDc;			// 할인금액
	private String couponUse;       // 사용여
	
	public MyCoupon() {
		
	}
	
	

	public MyCoupon(String couponUse, String couponName, Date couponPost, Date couponExp, String couponType, String couponCondition,
			int couponDc) {
		super();
		this.couponUse = couponUse;
		this.couponName = couponName;
		this.couponPost = couponPost;
		this.couponExp = couponExp;
		this.couponType = couponType;
		this.couponCondition = couponCondition;
		this.couponDc = couponDc;
	}



	public MyCoupon(int memberNo, int couponNo, String couponUsage, Date couponUseDate, String couponName,
			String couponType, Date couponPost, Date couponExp, String couponCondition, int couponDc,
			String couponUse) {
		super();
		this.memberNo = memberNo;
		this.couponNo = couponNo;
		this.couponUsage = couponUsage;
		this.couponUseDate = couponUseDate;
		this.couponName = couponName;
		this.couponType = couponType;
		this.couponPost = couponPost;
		this.couponExp = couponExp;
		this.couponCondition = couponCondition;
		this.couponDc = couponDc;
		this.couponUse = couponUse;
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



	public String getCouponName() {
		return couponName;
	}



	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}



	public String getCouponType() {
		return couponType;
	}



	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}



	public Date getCouponPost() {
		return couponPost;
	}



	public void setCouponPost(Date couponPost) {
		this.couponPost = couponPost;
	}



	public Date getCouponExp() {
		return couponExp;
	}



	public void setCouponExp(Date couponExp) {
		this.couponExp = couponExp;
	}



	public String getCouponCondition() {
		return couponCondition;
	}



	public void setCouponCondition(String couponCondition) {
		this.couponCondition = couponCondition;
	}



	public int getCouponDc() {
		return couponDc;
	}



	public void setCouponDc(int couponDc) {
		this.couponDc = couponDc;
	}



	public String getCouponUse() {
		return couponUse;
	}



	public void setCouponUse(String couponUse) {
		this.couponUse = couponUse;
	}



	@Override
	public String toString() {
		return "MyCoupon [memberNo=" + memberNo + ", couponNo=" + couponNo + ", couponUsage=" + couponUsage
				+ ", couponUseDate=" + couponUseDate + ", couponName=" + couponName + ", couponType=" + couponType
				+ ", couponPost=" + couponPost + ", couponExp=" + couponExp + ", couponCondition=" + couponCondition
				+ ", couponDc=" + couponDc + ", couponUse=" + couponUse + "]";
	}


	
	
}
