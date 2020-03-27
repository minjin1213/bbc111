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
					<div class="img-car"><img src="../../resources/images/car/newavante.png"></div>
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
			<label class="option-right-hr">개인 정보</label>			
			<div class="grid mt10">
            	<table class="tb-noBorder">
                	<colgroup>
                      	<col style="width:110px">
                      	<col style="width:auto">
                    </colgroup>
                    <tbody>
                    	<tr>
                        	<th>회원등급</th>
                        	<td>
                        	<input type="text" id="memberGrade" name="memberGrade" value="일반회원" readonly>
                        	</td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
							<input type="text" id="userName" name="userName" title="이름" placeholder="이름을 입력하세요." value="홍길동" readonly>
							</td>
						</tr>
						<tr>
                        	<th>이메일</th>
                            <td>
								<input type="text" name="userEmail" id="userEmail" maxlength="80" value="khhong@naver.com" title="이메일" placeholder="이메일을 입력하세요.">
							</td>
						</tr>
                        <tr>
                           <th>휴대전화</th>
                           <td>
								<input  type="text" name="phone1" id="phone1" title="휴대폰 첫번째 숫자" style="width:76px;" value="" maxlength="4" onkeydown="" onkeypress="" onkeyup="">
                                <span class="hyphen"> - </span>
                                <input  type="text" name="phone2" id="phone2" title="휴대폰 가운데 숫자" style="width:100px;" value="" maxlength="4" onkeydown="" onkeypress="" onkeyup="">
                                <span class="hyphen"> - </span>
                                <input  type="text" name="phone3" id="phone3" title="휴대폰 마지막 숫자" style="width:100px;" value="" maxlength="4" onkeydown="" onkeypress="" onkeyup="">
                           </td>
                        </tr>
                   </tbody>
				</table>
			</div>			
			<p class="hg-40"></p>
			<label class="option-right-hr">운전면허 정보</label>			
			<div class="grid mt10">
            	<table class="tb-noBorder">
                	<colgroup>
                      	<col style="width:110px">
                      	<col style="width:auto">
                    </colgroup>
                    <tbody>
                    	<tr>
                        	<th>면허 구분</th>
                        	<td>
                        	<select name="licenseNo">	
		    					<option value="국내">국내</option>
		    					<option value="국제">국제</option>
							</select>
                        	</td>
                        </tr>
                        <tr>
                            <th class="pt10">면허 종류</th>
                            <td>
							<select name="licenseKind" class="mt10">	
		    					<option value="">선택</option>
		    					<option value="1종대형">1종대형</option>
		    					<option value="1종보통">1종보통</option>
		    					<option value="2종보통">2종보통</option>
		    					<option value="2종오토">2종오토</option>
							</select>
						</tr>
                        <tr>
                           <th>면허증 번호</th>
                           <td>               
                           		<select name="licenseNo1" class="mt10" style="width: 90px;">	
                           			<option value="">선택</option>
		    						<option value="대구">대구</option>
		    						<option value="인천">인천</option>
		    						<option value="광주">광주</option>
		    						<option value="대전">대전</option>
		    						<option value="울산">울산</option>
		    					</select>		
                                <span class="hyphen"> - </span>
                                <input  type="text" name="licenseNo2" title="면허증번호 두번째 숫자" style="width:60px; margin-bottom: 5px;" value="" maxlength="2" onkeydown="" onkeypress="" onkeyup="">
                                <span class="hyphen"> - </span>
                                <input  type="text" name="licenseNo3" title="면허증번호 세번째 숫자" style="width:90px; margin-bottom: 5px;" value="" maxlength="6" onkeydown="" onkeypress="" onkeyup="">
                           		<span class="hyphen"> - </span>
                                <input  type="text" name="licenseNo4" title="면허증번호 마지막 숫자" style="width:60px; margin-bottom: 5px;" value="" maxlength="2" onkeydown="" onkeypress="" onkeyup="">
                           </td>
                        </tr>
                   </tbody>
				</table>
			</div>	
			<p class="hg-40"></p>
			<label class="option-right-hr">기타 옵션</label>
			내비게이션(무료) 
			<span class="ml5"><a data-toggle="modal" href="#naviInfo" data-backdrop="static" class="btn-tooltip"></a></span>
			<span class="ml10 mt5 ds-block">
				<input type="checkbox" name="navigation" id="navigation" style="vertical-align:-2px;">
				<label for="navigation" class="txt-gray2 fontwt-normal pl5">영문 내비게이션</label>
			</span>	        	
			베이비 시트(1회 2,000원 추가) 
			<span class="ml5"><a data-toggle="modal" href="#babyseatInfo" data-backdrop="static" class="btn-tooltip"></a></span>
			<span class="ml10 mt5 ds-block">
				<input type="checkbox" name="babyseat" id="babyseat" style="vertical-align:-2px;">
				<label for="babyseat" class="txt-gray2 fontwt-normal pl5">베이비 시트</label>
			</span>
			<p class="hg-50"></p>
			<div class="optionBtn">
				<button class="btn-default-cancel btn-prev" id="OptionPrev">이전</button>
				<button class="btn-default-ok btn-next" id="OptionNext">다음</button>
			</div>
		</div>
		<!-- /div car-info-right -->
		</td>
		</tr>
		</table>
	</div>
	
</body>	
</html>