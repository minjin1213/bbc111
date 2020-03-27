<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList, com.bbc.area.model.vo.Area, com.bbc.branchmanagement.model.vo.BranchManagement" %>    
<% 
	ArrayList<Area> list = (ArrayList<Area>)request.getAttribute("list"); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량예약</title>
<link href="<%=request.getContextPath()%>/resources/css/reservation/reservation.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- div outer -->
	<div class="outer">	
		<div class="main-title">차량예약</div>
		<hr class="garo">
		<!-- div car-info-left -->
		<table>
		<tr>
		<td valign="top">
		<div id="car-info-left">
		<!-- <form id="searchForm" method="post" action="<%=request.getContextPath()%>/insert.me"> -->	
			<label class="ml5">기간 선택</label>
		    <div class="left-margin" id="selectDate">
		    	<input type="text" onclick="return false;" class="reservation-input" name="reservation_date" value="대여일시" readonly> 
            	&nbsp;<input type="text" onclick="return false;" class="reservation-input" name="return_date" value="반납일시" readonly> 
			</div>             
            <label class="label-title">지점 선택</label>
            <a data-toggle="modal" href="#myBranch" data-backdrop="static"  aria-hidden="true" class="mybranch">나의 지점</a> 
            <div class="left-margin">
            	<span data-toggle="modal" data-target="#selectBranchModal" data-backdrop="static" aria-hidden="true">
            		<input type="text" class="reservation-input" name="rent_branch" value="대여지점" readonly>
            		&nbsp;<input type="text" class="reservation-input" name="return_branch" value="반납지점" readonly>
            	</span>
            </div>
            <label class="label-title">차량유형 선택</label>
            <div class="left-margin" id="car-type">
            	<table>
            		<tr>
            			<td onclick="alert('경차')">경차</td><td>소형</td><td>중형</td>
            		</tr>
            		<tr>
            			<td>준대형</td><td>대형</td><td>승합</td>
            		</tr>
            		<tr>
            			<td>SUV/RV</td><td>전기차</td><td>수입차</td>
            		</tr>
            		<tr>
            			<td>전체보기</td><td colspan="2">알뜰카 전용</td>
            		</tr>
           	 	</table>
            </div>   
            <button class="btn-default-ok btn-search" id="serchCar">검색</button>		
		<!-- </form> -->
		</div>	
		</td>
		<!-- /div car-info-left -->
		<!-- div car-info-right -->
		<td valign="top">
		<div id="car-info-right" style="display:">
			<table>
				<tr>
				<td width="100px" style="margin-top:-5px"><img src="<%=request.getContextPath()%>/resources/images/car_branch.png"></td>
				<td width="150px"><label class="car-info-title">지점안내</label></td>			
				<td width="100px"><img src="<%=request.getContextPath()%>/resources/images/car_price.png"></td>
				<td width="150px"><label class="car-info-title">요금안내</label></td>
				</tr>
			</table>
			<p style="height:25px"></p>
			<table style="margin-left:12px">	
				<tr>
					<td colspan="2"><label class="car-info-title">이벤트</label></td>
				</tr>
				<tr>
					<td>새 봄 맞이 최대 55% 할인 이벤트!</td>
					<td width="200px">2020.02.24 ~ 2020.07.31</td>
				</tr>
				<tr>
					<td>새 봄 맞이 최대 55% 할인 이벤트!</td>
					<td>2020.02.24 ~ 2020.07.31</td>
				</tr>
				<tr>
					<td>새 봄 맞이 최대 55% 할인 이벤트!</td>
					<td>2020.02.24 ~ 2020.07.31</td>
				</tr>
				<tr>
					<td>새 봄 맞이 최대 55% 할인 이벤트!</td>
					<td>2020.02.24 ~ 2020.07.31</td>
				</tr>
			</table>
			<p style="height:25px"></p>
			<table style="margin-left:12px">	
				<tr>
					<td colspan="2"><label class="car-info-title">공지사항</label></td>
				</tr>
				<tr>
					<td>시스템 점검 작업 안내</td>
					<td width="120px">2020.02.24</td>
				</tr>
				<tr>
					<td>시스템 점검 작업 안내</td>
					<td>2020.02.24</td>
				</tr>
				<tr>
					<td>시스템 점검 작업 안내</td>
					<td>2020.02.24</td>
				</tr>
				<tr>
					<td>시스템 점검 작업 안내</td>
					<td>2020.02.24</td>
				</tr>
			</table>
		</div>
		<!-- /div car-info-right -->
		<!-- div car-search-result -->
		<div id="car-search-result" style="display:none">	
			<label class="mt5 ml10">결과<span>(5)</span></label>					
			<span class="pl100 pb15 f12 txt-red1">* 할인 및 쿠폰적용은 예약 다음 페이지에서 선택 가능합니다.</span>
			<div class="list-car">
				<table style="width:470px">
					<tr>
					<td rowspan="3"><img src="<%=request.getContextPath()%>/resources/images/car/avante2019.jpg"></td>
					</tr>
					<tr>
					<td width="70%" class="car-type">ALL NEW K3 (G)</td>
					<td width="30%" class="car-price">49,500원</td>
					</tr>	
					<tr>
					<td colspan="2">
					<span class="ico-gas"><img src="<%=request.getContextPath()%>/resources/images/car/ico_gas_new.png"></span>
					<div class="ico-people-wrap">
						<div><img src="/bbc/resources/images/car/ico_people.png"></div>
						<div class="ico-people-text"><p class="ico-people-count">5</p></div>
					</div>					
					<div class="btn-reservation" onclick="goLinkPage('<%=contextPath%>/carOption.rv');">예약</div>					
					</td>				
					</tr>	
					<tr>
					<td colspan="3"><p style="border-bottom: 1px solid #757272; margin-top:10px; margin-bottom:5px;"></p></td>
					</tr>				
					<!-- -- 두번째 -->
					<tr>
					<td rowspan="3"><img src="<%=request.getContextPath()%>/resources/images/car/avante2019.jpg"></td>
					</tr>
					<tr>
					<td width="70%" class="car-type">아반떼 AD (D) F/L</td>
					<td width="30%" class="car-price">49,500원</td>
					</tr>	
					<tr>
					<td colspan="2">
					<span class="ico-gas"><img src="<%=request.getContextPath()%>/resources/images/car/ico_lpg_new.png"></span>
					<div class="ico-people-wrap">
						<div><img src="/bbc/resources/images/car/ico_people.png"></div>
						<div class="ico-people-text"><p class="ico-people-count">5</p></div>
					</div>					
					<div class="btn-reservation" onclick="">예약</div>
					</td>		
					</tr>
					<tr>
					<td colspan="3"><p style="border-bottom: 1px solid #757272; margin-top:10px; margin-bottom:5px;"></p></td>
					</tr>	
					<!-- -- 세번째 -->
					<tr>
					<td rowspan="3"><img src="<%=request.getContextPath()%>/resources/images/car/canival.jpg"></td>
					</tr>
					<tr>
					<td width="70%" class="car-type">올 뉴 카니발 9인승 (D)</td>
					<td width="30%" class="car-price">121,500원</td>
					</tr>	
					<tr>
					<td colspan="2">
					<span class="ico-gas"><img src="<%=request.getContextPath()%>/resources/images/car/ico_diesel_new.png"></span>
					<div class="ico-people-wrap">
						<div><img src="/bbc/resources/images/car/ico_people.png"></div>
						<div class="ico-people-text"><p class="ico-people-count">9</p></div>
					</div>					
					<div class="btn-reservation" onclick="">예약</div>
					</td>		
					</tr>
					<tr>
					<td colspan="3"><p style="border-bottom: 1px solid #757272; margin-top:10px; margin-bottom:5px;"></p></td>
					</tr>	
					<!--- 네번째 --->
					<tr>
					<td rowspan="3"><img src="<%=request.getContextPath()%>/resources/images/car/canival.jpg"></td>
					</tr>
					<tr>
					<td width="70%" class="car-type">올 뉴 카니발 9인승 (D)</td>
					<td width="30%" class="car-price">121,500원</td>
					</tr>	
					<tr>
					<td colspan="2">
					<span class="ico-gas"><img src="<%=request.getContextPath()%>/resources/images/car/ico_diesel_new.png"></span>
					<div class="ico-people-wrap">
						<div><img src="/bbc/resources/images/car/ico_people.png"></div>
						<div class="ico-people-text"><p class="ico-people-count">9</p></div>
					</div>					
					<div class="btn-reservation" onclick="">예약</div>
					</td>		
					</tr>
					<tr>
					<td colspan="3"><p style="border-bottom: 1px solid #757272; margin-top:10px; margin-bottom:5px;"></p></td>
					</tr>
					<!--- 다섯번째 --->
					<tr>
					<td rowspan="3"><img src="<%=request.getContextPath()%>/resources/images/car/avante2019.jpg"></td>
					</tr>
					<tr>
					<td width="70%" class="car-type">ALL NEW K3 (G)</td>
					<td width="30%" class="car-price">49,500원</td>
					</tr>	
					<tr>
					<td colspan="2">
					<span class="ico-gas"><img src="<%=request.getContextPath()%>/resources/images/car/ico_gas_new.png"></span>
					<div class="ico-people-wrap">
						<div><img src="/bbc/resources/images/car/ico_people.png"></div>
						<div class="ico-people-text"><p class="ico-people-count">5</p></div>
					</div>					
					<div class="btn-reservation" onclick="">예약</div>
					</td>		
					</tr>
						
				</table>
	
			</div>
		</div>	
		<!-- div /car-search-result -->
		</td>
		</tr>
		</table>
	</div>
	<!-- /div outer -->
	
	<!-- 지점선택 모달 : selectBranchModal --->
	<div class="modal fade" id="selectBranchModal" role="document">
     <div class="modal-dialog modal-bg modal-dialog-centered">   
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">        	
         	<span class="left-margin">지점 선택</span>
          	<button type="button" class="close" data-dismiss="modal">×</button>          
        </div>
        <div class="modal-body">
          <div class="wrap-branch">
          	<!-- left-branch -->
			<div class="left-branch">
          		<label class="label-top-title label-top-title-branch">대여 지점</label><br>
          		<span style="display:inline-block; padding-bottom:5px; font-size:12px; color:#ef2e0f;">* 대여지점과 다른 지점으로 반납하실 경우 별도의 수수료가 부과됩니다.</span>        		
				<div style="position:relative">
					<% if(list.isEmpty()) { %>
					<select name="brancharea" id="brancharea">
						<option value='no'>지역정보가 없습니다.</option>
					</select>
					<% }else { %>
					<select name="brancharea" id="brancharea">							
						<% for(int i=0; i<list.size(); i++) {%>	
								<% if(i==0) {%>				
									<option value='<%=list.get(i).getAreaCode()%>' selected><%=list.get(i).getAreaName()%></option>
								<%} else { %>
									<option value='<%=list.get(i).getAreaCode()%>'><%=list.get(i).getAreaName()%></option>
								<%} %>	
						<% } %>	
					</select>
					<% } %>	
				</div>
				<div id="selRentDiv" class="select-branch">
					<ul></ul>
				</div>		
			</div>	
			<!-- /left-branch -->
			<!-- right-branch -->
			<div class="right-branch">
          		<label class="label-top-title label-top-title-branch">반납 지점</label><br>
          		<span style="font-size:14px; display:inline-block; padding-bottom:5px"><input type="checkbox" name="return_option" checked>대여/반납지점 동일</span>
				<div style="position:relative">
					<select>	
		    			<option>서울</option>
		    			<option>경기</option>
						<option>강원</option>
						<option>인천</option>
		    			<option>제주</option>
					</select>
				</div>
				<div id="selReturnDiv" class="select-branch">
					<ul>
						<li>
							<input type="radio" id="rdo-402" class="radio-branch" name="rdo-1" value="123^강남" onclick="setValBranchInfo('rent', this.value)">
							<label for="rdo-402">강남</label>												
							<a href="#" title="" data-content="Popover body content is set in this attribute." data-container="" data-original-title="Popover title">button</a>

							&nbsp;<a data-toggle="modal" href="#noticeInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_notice.png"></a>
							<a data-toggle="modal" href="#branchInfo" data-backdrop="static" class="libtn btn-white">지점안내</a>
						</li>
						<li>
							<input type="radio" id="rdo-402" class="radio-branch" name="rdo-1" value="123^광화문(파이낸스센터)" onclick="setValBranchInfo('rent', this.value)">
							<label for="rdo-402">광화문(파이낸스센터)</label>
							&nbsp;<a data-toggle="modal" href="#eventInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_event.png"></a>
							&nbsp;<a data-toggle="modal" href="#noticeInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_notice.png"></a>
							<a data-toggle="modal" href="#branchInfo" data-backdrop="static" class="libtn btn-white">지점안내</a>
						</li>
						<li>
							<input type="radio" id="rdo-402" class="radio-branch" name="rdo-1" value="123^강북" onclick="setValBranchInfo('rent', this.value)">
							<label for="rdo-402">강북</label>
							&nbsp;<a data-toggle="modal" href="#eventInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_event.png"></a>							
							<a data-toggle="modal" href="#branchInfo" data-backdrop="static" class="libtn btn-white">지점안내</a>
						</li>	
						<li>
							<input type="radio" id="rdo-402" class="radio-branch" name="rdo-1" value="123^강남" onclick="setValBranchInfo('rent', this.value)">
							<label for="rdo-402">강남</label>
							&nbsp;<a data-toggle="modal" href="#eventInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_event.png"></a>
							&nbsp;<a data-toggle="modal" href="#noticeInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_notice.png"></a>
							<a data-toggle="modal" href="#branchInfo" data-backdrop="static" class="libtn btn-white">지점안내</a>
						</li>
						<li>
							<input type="radio" id="rdo-402" class="radio-branch" name="rdo-1" value="123^광화문(파이낸스센터)" onclick="setValBranchInfo('rent', this.value)">
							<label for="rdo-402">광화문(파이낸스센터)</label>
							&nbsp;<a data-toggle="modal" href="#eventInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_event.png"></a>
							&nbsp;<a data-toggle="modal" href="#noticeInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_notice.png"></a>
							<a data-toggle="modal" href="#branchInfo" data-backdrop="static" class="libtn btn-white">지점안내</a>
						</li>
						<li>
							<input type="radio" id="rdo-402" class="radio-branch" name="rdo-1" value="123^강북" onclick="setValBranchInfo('rent', this.value)">
							<label for="rdo-402">강북</label>
							&nbsp;<a data-toggle="modal" href="#eventInfo" data-backdrop="static">
							<img src="<%=request.getContextPath()%>/resources/images/btn_event.png"></a>							
							<a data-toggle="modal" href="#branchInfo" data-backdrop="static" class="libtn btn-white">지점안내</a>
						</li>								
					</ul>
				</div>					
			</div>			
          	<!-- /right-branch -->        	
          </div>
        </div>
        <div class="modal-footer-none">
        	<div style="text-align:center; margin-bottom:15px;">
        	    <button class="btn-default-cancel btn-modal" data-dismiss="modal">취소</button>&nbsp;
        		<button class="btn-default-ok btn-modal" onclick="setBranch();" data-dismiss="modal">확인</button>  
        	</div>
        </div>
      </div>
      <!-- / Modal content-->
    </div>
  </div>
  <!-- / 모달아이디 : selectBranchModal --->
  
  	<!-- 나의지점 모달창 -->
  	<div class="modal fade" id="myBranch" role="dialog" aria-hidden="true">
    	<div class="modal-dialog">
      		<div class="modal-content">
        		<div class="modal-header">
          			<button type="button" class="close" data-dismiss="modal">×</button>
          			<label class="label-title">나의 지점</label>
        		</div>
        		<div class="modal-body">         		
						<p style="margin-bottom:10px; font-size:14px">'마이페이지 > 나의 지점 관리'에서 나의 지점을 등록할 수 있습니다.</p>
						<div class="mybranch-table" style="border-top: 1px solid #000;">
							<table class="tb-col" style="width="600px">
								<thead style="display: table-header-group; vertical-align: middle;">
									<tr style="display: table-row; vertical-align: inherit;">
										<th width="80px">선택</th>
										<th width="200px">나의 지역</th>
										<th width="320px">나의 지점</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<input type="radio" id="radio01" name="u_check" onclick="storeSave();">
										     <label for="radio01"><span class="icon"></span></label>
										</td>
										<td>서울</td>
										<td>강남</td>
									</tr>
									<tr>
										<td>
											<input type="radio" id="radio01" name="u_check" onclick="storeSave();">
										     <label for="radio01"><span class="icon"></span></label>
										</td>
										<td>인천/경기/강원</td>
										<td>인천공항(T2)</td>
									</tr>
								</tbody>
						</table>
					</div>
        		</div>
        		<div style="text-align:center; margin-bottom:15px;">
        	    	<button class="btn-default-cancel btn-modal" data-dismiss="modal">취소</button>&nbsp;
        			<button class="btn-default-ok btn-modal" onclick="setMyBranch();" data-dismiss="modal">확인</button>  
        		</div>
      		</div>
    	</div>
  	</div>
  
   	<!-- 지점정보 모달창 -->
    <div class="modal fade" id="branchInfo" role="dialog" aria-hidden="true">
    	<div class="modal-dialog">
      		<div class="modal-content">
        		<div class="modal-body">     
        			<%@ include file="../reservation/branchInfo.jsp" %>   	
        		</div>
        		<div style="text-align:center; margin-bottom:15px;">
           			<button type="button" class="btn btn-warning btn-sm" data-dismiss="modal">확인</button>
        		</div>
      		</div>
    	</div>
  	</div>

 	<!-- 공지사항 모달창 -->
  	<div class="modal fade" id="noticeInfo" role="dialog" aria-hidden="true">
    	<div class="modal-dialog modal-dialog-centered" role="document">
      		<div class="modal-content">
      			<div class="modal-header">
            		<span class="left-margin">공지사항</span>
          			<button type="button" class="close" data-dismiss="modal">×</button>  			
        		</div>
        		<div class="modal-body">     
          			<ul class="txt-list"></ul>            			      	
        		</div>
      		</div>
    	</div>
  	</div>
  	
   	<!-- 이벤트 모달창 -->  	
  	<div class="modal fade" id="eventInfo" role="dialog" aria-hidden="true">
    	<div class="modal-dialog modal-dialog-centered" role="document">
      		<div class="modal-content">
      			<div class="modal-header">
            		<span class="left-margin">이벤트</span>
          			<button type="button" class="close" data-dismiss="modal">×</button>  			
        		</div>
        		<div class="modal-body">     
          			<ul class="txt-list"></ul>        	
        		</div>
      		</div>
    	</div>
  	</div>
 
	<script type="text/javascript" src="<%=contextPath%>/resources/js/reservation/reservation.js"></script>

</body>	
</html>