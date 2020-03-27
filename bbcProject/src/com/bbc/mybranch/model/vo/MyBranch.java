package com.bbc.mybranch.model.vo;

// 나의 지점 테이블	.mb
public class MyBranch {

	private int memberNo;	// 회원번호
	private int branchNo;	// 지점번호
	private String branchName;
	private String AreaName;
	private String branchPhone;
	private String branchAddress;
	private String branchHrs;
	private String branchDir;
	
	public MyBranch() {
		
	}

	public MyBranch(int memberNo, int branchNo) {
		super();
		this.memberNo = memberNo;
		this.branchNo = branchNo;
		
	}
	
	public MyBranch(String branchName, String areaName, String branchPhone, String branchAddress, String branchHrs,
			String branchDir) {
		super();
		this.branchName = branchName;
		this.AreaName = areaName;
		this.branchPhone = branchPhone;
		this.branchAddress = branchAddress;
		this.branchHrs = branchHrs;
		this.branchDir = branchDir;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	
	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getAreaName() {
		return AreaName;
	}

	public void setAreaName(String areaName) {
		AreaName = areaName;
	}

	public String getBranchPhone() {
		return branchPhone;
	}

	public void setBranchPhone(String branchPhone) {
		this.branchPhone = branchPhone;
	}

	public String getBranchAddress() {
		return branchAddress;
	}

	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}

	public String getBranchHrs() {
		return branchHrs;
	}

	public void setBranchHrs(String branchHrs) {
		this.branchHrs = branchHrs;
	}

	public String getBranchDir() {
		return branchDir;
	}

	public void setBranchDir(String branchDir) {
		this.branchDir = branchDir;
	}

	@Override
	public String toString() {
		return "MyBranch [memberNo=" + memberNo + ", branchNo=" + branchNo + "]";
	}
	
	 
}
