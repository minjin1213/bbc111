<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.util.HashMap, java.text.DecimalFormat" %>    
<% 	
	HashMap<String, String> carInfo = (HashMap<String, String>)request.getAttribute("carInfo");	
	int rentBrCode = Integer.parseInt(carInfo.get("rentBrCode"));
	int returnBrCode = Integer.parseInt(carInfo.get("returnBrCode"));
	String rentDate = carInfo.get("rentDate");
	String returnDate = carInfo.get("returnDate");
	int carPrice = Integer.parseInt(carInfo.get("carPrice"));
	int carNo = Integer.parseInt(carInfo.get("carNo"));
	String optionInfo = carInfo.get("optionInfo");
	String discountCate = carInfo.get("discountCate");
	int discountNo = Integer.parseInt(carInfo.get("discountNo"));
	int discountPrice = Integer.parseInt(carInfo.get("discountPrice"));
	int cwdTotalPrice = Integer.parseInt(carInfo.get("cwdTotalPrice"));
	int totalPrice = Integer.parseInt(carInfo.get("totalPrice"));
	
	String rentBrName = carInfo.get("rentBrName");
	String returnBrName = carInfo.get("returnBrName");
	String carName = carInfo.get("carName");
	String carImg = carInfo.get("carImg");
	int cwdPrice = Integer.parseInt(carInfo.get("cwdPrice"));
	int babySeatPrice = Integer.parseInt(carInfo.get("babySeatPrice"));
	
	String licenseType = carInfo.get("licenseType");
	String licenseNumber1 = carInfo.get("licenseNumber1");
	String licenseNumber2 = carInfo.get("licenseNumber2");
	String licenseNo = carInfo.get("licenseNo");
	String licenseIssueDate = carInfo.get("licenseIssueDate");
	String licenseReturnDate = carInfo.get("licenseReturnDate");
		
	DecimalFormat df = new DecimalFormat("#,###");
	String strCarPrice = df.format(carPrice);
	String strDiscountPrice = df.format(discountPrice);
	String strCWDTotalPrice = df.format(cwdTotalPrice);
	String strTotalPrice = df.format(totalPrice);
	String strCWDPrice = df.format(cwdPrice);
	String strBabySeatPrice = df.format(babySeatPrice);
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보입력</title>
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
					<span id="rentInfo"><strong id="rentBr"><%=rentBrName%></strong><strong id="rentDt"><%=rentDate%></strong></span>
						<em class="ico-to">to</em>
					<span id="returnInfo"><strong id="returnBr"><%=returnBrName%></strong><strong id="returnDt"><%=returnDate%></strong></span>
				</div>
				<div id="carInfo" class="box-car"><%=carName%>
					<div class="img-car"><img src="<%=contextPath%>/resources/carinfo_upfile/<%=carImg%>"></div>
				</div>
				<p class="f10 txt-gray1 txt-center pb25">실제 대여하는 차량과 외관, 색상, 옵션 등 차이가 있을 수 있으며<br>사고 또는 고장 등 부득이한 경우 동급차종으로 변경될 수 있습니다.</p>
			</div>	
			<div class="box-price">
				<ul>
					<!-- 대여금액 -->
                	<li>
	                	<span class="tit">대여금액</span><span class="price" id="rentalFee" price="<%=carPrice%>"><strong><%=strCarPrice%></strong><em>원</em></span>
                    </li>
					<!-- 할인금액 -->
                    <li>
	                	<span class="tit">할인금액</span><span class="price"><strong>-</strong><strong id="discountPay"><%=strDiscountPrice%></strong><em>원</em></span>
						<ul class="detail">
							<li>
								<span id="eventShow"></span><span class="price"></span>
							</li>
						</ul>
                     </li>
					<!-- 보험및기타옵션 -->
					<li>
	                	<span class="tit">보험 및 기타 옵션</span><span class="price"><strong id="strCWDTotalPrice"><%=strCWDTotalPrice%></strong><em>원</em></span>
						<ul class="detail">
							<li>
								<span class="tit" id="cdwNameShow">보험 미적용</span><span class="price"><strong id="cdwFee"><%=strCWDPrice%></strong>원</span>
							</li>	
							<li>
								<span class="tit" id="babySeatShow">베이비 시트</span><span class="price"><strong id="babySeatFee"><%=strBabySeatPrice%></strong>원</span>
							</li>					
						</ul>
                     </li>
					<!-- 금액 -->
                    <li class="total">
                    	<span class="tit">금액</span><span class="price" id="totalRentalFeeView"><strong id="totalPay"><%=strTotalPrice%></strong><em>원</em></span>
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
			<label class="option-right-hr f15">개인 정보</label>			
			<div class="grid mt10">
            	<table class="tb-noBorder">
                	<colgroup>
                      	<col style="width:110px">
                      	<col style="width:auto">
                    </colgroup>
                    <tbody>
                    <% if(loginUser == null) { %>
                    	<tr>
                        	<th>회원등급</th>
                        	<td>
                        	<input type="text" id="memberGrade" name="memberGrade" value="비회원" readonly>
                        	</td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
							<input type="text" id="userName" name="userName" title="이름" placeholder="이름을 입력하세요.">
							</td>
						</tr>
						<tr>
                            <th>법정생년월일</th>
                            <td>
							<input type="text" id="userBirth" name="userBirth" title="법정생년월일" placeholder="8자리로입력하세요(ex. 19880101)">
							</td>
						</tr>
						<tr>
                            <th>성별</th>
                            <td>
							<input type="radio" name="gender" value="M" style="position: inherit; width: 17px; height: 17px; opacity:1;">&nbsp;남&nbsp;&nbsp;&nbsp;
							<input type="radio" name="gender" value="F" style="position: inherit; width: 17px; height: 17px; opacity:1;">&nbsp;여
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
                   <% } else { %>
                   		                    	<tr>
                        	<th>회원등급</th>
                        	<td>
                        	<input type="text" id="memberGrade" name="memberGrade" value="일반회원" readonly>
                        	</td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
							<input type="text" id="userName" name="userName" title="이름" value="<%=loginUser.getMemberName()%>" readonly>
							</td>
						</tr>
						<tr>
                        	<th>이메일</th>
                            <td>
								<input type="text" name="userEmail" id="userEmail" maxlength="80" value="<%=loginUser.getMemberEmail()%>" title="이메일" readonly>
							</td>
						</tr>
                        <tr>
                           <th>휴대전화</th>
                           <td>
								<input  type="text" name="phone1" id="phone1" style="width:76px;" value="<%=loginUser.getPhone().substring(0, 3)%>" readonly>
                                <span class="hyphen"> - </span>
                                <input  type="text" name="phone2" id="phone2" style="width:100px;" value="<%=loginUser.getPhone().substring(4, 8)%>" readonly>
                                <span class="hyphen"> - </span>
                                <input  type="text" name="phone3" id="phone3" style="width:100px;" value="<%=loginUser.getPhone().substring(9, 13)%>" readonly>
                           </td>
                        </tr>
                   <% } %>     
                   </tbody>
				</table>
			</div>			
			<p class="hg-30"></p>
			<label class="option-right-hr f15">운전면허 정보</label>			
			<div class="grid mt10">
            	<table class="tb-noBorder">
                	<colgroup>
                      	<col style="width:110px">
                      	<col style="width:auto">
                    </colgroup>
                    <tbody>
                    <% if(licenseType != "") { %>
                        <tr>
                            <th>면허 종류</th>
                            <td> 
                            <input  type="text" name="licenseKind" style="width:70px;" value="<%=licenseType%>" readonly>
							</td>
						</tr>
						<tr>
                        	<th>면허증 번호</th>
                        	<td>       
                        	 <input  type="text" name="licenseNo1" style="width:60px;" value="<%=licenseNumber1%>" readonly>
                           	<span class="hyphen"> - </span>
                            <input  type="text" name="licenseNo2" style="width:60px;" value="<%=licenseNumber2.substring(0, 2)%>" readonly>
                            <span class="hyphen"> - </span>
                            <input  type="text" name="licenseNo3" style="width:90px;" value="<%=licenseNumber2.substring(2, 8)%>" readonly>
                           	<span class="hyphen"> - </span>
                            <input  type="text" name="licenseNo4" style="width:60px;" value="<%=licenseNumber2.substring(8, 10)%>" readonly>
                           </td>
						</tr>
						<tr>
                        	<th>발급일</th>
								<td>
									<div class="licenseDateY"> 
									<input name="licenseAcqYYYY" style="width:90px;" value="<%=licenseIssueDate.substring(0, 4)%>" readonly>
									<span>년</span>	
									</div>	
									<div class="licenseDateM">							
                                	<input name="licenseAcqMM" style="width:60px;" value="<%=licenseIssueDate.substring(5, 7)%>" readonly>
                                	<span>월</span> 
                                	 </div>	
									<div class="licenseDateD">	                           	
                                	<input name="licenseAcqDD" style="width:60px;" value="<%=licenseIssueDate.substring(8, 10)%>" readonly>
                                	<span>일</span>
                                	</div>
								</td>
						</tr>
						<tr>
                        	<th>만료일</th>
								<td>
									<div class="licenseDateY">
									<input name="licenseAcqYYYY" style="width:90px;" value="<%=licenseReturnDate.substring(0, 4)%>" readonly>
									<span>년</span>	
									</div>	
									<div class="licenseDateM">							
                                	<input name="licenseAcqMM" style="width:60px;" value="<%=licenseReturnDate.substring(5, 7)%>" readonly>
                                	<span>월</span> 
                                	 </div>	
									<div class="licenseDateD">	                           	
                                	<input name="licenseAcqDD" style="width:60px;" value="<%=licenseReturnDate.substring(8, 10)%>" readonly>
                                	<span>일</span>
                                	</div>
								</td>
						</tr>
					<% } else { %>
					     <tr>
                            <th>면허 종류</th>
                            <td>
							<select name="licenseKind">	
		    					<option value="">선택</option>
		    					<option value="1종대형">1종대형</option>
		    					<option value="1종보통">1종보통</option>
		    					<option value="2종보통">2종보통</option>
		    					<option value="2종오토">2종오토</option>
							</select>
							</td>
						</tr>
						<tr>
                        	<th>면허증 번호</th>
                        	<td>               
                           	<select name="licenseNo1" style="width: 90px;">	
                           		<option value="">선택</option>
		    					<option value="대구">대구</option>
		    					<option value="인천">인천</option>
		    					<option value="광주">광주</option>
		    					<option value="대전">대전</option>
		    					<option value="울산">울산</option>
		    				</select>		
                           	<span class="hyphen"> - </span>
                            <input  type="text" name="licenseNo2" title="면허증번호 두번째 숫자" style="width:60px;" value="" maxlength="2" onkeydown="" onkeypress="" onkeyup="">
                            <span class="hyphen"> - </span>
                            <input  type="text" name="licenseNo3" title="면허증번호 세번째 숫자" style="width:90px;" value="" maxlength="6" onkeydown="" onkeypress="" onkeyup="">
                           	<span class="hyphen"> - </span>
                            <input  type="text" name="licenseNo4" title="면허증번호 마지막 숫자" style="width:60px;" value="" maxlength="2" onkeydown="" onkeypress="" onkeyup="">
                           </td>
						</tr>
						<tr>
                        	<th>발급일</th>
								<td>
									<div class="licenseDateY">
									<input name="licenseAcqYYYY" title="면허발급일자 첫번째 숫자" placeholder="YYYY" style="width:90px;ime-mode:disabled; " onkeydown="" type="text" value="" onkeypress="" onkeyup="" maxlength="4">
									<span>년</span>	
									</div>	
									<div class="licenseDateM">							
                                	<input name="licenseAcqMM" title="면허발급일자 두번째 숫자" placeholder="MM" class="ml20" style="width:60px;ime-mode:disabled; " onkeydown="" type="text" value="" onkeypress="" onkeyup="" maxlength="2">
                                	<span>월</span> 
                                	 </div>	
									<div class="licenseDateD">	                           	
                                	<input name="licenseAcqDD" title="면허발급일자 세번째 숫자" placeholder="DD" class="ml20" style="width:60px;ime-mode:disabled; " onkeydown="" type="password" value="" onkeypress="" onkeyup="" maxlength="2">
                                	<span>일</span>
                                	</div>
								</td>
						</tr>
						<tr>
                        	<th>만료일</th>
								<td>
									<div class="licenseDateY">
									<input name="licenseAcqYYYY" title="면허발급일자 첫번째 숫자" placeholder="YYYY" style="width:90px;ime-mode:disabled; " onkeydown="" type="text" value="" onkeypress="" onkeyup="" maxlength="4">
									<span>년</span>	
									</div>	
									<div class="licenseDateM">							
                                	<input name="licenseAcqMM" title="면허발급일자 두번째 숫자" placeholder="MM" class="ml20" style="width:60px;ime-mode:disabled; " onkeydown="" type="text" value="" onkeypress="" onkeyup="" maxlength="2">
                                	<span>월</span> 
                                	 </div>	
									<div class="licenseDateD">	                           	
                                	<input name="licenseAcqDD" title="면허발급일자 세번째 숫자" placeholder="DD" class="ml20" style="width:60px;ime-mode:disabled; " onkeydown="" type="password" value="" onkeypress="" onkeyup="" maxlength="2">
                                	<span>일</span>
                                	</div>
								</td>
						</tr>
					<% } %>     
                   </tbody>
				</table>
			</div>	
			<p class="hg-30"></p>
			<label class="option-right-hr f15">예약완료를 위한 이용자 동의 사항</label>
			<!-- div 예약완료를 위한 이용 동의 -->
			<div class="user-agreement">
            	<p>
                	<input type="checkbox" id="agreeNM1" name="agreeChk1">
                    <label for="agreeNM1" class="mr15"><span class="icon"></span>예약완료를 위한 이용 동의(필수)</label>
                </p>
                <div class="box scroll">
                	<p>제 1장(총칙) </p>
                    	<ul class="txt-list">
                        	<li class="black f14">대여자격
                            	<ul class="txt-list">
                                	<li class="check f13">소/중형/7/9인승 승합차 - 만 21세 이상, 운전경력 1년 이상</li>
                                    <li class="check f13">10인승 이상 승합차 - 만 21세 이상, 운전경력 1년 이상</li>
                                    <li class="check f13">운전면허 적성검사 유효기간이 대여기간 內 남아있어야 대여가 가능함</li>
                                    <li class="check f13">제 2운전자 등록을 원하실 경우 차량 픽업시 운전면허증을 지참하시어 동행하신 경우에 한해 등록이 가능함</li>
                                    <li class="check f13">외국인일 경우 본인확인을 위한 여권 및 국제운전면허증 필수 지참</li>
                                    <li class="check f13"><span class="txt-point">차량운전자가 위의 대여자격조건에 맞지 않을 경우 현장에서 차량인수가 불가할 수도 있으니 필히 대여자격을 확인해 주시기 바랍니다.</span></li>
								</ul>
							</li>
                            <li class="black f14">운전면허
                                <ul class="txt-list">
                                   <li class="check f13">운전면허증<strong>(차량인수시 필히 지참)</strong>
                                       <ul class="txt-list">
                                            <li class="bul">도로교통법상 유효한 운전면허소지자</li>
                                       </ul>
                                   </li>
                                   <li class="check f13">외국인일 경우 국제운전면허증 소지자(B등급 이상 - 9인승 이하차량만 대여가능)
                                   </li>
                               </ul>
                           </li>
                           <li class="black f14">보험
                           		<ul class="txt-list">
                           			<li class="check f13">전 차량 자동차 종합보험(대인,대물,자손)에 가입되어 있으며 자차손해 면책제도(CDW)는 선택 사항으로 차량인수시 해당지점에서 추가로 가입이 가능합니다.
                                    </li>
                                </ul>
                           </li>
                           <li class="black f14">결제 조건
                                <ul class="txt-list">
                                    <li class="check f13">대여요금 결제시에는 신용카드 결제(임차인 본인신용카드)를 우선하며, 현금결제시에는 신용 정보조회 후 이상이 없는 경우에만 차량대여가 가능합니다.</li>
                                    <li class="check f13">차량예약 후에도 신용정보조회시 불량거래 내역등이 있을 경우 현장에서 차량대여가   불가능 할 수도 있습니다.</li>
                                    <li class="check f13"><strong>신용정보조회는 고객님의 동의하에 가능하며, 신용정보조회시 고객님의 금용거래 등에    영향을 미칠 수 있습니다.</strong></li>
                                    <li class="check f13"><span class="txt-point">사전 연락없이 예약시간까지 지점에 방문하지 않으실 경우, 예약이 취소됩니다.</span></li>
                                </ul>
                           </li>
                        </ul>
                    </div>
             </div>
             <!-- /div 예약완료를 위한 이용 동의 -->
             <!-- div 차량 대여를 위한 개인정보 수집 -->
             <p class="hg-15"></p>
             <div class="user-agreement">
            	<p>
                	<input type="checkbox" id="agreeNM2" name="agreeChk2">
                	<label for="agreeNM2" class="mr15"><span class="icon"></span>차량 대여를 위한 개인정보 수집 / 이용 동의(필수)</label>
            	</p>
            	<div class="box scroll">
            		<p></p>
            		<ul class="txt-list">
            			<li class="black f14"><span class="f120 underline">개인정보의 수집 및 이용 목적 </span>
					    	<ul class="txt-list">               
					        	<li class="check f120">렌터카 예약서비스 이용</li>
					        </ul>
					   </li>
					   <p class="hg-10"></p>
					   <li class="black f14"><span class="f120 underline">개인정보 수집 항목 </span>
					   		<ul class="txt-list">               
					        	<li class="check f120">성명, 생년월일, 성별, 이메일주소, 휴대전화번호</li>
					        </ul>
					   </li>
					   <p class="hg-10"></p>					   
					   <li class="black f14"><span class="f120 underline">개인정보 이용 및 보유 기간</span>
					   		<ul class="txt-list">               
					        	<li class="check f12 f120">이용자가 제공한 개인정보는 렌터카 서비스 이용 종료 후 5년간 회사가 보유 이용하게 됩니다.</li>
					            <li class="check f13"><span class="txt-point">동의 체크박스에 클릭할 경우, 개인정보 수집/이용 동의에 동의한 것으로 간주합니다.</span></li>				
					        </ul>
					   </li>
            		</ul>            		
            	</div>
            </div>
            <!-- /div 차량 대여를 위한 개인정보 수집 -->
            <!-- div 고유식별정보 수집에 대한 동의 -->
            <p class="hg-15"></p>
            <div class="user-agreement">
               <p>
                	<input type="checkbox" id="agreeNM3" name="agreeChk3">
                	<label for="agreeNM3" class="mr15"><span class="icon"></span>고유식별정보 수집에 대한 동의(필수)</label>
            	</p>
            	<div class="sbox scroll">      
            		<ul class="txt-list">
            			<li class="check f13">수집하는 고유식별정보 항목 : 운전면허번호</li>
						<li class="check f13">수집 및 이용 목적 : 보험 조건 등 렌터카 대여 조건 확인</li>
						<li class="check f13">보유 및 이용 기간 : 렌터카 서비스 이용 종료 후 5년간</li>						
            		</ul>
            	</div>	
            </div>
            <!-- div 고유식별정보 수집에 대한 동의 -->
            <p class="hg-10"></p>
			<div class="optionBtn">
				<button class="btn-default-cancel btn-prev" onclick="goCarOption();">이전</button>
				<button class="btn-default-ok btn-next" onclick="goPaymentPage();">다음</button>
			</div>
		</div>		
		<!-- /div car-info-right -->
		</td>
		</tr>
		</table>
	</div>
	<p class="hg-30"></p>
	<script>		
		var rentBrCode = "<%=rentBrCode%>";
		var returnBrCode = "<%=returnBrCode%>";
		var rentDate = "<%=rentDate%>";
		var returnDate = "<%=returnDate%>";
		var carPrice =  "<%=carPrice%>";
		var carNo = "<%=carNo%>";
		var optionInfo = "<%=optionInfo%>";
		var discountCate = "<%=discountCate%>";
		var discountNo = "<%=discountNo%>";
		var discountPrice = "<%=discountPrice%>";
		var cwdTotalPrice = "<%=cwdTotalPrice%>";
		var totalPrice = "<%=totalPrice%>";
		
		var rentBrName = "<%=rentBrName%>";
		var returnBrName = "<%=returnBrName%>";
		var carName = "<%=carName%>";
		var carImg = "<%=carImg%>";	
		var cwdPrice = "<%=cwdPrice%>";	
		var babySeatPrice = "<%=babySeatPrice%>";	
	</script>
	<script type="text/javascript" src="<%=contextPath%>/resources/js/reservation/reservation.js"></script>  

</body>	
</html>