/**
 * 차량예약관련 스크립트 파일
 */

// 대여일시/반납일시 선택시 기본시간을 10시로 셋팅(차량선택 페이지에서만 사용)
if(currentJSMenu == "차량선택") {
	var rent_branch;		// 대여지점 코드
	var return_branch;		// 반납지점 코드
	var rent_branchnm;		// 대여지짐 이름
	var return_branchnm;	// 반납지점 이름
	var carType;			// 차량유형
	var rentDate;			// 대여일시
	var returnDate;			// 반납일시
	
	var d = new Date();
	d.setHours(10);
	d.setMinutes(00);
	d.setSeconds(00);	
}

$(function() {
	
	if(currentJSMenu == "차량선택") {
		if(preLink == "Y") {
			rent_branch = rentBrCode; 
			return_branch = returnBrCode;
			rent_branchnm = rentBrName;
			return_branchnm = returnBrName;
			carType = carTypeInfo;
			rentDate = rentDate; 
			returnDate = returnDate;
			$('input[name="rent_branch"]').val(rentBrName);
			$('input[name="return_branch"]').val(returnBrName);
			$('input[name="reservation_date"]').val(rentDate);
			$('input[name="return_date"]').val(returnDate);
			
			displayCarInfo();
			serachCarList();
		}
	}
			
  	$('#selectDate').daterangepicker({  		
  		autoUpdateInput: false,
      	timePicker: true,    
      	timePicker24Hour: true,
      	timePickerIncrement: 30,
      	startDate: d,
      	endDate: d,
      	locale: {
        	format: 'YYYY-MM-DD HH:mm',
        	separator: ' ~ ',
        	applyLabel: '확인',
        	cancelLabel: '취소'                                      
      	}
  	});
  	
  	$('#selectDate').on('apply.daterangepicker', function(ev, picker) { 
  		$('input[name="reservation_date"]').val(picker.startDate.format('YYYY-MM-DD HH:mm')); 
      	$('input[name="return_date"]').val(picker.endDate.format('YYYY-MM-DD HH:mm')); 
      	rentDate = picker.startDate.format('YYYY-MM-DD HH:mm');
      	returnDate = picker.endDate.format('YYYY-MM-DD HH:mm');
	});
  	
  	//$('#selectDate').on('cancel.daterangepicker', function(ev, picker) {	  	
	//
  	//});
  	
  	// 대여일시/대여지점/차종 선택 후 검색 클릭시 오른쪽에 검색결과가 보여지도록 처리
  	$('#serchCar').click(function () { 
  		serachCarList();  		
  	}); 
  	   	
  	// 페이지로드시 기본으로 선택된 지점리스트 조회(차량선택 페이지에서만 수행)
  	if($('#brancharea').val() != "" && currentJSMenu == "차량선택") { 
  		displayBranchList($('#brancharea').val());
  	}  	
  	
  	// 지역선택시 선택된 지역의 지점리스트 조회
  	$('#brancharea').on('change', function() {
  		displayBranchList($(this).val());
  	});
  	  	  	
  	// 지점선택 화면에서 지점 이벤트 클릭시 수행
  	$('#eventInfo').on('show.bs.modal', function (event) {
  		var rTarget = $(event.relatedTarget)
  		var eventData = rTarget.data('whatever')
  		var eventItem = ""	  		
  	    	
  		var modal = $(this)
  		// 지금까지 이런 이벤트는 없었다. 최대 90% 할인^2020-03-01^2020-03-31^90$3월 봄내음 나는 Big Event! 전차종 최대 55% 할인^2020-03-01^2020-03-31^55$
  		var arrEvent = eventData.split("$");  		
  		$.each(arrEvent, function(index, item){
  			if(index <arrEvent.length-1) {
  				var arrEventItem = item.split("^");
  				eventItem += "<li class='check f14'>"
  				$.each(arrEventItem, function(index, item){ 			
  						if(index == 1) {
  							eventItem += "- 기간 : " + item + " ~ "
  						}else if(index == 3) {
  							eventItem += "- 할인율 : " + item + "%"
  						}else {
  							eventItem += item + "<br>"
  						}  				
  				}); 
  				eventItem += "</li>"
  			}		
  		});
  	  	    		
  		modal.find('.modal-body ul').html(eventItem)
 
  	});
  	
  	// 이벤트 클릭시 수행
  	$('#eventInfoHome').on('show.bs.modal', function (event) {
  		var rTarget = $(event.relatedTarget)
  		var eventData = rTarget.data('whatever')	
  		var modal = $(this)
  		modal.find('.modal-body ul').text(eventData) 
  	});
  	
  	// 공지사항 클릭시 수행
  	$('#noticeInfoHome').on('show.bs.modal', function (event) {
  		var rTarget = $(event.relatedTarget)
  		var eventData = rTarget.data('whatever')	
  		var modal = $(this)
  		modal.find('.modal-body ul').text(eventData) 
  	});
  	
  	// 지점선택창에서 지점 공지사항 클릭시 수행
  	$('#noticeInfo').on('show.bs.modal', function (event) {
  		var rTarget = $(event.relatedTarget)
  		var noticeData = rTarget.data('whatever')
  		var noticeItem = ""

  		var modal = $(this)	
  		
  		var arrNotice = noticeData.split("^");
  		
  		noticeItem += "<li class='f14 fontwt-bold'>" + arrNotice[0] + "</li>"
  		noticeItem += "<li class='hg-15'><li>"
  		noticeItem += "<li class='f14'>" + arrNotice[1] + "</li>"
  		
  		modal.find('.modal-body ul').html(noticeItem)
  		
  	});
  	
  	// 차량유형 가져오는 함수 호출 (차량선택 페이지에서만 수행되도록 변경)
  	if(currentJSMenu == "차량선택") {
  		displayCarInfo();
  	}
  	
  	// 이벤트선택시 할인금액 반영
  	$('#eventDiscount').on('change', function() {
  		$("#rdoEvent").prop('checked', true);
  		setDiscountPrice($(this).val());
  	});
  	
  	// 쿠폰선택시 할인금액 반영
  	$('#couponDiscount').on('change', function() {
  		$("#rdoCoupon").prop('checked', true);
  		setDiscountPrice($(this).val());
  	});
  	
});

	
// 지점선택(라디오버튼)시 rent_branch, return_branch 변수에 값 셋팅	
function setRentBranch(target) {
	targetValue = target.value;
	targetId = $(target).attr('returnid');
	rent_branch = targetValue.split('^')[0];
	rent_branchnm = targetValue.split('^')[1];	

	if($('input[name="return_option"]').is(":checked")) {	
		$("#" + targetId).attr('checked', true);
		return_branch = targetValue.split('^')[0];
		return_branchnm = targetValue.split('^')[1];		
	}	
	
}	

function setReturnBranch(target) {	
	targetValue = target.value;
	targetId = $(target).attr('returnid');
	return_branch = targetValue.split('^')[0];
	return_branchnm = targetValue.split('^')[1];	

	if($('input[name="return_option"]').is(":checked")) {	
		$("#" + targetId).attr('checked', true);
		rent_branch = targetValue.split('^')[0];
		rent_branchnm = targetValue.split('^')[1];		
	}		
}

// 지점선택 후 확인 클릭시 수행
function setBranch() {
	if(rent_branchnm == "") {
		alert("대여지점을 선택해 주세요");
		return false;
	}else if(return_branchnm == ""){
		alert("반납지점을 선택해 주세요");
		return false;
	}else{
		$('input[name="rent_branch"]').val(rent_branchnm);
		$('input[name="return_branch"]').val(return_branchnm);
	}
}
	
// 이전/다음 클릭시 페이지 이동
function goLinkPage(pageName) {
	location.href = pageName;	
}

// 옵션선택 페이지로 이동
function goOptionPage(obj) {
	
	var carname				// 차명 
	var carimg				// 차이미지
	var carpay				// 대여금액(기본)
	var carno				// 차량등록번호(차량정보테이블 FK)
	var accidentPrice1		// 면책금(보험유형1)
	var accidentPrice2		// 면책금(보험유형2)
	var rentInsuPrice1		// 보험유형1 금액
	var rentInsuPrice2		// 보험유형2 금액
	var exemptionPrice		// 고객부담금 면제
	var option				// 기타옵션(내비게이션,베이비시트)
	
	carname = $(obj).attr('carname');
	carimg = $(obj).attr('carimg');
	carpay = $(obj).attr('carpay');
	carno = $(obj).attr('carno');
	accidentPrice1 = $(obj).attr('accidentPrice1');
	accidentPrice2 = $(obj).attr('accidentPrice2');
	rentInsuPrice1 = $(obj).attr('rentInsuPrice1');
	rentInsuPrice2 = $(obj).attr('rentInsuPrice2');
	exemptionPrice = $(obj).attr('exemptionPrice');
	option = $(obj).attr('option');
			
	if(option.indexOf("내비게이션") != -1) {
		navigation = "1"
	}else{
		navigation = "0"
	}	
	if(option.indexOf("시트") != -1) {
		babySeat = "1"
	}else{
		babySeat = "0"
	}
		
	var $newForm = $('<form></form>');	
	$newForm.attr("method", "post");
	$newForm.attr("action", "carOption.rv");
	$newForm.appendTo('body');
		
	$newForm.append($("<input/>", {type:"hidden", name:"rent_branch", value:rent_branch}));
	$newForm.append($("<input/>", {type:"hidden", name:"return_branch", value:return_branch}));
	$newForm.append($("<input/>", {type:"hidden", name:"rent_branchnm", value:rent_branchnm}));
	$newForm.append($("<input/>", {type:"hidden", name:"return_branchnm", value:return_branchnm}));
	$newForm.append($("<input/>", {type:"hidden", name:"rentDate", value:rentDate}));
	$newForm.append($("<input/>", {type:"hidden", name:"returnDate", value:returnDate}));
	$newForm.append($("<input/>", {type:"hidden", name:"carname", value:carname}));
	$newForm.append($("<input/>", {type:"hidden", name:"carimg", value:carimg}));
	$newForm.append($("<input/>", {type:"hidden", name:"carpay", value:carpay}));
	$newForm.append($("<input/>", {type:"hidden", name:"carno", value:carno}));
	
	$newForm.append($("<input/>", {type:"hidden", name:"accidentPrice1", value:accidentPrice1}));
	$newForm.append($("<input/>", {type:"hidden", name:"accidentPrice2", value:accidentPrice2}));
	$newForm.append($("<input/>", {type:"hidden", name:"rentInsuPrice1", value:rentInsuPrice1}));
	$newForm.append($("<input/>", {type:"hidden", name:"rentInsuPrice2", value:rentInsuPrice2}));
	$newForm.append($("<input/>", {type:"hidden", name:"exemptionPrice", value:exemptionPrice}));
	
	$newForm.append($("<input/>", {type:"hidden", name:"navigation", value:navigation}));
	$newForm.append($("<input/>", {type:"hidden", name:"babySeat", value:babySeat}));
	
	$newForm.append($("<input/>", {type:"hidden", name:"carType", value:carType}));
		
	$newForm.submit();
}

// 정보입력 페이지로 이동
function goInfoPage() {
	
	var optionInfo = ""		// 옵션정보(ROption):영문네비게이션,베이비시트	
	var discountCate = ""	// 할인분류(Discount_Category):쿠폰,이벤트,회원할인
	var discountNo = 3		// 할인번호(Discount_No):0-쿠폰,1-이벤트,2-회원할인
	var discountPrice = 0	// 할인금액(Discount_Price)
	var cwdTotalPrice = 0	// 보험금액(CWD_Price)
	var totalPrice = 0		// 총대여금액(Total_Price)	
	var cwdPrice = 0		// 보험 적용 금액
	var babySeatPrice = 0	// 베이비시트 금액
		
	// 네이게이션 체크여부
	if($('input[name="navigation"]').is(":checked")) {	
		optionInfo = "내비게이션";
	}	
	// 베이비시트 체크여부
	if($('input[name="babyseat"]').is(":checked")) {	
		if(optionInfo == ""){
			optionInfo += "베이비 시트";
		}else{
			optionInfo += ", 베이비 시트";
		}		
	}
		
	if($("input[id='rdoSale']").is(":checked")) {	
		discountCate = "회원 할인";
		discountNo = 2;
	}else if($("input[id='rdoEvent']").is(":checked")){
		discountCate = "이벤트 할인";
		discountNo = 1;
	}else if($("input[id='rdoCoupon']").is(":checked")){
		discountCate = "쿠폰 할인";
		discountNo = 0;
	}
		
	discountPrice = stringNumberToInt($("#discountPay").text());
	cwdTotalPrice = stringNumberToInt($("#totalOptionFeeView").text());
	totalPrice = stringNumberToInt($("#totalPay").text());
	
	cwdPrice = stringNumberToInt($("#cdwFee").text());
	babySeatPrice = stringNumberToInt($("#babySeatFee").text());
			
	var $newForm = $('<form></form>');	
	$newForm.attr("method", "post");
	$newForm.attr("action", "carInfo.rv");
	$newForm.appendTo('body');
		
	$newForm.append($("<input/>", {type:"hidden", name:"rentBrCode", value:rentBrCode}));
	$newForm.append($("<input/>", {type:"hidden", name:"returnBrCode", value:returnBrCode}));
	$newForm.append($("<input/>", {type:"hidden", name:"rentDate", value:rentDate}));
	$newForm.append($("<input/>", {type:"hidden", name:"returnDate", value:returnDate}));
	$newForm.append($("<input/>", {type:"hidden", name:"carPrice", value:carPrice}));
	$newForm.append($("<input/>", {type:"hidden", name:"carNo", value:carNo}));
	
	$newForm.append($("<input/>", {type:"hidden", name:"optionInfo", value:optionInfo}));
	$newForm.append($("<input/>", {type:"hidden", name:"discountCate", value:discountCate}));
	$newForm.append($("<input/>", {type:"hidden", name:"discountNo", value:discountNo}));
	$newForm.append($("<input/>", {type:"hidden", name:"discountPrice", value:discountPrice}));
	$newForm.append($("<input/>", {type:"hidden", name:"cwdTotalPrice", value:cwdTotalPrice}));
	$newForm.append($("<input/>", {type:"hidden", name:"totalPrice", value:totalPrice}));
	
	$newForm.append($("<input/>", {type:"hidden", name:"rentBrName", value:rentBrName}));
	$newForm.append($("<input/>", {type:"hidden", name:"returnBrName", value:returnBrName}));
	$newForm.append($("<input/>", {type:"hidden", name:"carName", value:carName}));
	$newForm.append($("<input/>", {type:"hidden", name:"carImg", value:carImg}));
	$newForm.append($("<input/>", {type:"hidden", name:"cwdPrice", value:cwdPrice}));
	$newForm.append($("<input/>", {type:"hidden", name:"babySeatPrice", value:babySeatPrice}));
	
	rdoOption =  $('input[name="rdoOption"]:checked').val();
	couponDiscount = $("select[name=couponDiscount]").val();
	eventDiscount = $("select[name=eventDiscount]").val();
	rdoCDW = $('input[name="rdoOption"]:checked').val();
	babyseat = $('input:checkbox[name="babyseat"]').is(':checked');
	navigationt = $('input:checkbox[name="navigationt"]').is(':checked');
	
	$newForm.append($("<input/>", {type:"hidden", name:"rdoOption", value:rdoOption}));
	$newForm.append($("<input/>", {type:"hidden", name:"couponDiscount", value:couponDiscount}));
	$newForm.append($("<input/>", {type:"hidden", name:"eventDiscount", value:eventDiscount}));
	$newForm.append($("<input/>", {type:"hidden", name:"rdoCDW", value:rdoCDW}));
	$newForm.append($("<input/>", {type:"hidden", name:"babyseat", value:babyseat}));
	$newForm.append($("<input/>", {type:"hidden", name:"navigation", value:navigation}));
		
	$newForm.submit();
}	

// 결제 페이지로 이동
function goPaymentPage() {
	
	// 이용약관 동의 확인	
	if($('input[name="agreeChk1"]').is(":checked") && $('input[name="agreeChk2"]').is(":checked") && $('input[name="agreeChk3"]').is(":checked")) {	
		var $newForm = $('<form></form>');	
		$newForm.attr("method", "post");
		$newForm.attr("action", "carPayment.rv");
		$newForm.appendTo('body');
			
		$newForm.append($("<input/>", {type:"hidden", name:"rentBrCode", value:rentBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnBrCode", value:returnBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"rentDate", value:rentDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnDate", value:returnDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"carPrice", value:carPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"carNo", value:carNo}));		
		$newForm.append($("<input/>", {type:"hidden", name:"optionInfo", value:optionInfo}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountCate", value:discountCate}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountNo", value:discountNo}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountPrice", value:discountPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"cwdTotalPrice", value:cwdTotalPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"totalPrice", value:totalPrice}));
		
		$newForm.append($("<input/>", {type:"hidden", name:"rentBrName", value:rentBrName}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnBrName", value:returnBrName}));
		$newForm.append($("<input/>", {type:"hidden", name:"carName", value:carName}));
		$newForm.append($("<input/>", {type:"hidden", name:"carImg", value:carImg}));
		$newForm.append($("<input/>", {type:"hidden", name:"cwdPrice", value:cwdPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"babySeatPrice", value:babySeatPrice}));
			
		$newForm.submit();
		
	}else {
		alert("약완료를 위한 이용자 동의 사항에 모두 체크하셔야 예약 가능합니다.");
		return;
	}		

}

// 결제정보테이블과 예약관리 테이블에 데이터 저장
function goInsertReservation() {
	
	// 결제 버튼 선택확인
	if($('input[name="select_pay"]').is(":checked")) {	
		var $newForm = $('<form></form>');	
		$newForm.attr("method", "post");
		$newForm.attr("action", "insertReservation.rv");
		$newForm.appendTo('body');
			
		$newForm.append($("<input/>", {type:"hidden", name:"rentBrCode", value:rentBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnBrCode", value:returnBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"rentDate", value:rentDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnDate", value:returnDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"carPrice", value:carPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"carNo", value:carNo}));		
		$newForm.append($("<input/>", {type:"hidden", name:"optionInfo", value:optionInfo}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountCate", value:discountCate}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountNo", value:discountNo}));
		$newForm.append($("<input/>", {type:"hidden", name:"discountPrice", value:discountPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"cwdTotalPrice", value:cwdTotalPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"totalPrice", value:totalPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"oilRent", value:oilRent}));
		$newForm.append($("<input/>", {type:"hidden", name:"payAmount", value:totalPrice}));
		$newForm.append($("<input/>", {type:"hidden", name:"payMethod", value:"신용카드"}));
					
		$newForm.submit();
		
	}else {
		alert("결제방법을 선택하셔야 결제진행이 가능합니다.");
		return;
	}		

}

// 지점선택시 지역선택에 따른 지점리스트 표시
function displayBranchList(areaNo) {
	$.ajax({
  		url:"reservationBrSearch.rv?areano=" + areaNo,
  		type:"get",
  		success:function(list){  
  			var rentValue = "";  	
  			var returnValue = "";
  			var eventInfo; 
  			var noticeInfo;
  			for(var i=0; i<list.length; i++) {    				
  				// 선택한 지점의 이벤트리스트가 있는 경우 이벤트 아이콘 표시	
  				eventInfo = "";
  				eventItem = "";
  				if(list[i].eventContent != "") {
  						eventInfo = "<a data-toggle='modal' href='#eventInfo' data-whatever='" + list[i].eventContent + "'>" +
  						"<img src='resources/images/btn_event.png'></a>";				
				}
  				
  				// 선택한 지점의 공지사항 표시
  				noticeInfo = ""
  				if(list[i].noticeContent != "") {
  					noticeInfo = "<a data-toggle='modal' href='#noticeInfo' data-whatever='" + list[i].noticeContent + "'>" +
  							"<img src='resources/images/btn_notice.png'></a>";		
				}
  				rentValue += "<li>" +
  					 "<input type='radio' id='lrdo-" + list[i].branchNo + "' returnid=rrdo-" + list[i].branchNo +
  					 " class='radio-branch' name='rdo-br" + 
  					 "' value='" + list[i].branchNo + "^" + list[i].branchName +
  					 "' onclick='setRentBranch(this)'>" + 
  					 " <label for='rdo-" + list[i].branchNo + "'>" +
  					 list[i].branchName + "</label>" + eventInfo + noticeInfo + 
  					 "<a data-toggle='modal' href='#branchInfo' data-backdrop='static' class='libtn btn-white'>지점안내</a>" +
  					 "</li>"
  	  			returnValue += "<li>" +
 					 "<input type='radio' id='rrdo-" + list[i].branchNo + "' returnid=lrdo-" + list[i].branchNo +
 					 " class='radio-branch' name='trdo-br" + 
 					 "' value='" + list[i].branchNo + "^" + list[i].branchName +
 					 "' onclick='setReturnBranch(this)'>" + 
 					 " <label for='trdo-" + list[i].branchNo + "'>" +
 					 list[i].branchName + "</label>" + eventInfo + noticeInfo + 
 					 "<a data-toggle='modal' href='#branchInfo' data-backdrop='static' class='libtn btn-white'>지점안내</a>" +
 					 "</li>" 					 
  			}  	  	
  				
  			$("#selRentDiv").html(rentValue);
  			$("#selReturnDiv ul").html(returnValue);
  				
  		},
  		error:function(){
  			console.log("지점리스트 가져오는 ajax 통신 오류");
  		}
	});  	
}

// 차량유형 리스트 표시
function displayCarInfo() {
	
	$.ajax({
  		url:"carInfoSearch.rv",
  		type:"get",
  		success:function(list){  
  			var listcnt = 0;
  			var carInfoValue = "<table>"
  			for(var i=0; i<list.length; i++) {  
  				style ="";
  				if (list[i].carTypeNo == carType) {
  				  style ="style='color:#007bff'";	
  				}  		
  				if(listcnt==0) {
   					carInfoValue += "<tr>"
  				}
  				carInfoValue += "<td ctype='" + 
					list[i].carTypeNo + "'cname='" + 
					list[i].carTypeName + "' rentP1='" + 
					list[i].rent1D + "' rentP2='" + 
					list[i].rent1D6D + "' rentP3='" +
					list[i].rent7DP + "' memberP='" +
					list[i].memberCar + "' onclick='setCarType(this)'" + style + ">" + 
					list[i].carTypeName + "</td>"
	  			if(listcnt==2 || i==list.length-1) {	  				
	  				carInfoValue += "</tr>"
	  				listcnt = 0
	  			}else{
	  				listcnt++
	  			}
  			}
  			carInfoValue += "<tr><td ctype='all' onclick='setCarType(this)'>전체보기</td>"
  			carInfoValue += "<td colspan='2' ctype='memberp' onclick='setCarType(this)'>알뜰카(회원전용)</td></tr>"
  			carInfoValue += "</table>" 		
  			$("#car-type-list").html(carInfoValue);
  			
  		},
  		error:function(){
  			console.log("차량유형 가져오는 ajax 통신 오류");
  		}
	});
	
}

// 선택한 차량유형값 변수에 셋팅
function setCarType(target) {	
	carType = $(target).attr('ctype');
	$("#car-type-list > table > tbody > tr > td").removeAttr("style");
	$(target).css("color", "#007bff");	
}

function serachCarList(){
		var rent_date = $('input[name="reservation_date"]').val();
  		var return_date = $('input[name="return_date"]').val();
  		if(rent_date == "대여일시" || return_date == "반납일시") {
  			alert("대여일시 및 반납일시를 선택해 주세요");
  			return;  	
  		}else if(typeof rent_branch === "undefined") {
  			alert("대여지점 및 반납지점을 선택해 주세요");
  			return;
		}else if(typeof carType == "undefined") {
  			alert("차량유형을 선택해 주세요");
  			return;
		}	
  		
  		$.ajax({
  	  		url:"searchCar.rv?carType=" + carType + "&rent_branch=" + rent_branch + "&rent_date=" + rent_date + "&return_date=" + return_date,
  	  		type:"get",
  	  		success:function(list){  
  	  			
  	  			var resultValue = "<table style='width:470px'>"
  	    		for(var i=0; i<list.length; i++) {    	    		
  	    			resultValue += "<tr>"
  	    			resultValue += "<td rowspan='3'><img width='125px' height='85px' src='" + contextJSPath + "/resources/carinfo_upfile/" + list[i].CAR_MODIFY_NAME + "'></td>"
  	    			resultValue += "</tr>"
  	    			resultValue += "<tr>"
  	    			resultValue += "<td width='70%' class='car-type'>" + list[i].CAR_TYPE_NAME + "</td>"
  	    			resultValue += "<td width='30%' class='car-price'>" + numberFormat(list[i].PRICE) + "원</td>"
  	    			resultValue += "</tr>"
  	    			resultValue += "<tr>"
  	    			resultValue += "<td colspan='2'>"
  	    			resultValue += "<span class='ico-gas'><img src='" + contextJSPath + "/resources/images/car/" + list[i].FUEL_IMG + "'></span>"
  	    			resultValue += "<div class='ico-people-wrap'>"
  	    			resultValue += "<div><img src='" + contextJSPath + "/resources/images/car/ico_people.png'></div>"
  	    			resultValue += "<div class='ico-people-text'><p class='ico-people-count'>" + list[i].CAR_RIDE_PEOPLE + "</p></div>"
  	    			resultValue += "</div>"					
  	    			resultValue += "<div class='btn-reservation' carname='" + list[i].CAR_TYPE_NAME + "' " 
  	    			resultValue += "carimg='" + list[i].CAR_MODIFY_NAME + "' "
  	    			resultValue += "carpay='" + list[i].PRICE + "' "
  	    			resultValue += "accidentPrice1='" + list[i].ACCIDENT_PRICE_TYPE1 + "' "
  	    			resultValue += "accidentPrice2='" + list[i].ACCIDENT_PRICE_TYPE2 + "' "
  	    			resultValue += "rentInsuPrice1='" + list[i].RENT_INSU_TYPE1 + "' "
  	    			resultValue += "rentInsuPrice2='" + list[i].RENT_INSU_TYPE2 + "' "
  	    			resultValue += "exemptionPric='" + list[i].ACCIDENT_EXEMPTION + "' "
  	    			resultValue += "option='" + list[i].CAR_OPTION + "' "
  	    			resultValue += "carno='" + list[i].CAR_NO + "' onclick='goOptionPage(this);'>예약</div>"				
  	    			resultValue += "</td>"				
  	    			resultValue += "</tr>"
  	    			resultValue += "<tr>"
  	    			resultValue += "<td colspan='3'><p style='border-bottom: 1px solid #757272; margin-top:10px; margin-bottom:5px;'></p></td>"
  	    			resultValue += "</tr>"
  	    		}
  	  			resultValue += "</table>";

  	  			$("#searchcnt").html("결과<span>(" + list.length + ")</span>");
  	  			$(".list-car").html(resultValue);
  	  			$('#car-info-right').css("display", "none");   
  	  			$('#car-search-result').css("display", "block");    	  		  	  		
  	  		},
  	  		error:function(){
  	  			console.log("차량유형 가져오는 ajax 통신 오류");
  	  		}
  		});
}

// 천 단위마다 컴마 찍기
function numberFormat(inputNumber) {
	return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//컴마제거 후 리턴
function stringNumberToInt(stringNumber){
	if(typeof(stringNumber) == "string") {
		if(stringNumber.indexOf(",") != -1) {
			return parseInt(stringNumber.replace(/,/g , ''));
		}else {
			return parseInt(stringNumber);
		}
	}else {
		return stringNumber
	}
}

//할인항목 선택시 할인금액정보 변경
function setDiscountPrice(discountRate) {	
	rentalPay = parseInt($("#rentalFee").attr("price"));
	discountPay = rentalPay * (discountRate/100);	
	$("#discountPay").text(numberFormat(discountPay));
	setTotalPrice();	
}

// 보험금 선택시 금액정보 변경
function setCDWPrice(cdwPay) {	
	$("#cdwFee").text(numberFormat(cdwPay));
	setTotalPrice();	
} 

// 베이이시트 선택시 금액정보 변경
function setBaybyPrice(obj) {
	if(obj.checked){
		$("#babySeatFee").text(numberFormat(obj.value));
		setTotalPrice();	
	}else{
		$("#babySeatFee").text("0");
		setTotalPrice();	
	}
}

// 총금액정보 변경
function setTotalPrice() {
	rentalPay = parseInt($("#rentalFee").attr("price"));		// 	대여금액
	discountPay = stringNumberToInt($("#discountPay").text());	// 	할인금액(-)	
	otherPay = stringNumberToInt($("#cdwFee").text()) + stringNumberToInt($("#babySeatFee").text());	//	보험및기타금액(+)
	$("#totalOptionFeeView").text(numberFormat(otherPay));
	$("#totalPay").text(numberFormat(rentalPay + otherPay - discountPay));
}

// 차량조회화면으로 이동
function goCarSerch(){

	if(confirm("이전페이지로 이동하면 현재 페이지에서 선택된 값은 모두 사라집니다.\n이동하시겠습니까?")) {
		var $newForm = $('<form></form>');	
		$newForm.attr("method", "post");
		$newForm.attr("action", "reservationPre.rv");
		$newForm.appendTo('body');
		
		$newForm.append($("<input/>", {type:"hidden", name:"rent_branch", value:rentBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"return_branch", value:returnBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"rent_branchnm", value:rentBrName}));
		$newForm.append($("<input/>", {type:"hidden", name:"return_branchnm", value:returnBrName}));
		$newForm.append($("<input/>", {type:"hidden", name:"rentDate", value:rentDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnDate", value:returnDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"carno", value:carNo}));  
		$newForm.append($("<input/>", {type:"hidden", name:"carType", value:carType}));
			
		$newForm.submit();	
	}
}

function goCarOption() {
	
	if(confirm("이전페이지로 이동하면 현재 페이지에서 선택된 값은 모두 사라집니다.\n이동하시겠습니까?")) {
		var $newForm = $('<form></form>');	
		$newForm.attr("method", "post");
		$newForm.attr("action", "carOptionPre.rv");
		$newForm.appendTo('body');
		
		$newForm.append($("<input/>", {type:"hidden", name:"rent_branch", value:rentBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"return_branch", value:returnBrCode}));
		$newForm.append($("<input/>", {type:"hidden", name:"rentDate", value:rentDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"returnDate", value:returnDate}));
		$newForm.append($("<input/>", {type:"hidden", name:"carpay", value:carNo}))
		$newForm.append($("<input/>", {type:"hidden", name:"carno", value:carNo})); 
		
		$newForm.append($("<input/>", {type:"hidden", name:"rent_branchnm", value:rentBrName}));
		$newForm.append($("<input/>", {type:"hidden", name:"return_branchnm", value:returnBrName}));
		$newForm.append($("<input/>", {type:"hidden", name:"carname", value:returnBrName}));
		$newForm.append($("<input/>", {type:"hidden", name:"carimg", value:returnBrName}));		 
		$newForm.append($("<input/>", {type:"hidden", name:"carType", value:carType}));
			
		$newForm.submit();	
	}
	
	
}





