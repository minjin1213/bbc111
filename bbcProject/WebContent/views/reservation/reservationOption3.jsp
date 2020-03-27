<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량예약</title>
<link href="<%= request.getContextPath() %>/resources/css/reservation/reservation.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>
	<!-- div outer -->
	<div class="outer">	
		<div class="main-title">차량예약</div>
		<hr class="garo">
		<table>
		<tr>
		<!-- div car-info-left -->
		<td valign="top">
		<div class="option-left">	
			<div class="option-left-top">	
				<div class="box-schd">
					<span id="rentInfo"><strong>강남</strong><strong>2020-03-07 10시 00분</strong></span>
						<em class="ico-to">to</em>
					<span id="returnInfo"><strong>강남</strong><strong>2020-03-08 10시 00분</strong></span>
				</div>
				<div id="carInfo" class="box-car">아반떼 AD (D) F/L
					<div class="img-car"><img src="<%=contextPath%>/resources/images/car/newavante.png"></div>
				</div>
				<p class="f10 txt-gray1 txt-center pb25">실제 대여하는 차량과 외관, 색상, 옵션 등 차이가 있을 수 있으며<br>사고 또는 고장 등 부득이한 경우 동급차종으로 변경될 수 있습니다.</p>
			</div>	
			<div class="box-price">
				<ul>
					<!-- 대여금액 -->
                	<li>
	                	<span class="tit">대여금액</span><span class="price" id="rentalFee"><strong>110,000</strong><em>원</em></span>
                    </li>
					<!-- 할인금액 -->
                    <li>
	                	<span class="tit">할인금액</span><span class="price" id="totalDiscountFeeView"><strong>-55,000</strong><em>원</em></span>
						<ul class="detail">
							<li>
								<span id="eventShow">[서울전지점]3월 안전하고 건강한여행(50% 할인)</span><span class="price"></span>
							</li>
						</ul>
                     </li>
					<!-- 보험및기타옵션 -->
					<li>
	                	<span class="tit">보험 및 기타 옵션</span><span class="price" id="totalOptionFeeView"><strong>0</strong><em>원</em></span>
						<ul class="detail">
							<li>
								<span class="tit" id="cdwNameShow">보험 미적용</span><span class="price" id="cdwFee">0원</span>
							</li>	
							<li>
								<span class="tit" id="babySeatShow">베이비 시트</span><span class="price" id="babySeatFee">0원</span>
							</li>					
						</ul>
                     </li>
					<!-- 금액 -->
                    <li class="total">
                    	<span class="tit">금액</span><span class="price" id="totalRentalFeeView"><strong>55,000</strong><em>원</em></span>
                    </li>
                </ul>
			</div>
		</div>
		<!-- /div car-info-left -->	
		<br><br>
		</td>		
		<td valign="top">
		<!-- div car-info-right -->
		<div class="option-right">
			<div class="pay-info">
  				<div class="txt_pay_discount">
					<span class="txt1">
						<span class="txt2">결제까지 모두 완료해야 예약이 완료됩니다.</span>
					</span>
					<p class="txt3">결제 전 최종 예약내역을 확인 후 결제를 진행하세요.</p>
				</div>			
				<p class="hg-40"></p>
				<label class="option-right-hr f15">취소 수수료 안내</label>
				<ul class="txt-list">
					<li class="black f14">해당 예약은 대여시간 24시간 전 
					<span class="txt-point">(2020년 03월 26일 (목) 10:00)</span>까지 수수료 없이 취소 가능하며, 이후 취소하는 경우 수수료가 발생합니다.<br>
			    	</li>
					<li class="black f14">대여지점과 사전 협의 없이 대여시간까지 지점을 방문하지 않는 경우 해당 예약은 취소되며, 노쇼(NO SHOW) 수수료가 발생합니다.</li>			
				</ul>	
				<p class="hg-10"></p>
				<div class="pbox">
					<ul class="txt-list">
						<li class="f14 pt5 pl5 pb5">차량 수령 24시간 전 취소 : 전액 환불 (수수료 없음)</li>
						<li class="f14 pl5 pb5">차량 수령 24시간 이내 ~ 수령시간까지 취소 : 취소수수료 발생 (3,000원)</li>
						<li class="f14 pl5 pb5">차량 수령시간 이후 : NO SHOW 수수료 발생 (차량대여요금의 10% )</li>
					</ul>
				</div>		
				<p class="hg-40"></p>
				<label class="option-right-hr f15">카드 결제</label>
				<ul>
					<li>	
						<div class="ds-inlineblock valign"><input type="radio" name="select_pay" id="select_pay1" value="A"></div>					
						<div class="cardarea"></div>
               		</li>
            	</ul> 
            	
            	<p class="hg-10"></p>
				<div class="pbox">
					<ul class="txt-list txt-center">
						<li class="f14 pt20 pb20">결제 버튼을 누르시면 결재화면으로 이동합니다.</li>
					</ul>
				</div>
				<p class="hg-40"></p>
				<div class="optionBtn">			
					<button class="btn-default-cancel btn-prev" onclick="goLinkPage('<%=contextPath%>/carInfo.rv');">이전</button>
					<button class="btn-default-ok btn-next" onclick="">결제</button>
				</div> 				        
			</div>	
		</div>		
		<!-- /div car-info-right -->
		</td>
		</tr>
		</table>
	</div>
	
	<script type="text/javascript" src="<%=contextPath%>/resources/js/reservation/reservation.js"></script>  
	
</body>	
</html>