package com.bbc.userInfo.model.vo;

import java.sql.Date;

// 회원 정보 테이블	.ui
public class UserInfo {
	
	private int memberNo;			// 회원 번호
	private String memberId;		// 회원 아이디
	private String memberPwd;		// 회원 비밀번호
	private String memberName;		// 회원 이름
	private String memberZipcode;	// 우편 번호
	private String memberAddress;	// 상세 주소
	private String phone;			// 연락처
	private String rrn;				// 주민등록번호
	private String memberEmail;		// 이메일
	private String gender;			// 성별
	private int authorityNo;		// 권한 번호
	private Date joinDate;			// 가입일
	private String status;			// 회원 상태 (1:사용중, 2:탈퇴, 3:정지)
	private int branchNo;			// 지점 번호
	//------------------- 추가 변수(민기)
	private String reason;			// 정지,탈퇴 사유
	
	public UserInfo() {
		
	}

	public UserInfo(int memberNo, String memberId, String memberPwd, String memberName, String memberZipcode,
			String memberAddress, String phone, String rrn, String memberEmail, String gender, int authorityNo,
			Date joinDate, String status, int branchNo) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberZipcode = memberZipcode;
		this.memberAddress = memberAddress;
		this.phone = phone;
		this.rrn = rrn;
		this.memberEmail = memberEmail;
		this.gender = gender;
		this.authorityNo = authorityNo;
		this.joinDate = joinDate;
		this.status = status;
		this.branchNo = branchNo;
	}

	// 회원,정지회원 리스트 조회시 사용하는 매개변수
	public UserInfo(int memberNo, String memberId, String memberPwd, String memberName, String memberZipcode,
			String memberAddress, String phone, String rrn, String memberEmail, String gender, int authorityNo,
			Date joinDate, String status, String reason) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberZipcode = memberZipcode;
		this.memberAddress = memberAddress;
		this.phone = phone;
		this.rrn = rrn;
		this.memberEmail = memberEmail;
		this.gender = gender;
		this.authorityNo = authorityNo;
		this.joinDate = joinDate;
		this.status = status;
		this.reason = reason;
	}
	
	
	// 대여리스트 상세 조회 멤버 정보 테이블
	public UserInfo(String memberName, String memberZipcode, String memberAddress, String rrn, String phone, 
			String memberEmail) {
		super();
		this.memberName = memberName;
		this.memberZipcode = memberZipcode;
		this.memberAddress = memberAddress;
		this.rrn = rrn;
		this.phone = phone;
		this.memberEmail = memberEmail;
	}
	
	
	// 회원 가입용 
	public UserInfo(String memberId, String memberPwd, String memberName, String memberZipcode, String memberAddress,
			String phone, String rrn, String memberEmail, String gender) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberZipcode = memberZipcode;
		this.memberAddress = memberAddress;
		this.phone = phone;
		this.rrn = rrn;
		this.memberEmail = memberEmail;
		this.gender = gender;
	}
	
	// 회원정보 수정에서 조회보기용 
	public UserInfo(String memberId, String memberName, String memberEmail, String phone, String memberZipcode) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.phone = phone;
		this.memberZipcode = memberZipcode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberZipcode() {
		return memberZipcode;
	}

	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRrn() {
		return rrn;
	}

	public void setRrn(String rrn) {
		this.rrn = rrn;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAuthorityNo() {
		return authorityNo;
	}

	public void setAuthorityNo(int authorityNo) {
		this.authorityNo = authorityNo;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	@Override
	public String toString() {
		return "UserInfo [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberZipcode=" + memberZipcode + ", memberAddress=" + memberAddress
				+ ", phone=" + phone + ", rrn=" + rrn + ", memberEmail=" + memberEmail + ", gender=" + gender
				+ ", authorityNo=" + authorityNo + ", joinDate=" + joinDate + ", status=" + status + ", branchNo="
				+ branchNo + "]";
	}
	
	
}
