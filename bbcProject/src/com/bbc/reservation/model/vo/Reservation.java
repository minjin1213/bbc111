package com.bbc.reservation.model.vo;

import java.sql.Date;

// 차량예약정보 테이블	rv
/**
 * @author shinh
 *
 */
public class Reservation {
	
	private int reservationNo;
	private String memberStatus;
	private String reservationStatus;
	private Date rentDate;
	private Date returnDate;
	private String option;
	private int price;
	private String discountCategory;
	private int discountNo;
	private int discountPrice;
	private int cwdPrice;
	private int totalPrice;
	private int overTime;
	private int overTimePrice;
	private int overDayCount;
	private int overDayPrice;
	private String repair;
	private int repairDayCount;
	private int repairPrice;
	private int oilRent;
	private int oilReturn;
	private int oilPrice;
	private int returnPrice;
	private int carNo;
	private int memberNo;
	private int branchReservationNo;
	private int branchReturnNo;
	private int payNo;
	
	private String memberEmail;
	private String phone;
	private Date joinDate;
	private String memberId;
	private String memberName;
	private String carName;
	private int rowNum;				// 조회 번호
	private String branchName;
	
	public Reservation() {
		
	}

	public Reservation(int reservationNo, String memberStatus, String reservationStatus, Date rentDate, Date returnDate,
			String option, int price, String discountCategory, int discountNo, int discountPrice, int cwdPrice,
			int totalPrice, int overTime, int overTimePrice, int overDayCount, int overDayPrice, String repair,
			int repairDayCount, int repairPrice, int oilRent, int oilReturn, int oilPrice, int returnPrice, int carNo,
			int memberNo, int branchReservationNo, int branchReturnNo, int payNo) {
		super();
		this.reservationNo = reservationNo;
		this.memberStatus = memberStatus;
		this.reservationStatus = reservationStatus;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		this.option = option;
		this.price = price;
		this.discountCategory = discountCategory;
		this.discountNo = discountNo;
		this.discountPrice = discountPrice;
		this.cwdPrice = cwdPrice;
		this.totalPrice = totalPrice;
		this.overTime = overTime;
		this.overTimePrice = overTimePrice;
		this.overDayCount = overDayCount;
		this.overDayPrice = overDayPrice;
		this.repair = repair;
		this.repairDayCount = repairDayCount;
		this.repairPrice = repairPrice;
		this.oilRent = oilRent;
		this.oilReturn = oilReturn;
		this.oilPrice = oilPrice;
		this.returnPrice = returnPrice;
		this.carNo = carNo;
		this.memberNo = memberNo;
		this.branchReservationNo = branchReservationNo;
		this.branchReturnNo = branchReturnNo;
		this.payNo = payNo;
	}

	// 대여리스트 회원 조회 매개변수 생성자(rentList)
	public Reservation(int memberNo, int reservationNo, Date rentDate, Date returnDate, int carNo, String memberName,
			String carName) {
		super();
		this.memberNo = memberNo;
		this.reservationNo = reservationNo;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		this.carNo = carNo;
		this.memberName = memberName;
		this.carName = carName;
	}
	
	// 예약 회원 리스트 조회 매개변수(reservClient)
	public Reservation(int memberNo, String memberName, int reservationNo, String carName, int carNo, Date rentDate, Date returnDate) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.reservationNo = reservationNo;
		this.carName = carName;
		this.carNo = carNo;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
	}
	
	public Reservation(int memberNo, String memberId, String memberName, String phone, String memberEmail) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.phone = phone;
		this.memberEmail = memberEmail;
	}

	// 전체 회원 조회(wholeList)
	public Reservation(String memberName, int reservationNo, String carName, int carNo, Date rentDate, Date returnDate) {
		super();
		this.memberName = memberName;
		this.reservationNo = reservationNo;
		this.carName = carName;
		this.carNo = carNo;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
	}
	
	public Reservation(int reservationNo, int carNo, String carName, Date rentDate, Date returnDate, String branchName) {
		super();
		this.reservationNo = reservationNo;
		this.carNo = carNo;
		this.carName = carName;
		this.rentDate = rentDate;
		this.returnDate = returnDate;
		this.branchName = branchName;
	}

	public int getReservationNo() {
		return reservationNo;
	}

	
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getReservationStatus() {
		return reservationStatus;
	}

	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}

	public Date getRentDate() {
		return rentDate;
	}

	public void setRentDate(Date rentDate) {
		this.rentDate = rentDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDiscountCategory() {
		return discountCategory;
	}

	public void setDiscountCategory(String discountCategory) {
		this.discountCategory = discountCategory;
	}

	public int getDiscountNo() {
		return discountNo;
	}

	public void setDiscountNo(int discountNo) {
		this.discountNo = discountNo;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getCwdPrice() {
		return cwdPrice;
	}

	public void setCwdPrice(int cwdPrice) {
		this.cwdPrice = cwdPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getOverTime() {
		return overTime;
	}

	public void setOverTime(int overTime) {
		this.overTime = overTime;
	}

	public int getOverTimePrice() {
		return overTimePrice;
	}

	public void setOverTimePrice(int overTimePrice) {
		this.overTimePrice = overTimePrice;
	}

	public int getOverDayCount() {
		return overDayCount;
	}

	public void setOverDayCount(int overDayCount) {
		this.overDayCount = overDayCount;
	}

	public int getOverDayPrice() {
		return overDayPrice;
	}

	public void setOverDayPrice(int overDayPrice) {
		this.overDayPrice = overDayPrice;
	}

	public String getRepair() {
		return repair;
	}

	public void setRepair(String repair) {
		this.repair = repair;
	}

	public int getRepairDayCount() {
		return repairDayCount;
	}

	public void setRepairDayCount(int repairDayCount) {
		this.repairDayCount = repairDayCount;
	}

	public int getRepairPrice() {
		return repairPrice;
	}

	public void setRepairPrice(int repairPrice) {
		this.repairPrice = repairPrice;
	}

	public int getOilRent() {
		return oilRent;
	}

	public void setOilRent(int oilRent) {
		this.oilRent = oilRent;
	}

	public int getOilReturn() {
		return oilReturn;
	}

	public void setOilReturn(int oilReturn) {
		this.oilReturn = oilReturn;
	}

	public int getOilPrice() {
		return oilPrice;
	}

	public void setOilPrice(int oilPrice) {
		this.oilPrice = oilPrice;
	}

	public int getReturnPrice() {
		return returnPrice;
	}

	public void setReturnPrice(int returnPrice) {
		this.returnPrice = returnPrice;
	}

	public int getCarNo() {
		return carNo;
	}

	public void setCarNo(int carNo) {
		this.carNo = carNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBranchReservationNo() {
		return branchReservationNo;
	}

	public void setBranchReservationNo(int branchReservationNo) {
		this.branchReservationNo = branchReservationNo;
	}

	public int getBranchReturnNo() {
		return branchReturnNo;
	}

	public void setBranchReturnNo(int branchReturnNo) {
		this.branchReturnNo = branchReturnNo;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	
	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", memberStatus=" + memberStatus + ", reservationStatus="
				+ reservationStatus + ", rentDate=" + rentDate + ", returnDate=" + returnDate + ", option=" + option
				+ ", price=" + price + ", discountCategory=" + discountCategory + ", discountNo=" + discountNo
				+ ", discountPrice=" + discountPrice + ", cwdPrice=" + cwdPrice + ", totalPrice=" + totalPrice
				+ ", overTime=" + overTime + ", overTimePrice=" + overTimePrice + ", overDayCount=" + overDayCount
				+ ", overDayPrice=" + overDayPrice + ", repair=" + repair + ", repairDayCount=" + repairDayCount
				+ ", repairPrice=" + repairPrice + ", oilRent=" + oilRent + ", oilReturn=" + oilReturn + ", oilPrice="
				+ oilPrice + ", returnPrice=" + returnPrice + ", carNo=" + carNo + ", memberNo=" + memberNo
				+ ", branchReservationNo=" + branchReservationNo + ", branchReturnNo=" + branchReturnNo + ", payNo="
				+ payNo + "]";
	}
	
	
}
