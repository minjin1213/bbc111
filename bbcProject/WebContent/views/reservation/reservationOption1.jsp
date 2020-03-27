<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<%@ page import="java.text.DecimalFormat" %>    
<% 
	int rent_branch = (int)request.getAttribute("rent_branch");
	int return_branch = (int)request.getAttribute("return_branch");
	String rent_branchnm = (String)request.getAttribute("rent_branchnm");
	String return_branchnm = (String)request.getAttribute("return_branchnm");
	String rentDate = (String)(request.getAttribute("rentDate"));
	String returnDate = (String)(request.getAttribute("returnDate"));
	String carname = (String)request.getAttribute("carname");
	String carimg = (String)request.getAttribute("carimg");
	int carpay = (int)request.getAttribute("carpay");
	int carno = (int)request.getAttribute("carno");
	DecimalFormat df = new DecimalFormat("#,###");
	String strCarpay = df.format(carpay);
%> 
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
					<span id="rentInfo"><strong><%=rent_branchnm%></strong><strong><%=rentDate%></strong></span>
						<em class="ico-to">to</em>
					<span id="returnInfo"><strong><%=return_branchnm%></strong><strong><%=returnDate%></strong></span>
				</div>
				<div id="carInfo" class="box-car"><%=carname%>
					<div class="img-car"><img src="<%=contextPath%>/resources/carinfo_upfile/<%=carimg%>"></div>
				</div>
				<p class="f10 txt-gray1 txt-center pb25">실제 대여하는 차량과 외관, 색상, 옵션 등 차이가 있을 수 있으며<br>사고 또는 고장 등 부득이한 경우 동급차종으로 변경될 수 있습니다.</p>
			</div>	
			<div class="box-price">
				<ul>
					<!-- 대여금액 -->
                	<li>
	                	<span class="tit">대여금액</span><span class="price" id="rentalFee" price="<%=carpay%>"><strong><%=strCarpay%></strong><em>원</em></span>
                    </li>
					<!-- 할인금액 -->
                    <li>
	                	<span class="tit">할인금액</span><span class="price" id="totalDiscountFeeView"><strong id="discountPay">0</strong><em>원</em></span>
						<ul class="detail">
							<li>
								<span id="eventShow"></span><span class="price"></span>
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
                    	<span class="tit">금액</span><span class="price" id="totalRentalFeeView"><strong id="totalPay"><%=strCarpay%></strong><em>원</em></span>
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
			<label class="option-right-hr f15">이벤트/할인</label>			
			<ul class="radio-vt f14">
				<li>
	            	<input type="radio" id="rdoSale" name="rdoOption" value="35" onclick="setDiscountPrice(this.value)">
	                <label for="rdoSale">회원 할인 <span id="m_sale_percent">(35%)</span></label>
	            </li>
	            <li>
	            	<input type="radio" id="rdoEvent" name="rdoOption">
	                <label for="rdoEvent">이벤트</label>
	                <select name="eventDiscount" id="eventDiscount" style="margin-left: 80px;">	
		    			<option value="0">선택</option>
		    			<option value="50">[서울전지점]3월 안전하고 건강한여행(50% 할인)</option>
		    			<option value="20">[서울전지점]5월 안전하고 건강한여행(20% 할인)</option>
					</select>
	             </li>
	             <li>
	             	<input type="radio" id="rdoCoupon" name="rdoOption">
	                <label for="rdoCoupon">쿠폰</label>
	                <select name="couponDiscount" id="couponDiscount" style="margin-left: 95px">
		    			<option value="0">선택</option>
		    			<option value="60">신규회원 가입 감사 쿠폰(60% 할인)</option>
		    			<option value="40">첫 예약 할인 쿠폰(40% 할인)</option>
					</select>
                 </li>
			</ul>
			<span class="ds-block pt5 pl12 pb5 f12 txt-red1">* 할인은 회원 할인, 이벤트 할인, 쿠폰 할인 중 하나만 적용 가능합니다.</span> 
			<p class="hg-40"></p>
			<label class="option-right-hr f15">자차손해 면책 제도 (CDW)
			<span class="ml5"><a data-toggle="modal" href="#cdwInfo" data-backdrop="static" class="btn-tooltip"></a></span>
			</label>			
			<ul class="f14">
				<li>
					<input type="radio" id="rdoNoCDW1" name="rdoCDW" onclick="">
					<label for="rdoNoCDW1">보험 미적용 (0원)</label>
				</li>
				<li>
					<input type="radio" id="rdoCDW2" name="rdoCDW" onclick="">
					<label for="rdoCDW2">고객부담금 면제&nbsp;(20,000원)</label>
				</li>
				<li>
					<input type="radio" id="rdoCDW3" name="rdoCDW" onclick="">
					<label for="rdoCDW3">사고시 면책금 5만원&nbsp;(12,000원)</label>
				</li>
				<li>
					<input type="radio" id="rdoCDW4" name="rdoCDW" onclick="">
					<label for="rdoCDW4">사고시 면책금 30만원&nbsp;(10,000원)</label>
				</li>
			</ul>
			<p class="hg-40"></p>
			<label class="option-right-hr f15">기타 옵션</label>
			<span class="f14">내비게이션(무료)</span>
			<span class="ml5"><a data-toggle="modal" href="#naviInfo" data-backdrop="static" class="btn-tooltip"></a></span>
			<span class="ml10 mt5 ds-block f14">
				<input type="checkbox" name="navigation" id="navigation" style="vertical-align:-2px;">
				<label for="navigation" class="txt-gray2 fontwt-normal pl5">영문 내비게이션</label>
			</span>	        	
			<span class="f14">베이비 시트(1회 2,000원 추가)</span>
			<span class="ml5"><a data-toggle="modal" href="#babyseatInfo" data-backdrop="static" class="btn-tooltip"></a></span>
			<span class="ml10 mt5 ds-block f14">
				<input type="checkbox" name="babyseat" id="babyseat" style="vertical-align:-2px;">
				<label for="babyseat" class="txt-gray2 fontwt-normal pl5">베이비 시트</label>
			</span>
			<p class="hg-50"></p>
			<div class="optionBtn">
				<button class="btn-default-cancel btn-prev" onclick="goLinkPage('<%=contextPath%>/carSearch.rv');">이전</button>
				<button class="btn-default-ok btn-next" onclick="goLinkPage('<%=contextPath%>/carInfo.rv');">다음</button>
			</div>
		</div>
		<!-- /div car-info-right -->
		</td>
		</tr>
		</table>
	</div>
	
	 <!-- 자차손해 면책 제도 안내 모달창 -->
    <div class="modal fade" id="cdwInfo" role="dialog" aria-hidden="true">
    	<div class="modal-dialog modal-lg">
      		<div class="modal-content">
      			<div class="modal-header">
      				<span class="main-title">자차손해 면책 제도 안내</span>
          			<button type="button" class="close" data-dismiss="modal">×</button>          			
        		</div>
        		<div class="modal-body">     
        			<label class="option-right-hr">자차손해 면책 제도(CDW)</label>  
					<ul class="txt-list mb30">
                		<li class="check f14">차량 대여 중 귀책사유로 인해 발생하는 모든 차량 손해(손, 망실)는 고객님의 책임 입니다.</li>
                		<li class="check f14">단, 자차손해 면책제도(CDW)에 가입하시면 고객의 실수로 발생한 자차사고에 대한 보호를 받으실 수가 있으며,
						가입은 고객님의 선택 사항입니다.</li>
               			<li class="check f14">대인 : 무한, 대물 : 2천만원, 자손 :1천 5백만원</li>
            		</ul>	
					<label class="option-right-hr">내용</label>
					<ul class="txt-list mb30">
                		<li class="check f14">차량손해의 액수에 상관없이 사고건당 5만원~30만원으로 차량 손해에 대한 책임을 보호받을 수 있습니다. 
                    	<br>단, 차량손해 면책제도의 면책금 가입종류에 따라 가입 요금이 다릅니다.
                		</li>
                		<li class="check f14">면책금 종류
                    		<ul class="txt-list mt5">
                        		<li class="f14">- 국산차량 : 고객부담금면제, 5만원, 30만원 </li>
                        		<li class="f14">- 수입차량 : 30만원(단일 면책금 제도 운영)</li>
                    		</ul>
                		</li>
            		</ul>		
					<label class="option-right-hr">차량 수리비</label>
					<ul class="txt-list">
                		<li class="check f14">차량 대여 중 귀책사유로 인해 발생하는 모든 차량 손해(손, 망실)는 
                		고객님께서 차량 수리비를 지불하셔야 합니다.</li>
                		<li class="check f14">휴차 보상 : CDW 가입유무와 관계 없이 잔존가 대비 50% 이상 파손이 발생 할 경우 수리기간 동안 
                		영업 손해에 따른 비용(수리기간 동안 대여 차량 정상요금의 50%)을 부담 하셔야 합니다.</li>
                		<li class="check f14">단, 차량손해 면책 제도에 가입하시면 자차 사고에 대한 보호를 받으실 수 있습니다. 
                		차량 수리비가 면책금 가입 종류에 따라 가입된 면책금 미만인 경우 실비 정산을 하며, 
                		가입된 면책금 이상인 경우 각각 가입하신 최고 면책금만 지불하시면 됩니다.
                		</li>
            		</ul>
        		</div>
      		</div>
    	</div>
  	</div>
  	
  	<!-- 네이게이션 안내 모달창 -->
  	<div class="modal fade" id="naviInfo" role="dialog" aria-hidden="true">
    	<div class="modal-dialog">
      		<div class="modal-content">
      			<div class="modal-header">
      				<span class="main-title">내비게이션 대여 서비스 안내</span>
          			<button type="button" class="close" data-dismiss="modal">×</button>          			
        		</div>
        		<div class="modal-body">     
        			<label class="option-right-hr">내비게이션</label>  
        			<ul class="txt-list">
                		<li class="check f14">고객님의 이용 편의를 위하여 내비게이션을 무료로 제공해 드리고 있습니다.</li>
                		<li class="check f14">내비게이션을 이용하면 지도를 준비하지 않으셔도 찾아가는 목적지를
                		최단거리로 표시하면서 연료비 절감 및 시간 활용이 용이 합니다.</li>
            		</ul>        	
        		</div>
      		</div>
    	</div>
  	</div>
  	
  	<!-- 베이비 시트 안내 모달창 -->
  	<div class="modal fade" id="babyseatInfo" role="dialog" aria-hidden="true">
    	<div class="modal-dialog">
      		<div class="modal-content">
      			<div class="modal-header">
      				<span class="main-title">베이비 시트 안내</span>
          			<button type="button" class="close" data-dismiss="modal">×</button>          			
        		</div>
        		<div class="modal-body">     
        			<label class="option-right-hr">베이비 시트</label>  
        			<ul class="txt-list">
                		<li class="check f14">대여기간에 상관없이 예약 1회에 1개만 신청이 가능하며 금액은 2천원입니다. (대여 기간에 따른 추가금액 없음)</li>
                		<li class="check f14">대여하는 차량의 종류에 따라 베이비시트 설치가 어려울 수 있습니다.</li>
                		<li class="check f14">예약하는 일정 및 지점에 베이비시트가 없는 경우 대여가 불가합니다. (옵션의 선택 불가)</li>
            		</ul>        	
        		</div>
      		</div>
    	</div>
  	</div>

	<script type="text/javascript" src="<%=contextPath%>/resources/js/reservation/reservation.js"></script>  	
  	
</body>	
</html>