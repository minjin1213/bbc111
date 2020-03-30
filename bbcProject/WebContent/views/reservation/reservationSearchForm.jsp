<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList, com.bbc.notice.model.vo.Notice, com.bbc.event.model.vo.Event, com.bbc.area.model.vo.Area, com.bbc.branchmanagement.model.vo.BranchManagement" %>    
<% 	
	ArrayList<Event> elist = (ArrayList<Event>)request.getAttribute("elist"); 	
	ArrayList<Notice> nlist = (ArrayList<Notice>)request.getAttribute("nlist"); 	
	ArrayList<Area> list = (ArrayList<Area>)request.getAttribute("list"); 	
	
	String preLink = (String)request.getAttribute("preLink");	
	String rent_branch = (String)(request.getAttribute("rent_branch"));
	String return_branch = (String)(request.getAttribute("return_branch"));
	String rent_branchnm = (String)request.getAttribute("rent_branchnm");
	String return_branchnm = (String)request.getAttribute("return_branchnm");
	String rentDate = (String)request.getAttribute("rentDate");
	String returnDate = (String)request.getAttribute("returnDate");	
	String carno = (String)(request.getAttribute("carno"));
	String carType = (String)(request.getAttribute("carType"));
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
			<label class="label-title-first">기간 선택</label>
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
            <div class="left-margin" id="car-type-list"></div>   
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
			<p class="hg-20"></p>
			<table style="margin-left:12px">	
				<tr>
					<td colspan="2"><label class="car-info-title" onclick="goNotice();" style="cursor: pointer">이벤트</label></td>
				</tr>
				<% if(elist.isEmpty()){ %>
					<tr>
						<td colspan="5">존재하는 이벤트가 없습니다.</td>
					</tr>
				<% }else { %>
					<% for(Event e : elist){ %>
						<tr style="cursor: pointer" data-toggle="modal" data-target="#eventInfoHome" data-whatever="<%=e.getEventContent()%>">
							<td><%=e.getEventTitle()%></td>
							<td width="200px"><%=e.getEventStartDate()%> ~ <%=e.getEventEndDate()%></td>
						</tr>
					<% } %>
				<% } %>
			</table>
			<p class="hg-20"></p>
			<table style="margin-left:12px">	
				<tr>
					<td colspan="2"><label class="car-info-title" onclick="goNotice();" style="cursor: pointer">공지사항</label></td>
				</tr>
				<% if(nlist.isEmpty()){ %>
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
				<% }else { %>
					<% for(Notice n : nlist){ %>
						<tr style="cursor: pointer" data-toggle="modal" data-target="#noticeInfoHome" data-whatever="<%=n.getNoticeContent()%>">						
							<td width="397px"><%=n.getNoticeTitle()%></td>
							<td><%=n.getEnrollDate()%></td>
						</tr>
					<% } %>
				<% } %>	
			</table>
		</div>
		<!-- /div car-info-right -->
		<!-- div car-search-result -->
		<div id="car-search-result" style="display:none">	
			<label class="mt5 ml10" id="searchcnt"></label>					
			<span class="pl100 pb15 f12 txt-red1">* 할인 및 쿠폰적용은 예약 다음 페이지에서 선택 가능합니다.</span>
			<div class="list-car">			
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
				<div id="selReturnDiv" class="select-branch">
					<ul></ul>
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
            		<span class="left-margin">나의 지점</span>
          			<button type="button" class="close" data-dismiss="modal">×</button>  			
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

 	<!-- 지점공지사항 모달창 -->
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
  	
  	<!-- 공지사항 모달창 -->
  	<div class="modal fade" id="noticeInfoHome" role="dialog" aria-hidden="true">
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
  	
   	<!-- 지점이벤트 모달창 -->  	
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
  	
  	<!-- 이벤트 모달창 -->  	
  	<div class="modal fade" id="eventInfoHome" role="dialog" aria-hidden="true">
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
  	
  	<script>
		var rentBrCode = "<%=rent_branch%>";
		var returnBrCode = "<%=return_branch%>";
		var rentBrName = "<%=rent_branchnm%>";
		var returnBrName = "<%=return_branchnm%>";
		var rentDate = "<%=rentDate%>";
		var returnDate = "<%=returnDate%>";
		var carNo = "<%=carno%>";
		var carTypeInfo = "<%=carType%>";
		var preLink = "<%=preLink%>";
	</script>
	<script type="text/javascript" src="<%=contextPath%>/resources/js/reservation/reservation.js"></script>

</body>	
</html>