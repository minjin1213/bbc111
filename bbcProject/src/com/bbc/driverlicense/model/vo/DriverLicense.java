package com.bbc.driverlicense.model.vo;

import java.sql.Date;

// 면허 등록 테이블	.dl
public class DriverLicense {

	private int driverLicenseNo;		// 면허 번호
	private String licenseType;			// 면허 종류
	private String rentNumber1;			// 면허증 번호1
	private String rentNumber2;			// 면허증 번호2
	private Date licenseIssueDate;		// 발급일
	private Date licenseReturnDate;		// 만료일
	private String licenseModifyName;	// 수정 파일명
	private int memberNo;				// 회원 번호
	
	public DriverLicense() {
		
	}
	
	public DriverLicense(int driverLicenseNo, String licenseType, String rentNumber1, String rentNumber2,
			Date licenseIssueDate, Date licenseReturnDate, String licenseModifyName,
			int memberNo) {
		super();
		this.driverLicenseNo = driverLicenseNo;
		this.licenseType = licenseType;
		this.rentNumber1 = rentNumber1;
		this.rentNumber2 = rentNumber2;
		this.licenseIssueDate = licenseIssueDate;
		this.licenseReturnDate = licenseReturnDate;
		this.licenseModifyName = licenseModifyName;
		this.memberNo = memberNo;
	}
	public DriverLicense(int driverLicenseNo, String licenseType, String rentNumber1, String rentNumber2,
			Date licenseIssueDate, Date licenseReturnDate, String licenseModifyName) {
		super();
		this.driverLicenseNo = driverLicenseNo;
		this.licenseType = licenseType;
		this.rentNumber1 = rentNumber1;
		this.rentNumber2 = rentNumber2;
		this.licenseIssueDate = licenseIssueDate;
		this.licenseReturnDate = licenseReturnDate;
		this.licenseModifyName = licenseModifyName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getDriverLicenseNo() {
		return driverLicenseNo;
	}

	public void setDriverLicenseNo(int driverLicenseNo) {
		this.driverLicenseNo = driverLicenseNo;
	}

	public String getLicenseType() {
		return licenseType;
	}

	public void setLicenseType(String licenseType) {
		this.licenseType = licenseType;
	}

	public String getRentNumber1() {
		return rentNumber1;
	}

	public void setRentNumber1(String rentNumber1) {
		this.rentNumber1 = rentNumber1;
	}

	public String getRentNumber2() {
		return rentNumber2;
	}

	public void setRentNumber2(String rentNumber2) {
		this.rentNumber2 = rentNumber2;
	}

	public Date getLicenseIssueDate() {
		return licenseIssueDate;
	}

	public void setLicenseIssueDate(Date licenseIssueDate) {
		this.licenseIssueDate = licenseIssueDate;
	}

	public Date getLicenseReturnDate() {
		return licenseReturnDate;
	}

	public void setLicenseReturnDate(Date licenseReturnDate) {
		this.licenseReturnDate = licenseReturnDate;
	}


	public String getLicenseModifyName() {
		return licenseModifyName;
	}

	public void setLicenseModifyName(String licenseModifyName) {
		this.licenseModifyName = licenseModifyName;
	}

	@Override
	public String toString() {
		return "DriverLicense [driverLicenseNo=" + driverLicenseNo + ", licenseType=" + licenseType + ", rentNumber1="
				+ rentNumber1 + ", rentNumber2=" + rentNumber2 + ", licenseIssueDate=" + licenseIssueDate
				+ ", licenseReturnDate=" + licenseReturnDate
				+ ", licenseModifyName=" + licenseModifyName + ", memberNo=" + memberNo + "]";
	}
	
	
	
	
}
