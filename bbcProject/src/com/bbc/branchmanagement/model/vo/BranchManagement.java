package com.bbc.branchmanagement.model.vo;

// 지점 관리 테이블	.br
public class BranchManagement {
	
	private int branchNo;			// 지점 번호
	private String branchName;		// 지점명
	private String branchPhone;		// 전화번호
	private String branchZipcode;	// 우편 번호
	private String branchAddress;	// 상세 주소
	private String branchHrs;		// 영업시간
	private String branchDir;		// 교통 안내
	private int areaCode;		// 지역 코드
	private int memberNo;			// 회원 번호
	
	private String noticeContent;	// 차량예약시 지점선택 화면에서 보여줄 공지사항 내용
	private String eventContent;	// 차량예약시 지점선택 화면세서 보여줄 이벤트 내용
	//----------- 민기 추가
	private String areaName;		// 지역 이름
	private String mapX;			// x축 값
	private String mapY;			// y축 값
	
	
	public BranchManagement() {
		
	}
	
	public BranchManagement(int branchNo, String branchName, String branchPhone, String branchZipcode,
			String branchAddress, String branchHrs, String branchDir, int areaCode, int memberNo) {
		super();
		this.branchNo = branchNo;
		this.branchName = branchName;
		this.branchPhone = branchPhone;
		this.branchZipcode = branchZipcode;
		this.branchAddress = branchAddress;
		this.branchHrs = branchHrs;
		this.branchDir = branchDir;
		this.areaCode = areaCode;
		this.memberNo = memberNo;
	}
	
	// 차량예약시 지점선택시 사용
	public BranchManagement(int branchNo, String branchName, String noticeContent, String eventContent) {
		super();
		this.branchNo = branchNo;
		this.branchName = branchName;
		this.noticeContent = noticeContent;
		this.eventContent = eventContent;

	}
	
	// 지점 리스트 조회용 매개변수(민기)
		public BranchManagement(int branchNo, String areaName, String branchName, String branchPhone, String branchAddress
				,String mapX, String mapY) {
			super();
			this.branchNo = branchNo;
			this.areaName = areaName;
			this.branchName = branchName;
			this.branchPhone = branchPhone;
			this.branchAddress = branchAddress;
			this.mapX = mapX;
			this.mapY = mapY;
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

	public String getBranchPhone() {
		return branchPhone;
	}

	public void setBranchPhone(String branchPhone) {
		this.branchPhone = branchPhone;
	}

	public String getBranchZipcode() {
		return branchZipcode;
	}

	public void setBranchZipcode(String branchZipcode) {
		this.branchZipcode = branchZipcode;
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

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

	@Override
	public String toString() {
		return "BranchManagement [branchNo=" + branchNo + ", branchName=" + branchName + ", branchPhone=" + branchPhone
				+ ", branchZipcode=" + branchZipcode + ", branchAddress=" + branchAddress + ", branchHrs=" + branchHrs
				+ ", branchDir=" + branchDir + ", areaCode=" + areaCode + ", memberNo=" + memberNo + "]";
	}
	

}
