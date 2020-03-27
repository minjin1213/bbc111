package com.bbc.cartype.model.vo;

// 차량 금액 정보 테이블	.ct
public class CarType {
	
	private int carTypeNo;			// 차량 유형 번호
	private String carTypeName;		// 차량 유형 이름
	private int rent1D;				// 1일 대여료
	private int rent1D6D;			// 3-6일 대여료
	private int rent7DP;			// 7일 이상 대여료
	private int over6T;				// 6시간 초과금
	private int over9T;				// 9시간 초과금
	private int over12T;			// 12시간 초과금
	private int memberCar;			// 알뜰카 대여료
	private int rentInsuType1;		// 보험유형1 금액
	private int rentInsuType2;		// 보험유형2 금액
	private int accidentPriceType1;	// 면책금(보험유형1)
	private int accidentPriceType2;	// 면책금(보험유형2)
	private int recessPrice;		// 휴차료
	
	public CarType() {
		
	}
	
	public CarType(int carTypeNo, String carTypeName, int rent1d, int rent1d6d, int rent7dp, int over6t, int over9t,
			int over12t, int memberCar, int rentInsuType1, int rentInsuType2, int accidentPriceType1,
			int accidentPriceType2, int recessPrice) {
		super();
		this.carTypeNo = carTypeNo;
		this.carTypeName = carTypeName;
		rent1D = rent1d;
		rent1D6D = rent1d6d;
		rent7DP = rent7dp;
		over6T = over6t;
		over9T = over9t;
		over12T = over12t;
		this.memberCar = memberCar;
		this.rentInsuType1 = rentInsuType1;
		this.rentInsuType2 = rentInsuType2;
		this.accidentPriceType1 = accidentPriceType1;
		this.accidentPriceType2 = accidentPriceType2;
		this.recessPrice = recessPrice;
	}
	
	// 차량예약시 차량유형 리스트 조회시 참조
	public CarType(int carTypeNo, String carTypeName, int rent1d, int rent1d6d, int rent7dp, int memberCar) {
		super();
		this.carTypeNo = carTypeNo;
		this.carTypeName = carTypeName;
		this.rent1D = rent1d;
		this.rent1D6D = rent1d6d;
		this.rent7DP = rent7dp;
		this.memberCar = memberCar;
	}

	public int getCarTypeNo() {
		return carTypeNo;
	}

	public void setCarTypeNo(int carTypeNo) {
		this.carTypeNo = carTypeNo;
	}

	public String getCarTypeName() {
		return carTypeName;
	}

	public void setCarTypeName(String carTypeName) {
		this.carTypeName = carTypeName;
	}

	public int getRent1D() {
		return rent1D;
	}

	public void setRent1D(int rent1d) {
		rent1D = rent1d;
	}

	public int getRent1D6D() {
		return rent1D6D;
	}

	public void setRent1D6D(int rent1d6d) {
		rent1D6D = rent1d6d;
	}

	public int getRent7DP() {
		return rent7DP;
	}

	public void setRent7DP(int rent7dp) {
		rent7DP = rent7dp;
	}

	public int getOver6T() {
		return over6T;
	}

	public void setOver6T(int over6t) {
		over6T = over6t;
	}

	public int getOver9T() {
		return over9T;
	}

	public void setOver9T(int over9t) {
		over9T = over9t;
	}

	public int getOver12T() {
		return over12T;
	}

	public void setOver12T(int over12t) {
		over12T = over12t;
	}

	public int getMemberCar() {
		return memberCar;
	}

	public void setMemberCar(int memberCar) {
		this.memberCar = memberCar;
	}

	public int getRentInsuType1() {
		return rentInsuType1;
	}

	public void setRentInsuType1(int rentInsuType1) {
		this.rentInsuType1 = rentInsuType1;
	}

	public int getRentInsuType2() {
		return rentInsuType2;
	}

	public void setRentInsuType2(int rentInsuType2) {
		this.rentInsuType2 = rentInsuType2;
	}

	public int getAccidentPriceType1() {
		return accidentPriceType1;
	}

	public void setAccidentPriceType1(int accidentPriceType1) {
		this.accidentPriceType1 = accidentPriceType1;
	}

	public int getAccidentPriceType2() {
		return accidentPriceType2;
	}

	public void setAccidentPriceType2(int accidentPriceType2) {
		this.accidentPriceType2 = accidentPriceType2;
	}

	public int getRecessPrice() {
		return recessPrice;
	}

	public void setRecessPrice(int recessPrice) {
		this.recessPrice = recessPrice;
	}

	@Override
	public String toString() {
		return "CarType [carTypeNo=" + carTypeNo + ", carTypeName=" + carTypeName + ", rent1D=" + rent1D + ", rent1D6D="
				+ rent1D6D + ", rent7DP=" + rent7DP + ", over6T=" + over6T + ", over9T=" + over9T + ", over12T="
				+ over12T + ", memberCar=" + memberCar + ", rentInsuType1=" + rentInsuType1 + ", rentInsuType2="
				+ rentInsuType2 + ", accidentPriceType1=" + accidentPriceType1 + ", accidentPriceType2="
				+ accidentPriceType2 + ", recessPrice=" + recessPrice + "]";
	}
	
	

}
