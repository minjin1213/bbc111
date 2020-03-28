package com.bbc.carinfo.model.vo;

// 차량 정보 테이블	.ci
public class CarInfo {
	
	private int carNo;				// 등록 번호
	private String carTypeName;		// 종류 이름
	private String carNum;			// 번호(번호판)
	private String carFuel;			// 연료 타입
	private String carColor;		// 색상
	private String carLunchYear;	// 연식
	private String carOption;		// 옵션
	private int carRidePeople;		// 승차 가능 인원 수
	private String carOutside; 		// 출차 여부
	private String carRepair;		// 사고 여부
	private String carModifyName;	// 수정 파일명
	private int carTypeNo;			// 차량 유형 번호
	private int branchNo;			// 지점 번호
	
	// 추가
	private String carType;
	
	public CarInfo() {
		
	}
	
	public CarInfo(int carNo, String carTypeName, String carNum, String carFuel, String carColor, String carLunchYear,
			String carOption, int carRidePeople, String carOutside, String carRepair, String carModifyName,
			int carTypeNo, int branchNo) {
		super();
		this.carNo = carNo;
		this.carTypeName = carTypeName;
		this.carNum = carNum;
		this.carFuel = carFuel;
		this.carColor = carColor;
		this.carLunchYear = carLunchYear;
		this.carOption = carOption;
		this.carRidePeople = carRidePeople;
		this.carOutside = carOutside;
		this.carRepair = carRepair;
		this.carModifyName = carModifyName;
		this.carTypeNo = carTypeNo;
		this.branchNo = branchNo;
	}

	public CarInfo(int carNo, String carTypeName, String carNum, String carFuel, String carColor, String carLunchYear,
			String carOption, int carRidePeople, String carModifyName, String carType) {
		super();
		this.carNo = carNo;
		this.carTypeName = carTypeName;
		this.carNum = carNum;
		this.carFuel = carFuel;
		this.carColor = carColor;
		this.carLunchYear = carLunchYear;
		this.carOption = carOption;
		this.carRidePeople = carRidePeople;
		this.carModifyName = carModifyName;
		this.carType = carType;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public String getCarTypeName() {
		return carTypeName;
	}

	public void setCarTypeName(String carTypeName) {
		this.carTypeName = carTypeName;
	}

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getCarFuel() {
		return carFuel;
	}

	public void setCarFuel(String carFuel) {
		this.carFuel = carFuel;
	}

	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}

	public String getCarLunchYear() {
		return carLunchYear;
	}

	public void setCarLunchYear(String carLunchYear) {
		this.carLunchYear = carLunchYear;
	}

	public String getCarOption() {
		return carOption;
	}

	public void setCarOption(String carOption) {
		this.carOption = carOption;
	}

	public int getCarRidePeople() {
		return carRidePeople;
	}

	public void setCarRidePeople(int carRidePeople) {
		this.carRidePeople = carRidePeople;
	}

	public String getCarOutside() {
		return carOutside;
	}

	public void setCarOutside(String carOutside) {
		this.carOutside = carOutside;
	}

	public String getCarRepair() {
		return carRepair;
	}

	public void setCarRepair(String carRepair) {
		this.carRepair = carRepair;
	}

	public String getCarModifyName() {
		return carModifyName;
	}

	public void setCarModifyName(String carModifyName) {
		this.carModifyName = carModifyName;
	}

	public int getCarTypeNo() {
		return carTypeNo;
	}

	public void setCarTypeNo(int carTypeNo) {
		this.carTypeNo = carTypeNo;
	}

	public int getBranchNo() {
		return branchNo;
	}

	public void setBranchNo(int branchNo) {
		this.branchNo = branchNo;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	@Override
	public String toString() {
		return "CarInfo [carNo=" + carNo + ", carTypeName=" + carTypeName + ", carNum=" + carNum + ", carFuel="
				+ carFuel + ", carColor=" + carColor + ", carLunchYear=" + carLunchYear + ", carOption=" + carOption
				+ ", carRidePeople=" + carRidePeople + ", carOutside=" + carOutside + ", carRepair=" + carRepair
				+ ", carModifyName=" + carModifyName + ", carTypeNo=" + carTypeNo + ", branchNo=" + branchNo + "]";
	}
	
	
	
	
}
