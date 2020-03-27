<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.branchmanagement.model.vo.BranchManagement,
				 java.util.ArrayList, com.bbc.common.page.vo.PageInfo" %>
<%
	ArrayList<BranchManagement> list = (ArrayList<BranchManagement>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage= pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String insertBranch = (String)session.getAttribute("insertBranch");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table{margin-left: 3rem;}
	#searchBtn {
	    color: white;
	    background-color: orange;
	    margin-left: 1rem;
	    width: 65px;
	}
	.enrollBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	.deleteBtn, #cancelBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	.btnList {
	    text-align: end;
	    margin-left: 6.5rem;
	    width: 1110px;
	}
	#addressBtn, #completeBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	}
	
	/* 민진 한테 받은 search 스타일 부분 */
	.navbar-form {
	  margin-top: 2rem;
	  margin-left: 20rem;
	  margin-right: 13rem;
	}
	.navbar-search .dropdown-menu { min-width: 10px;}
	#searching {
	  color: white;
	  background-color: orange;
	  margin-left: 1rem;
	}
	.pagination {
	  display: flex;
	  padding-left: 0;
	  list-style: none;
	  border-radius: 0.35rem;
	  margin-left: 24rem;
	  margin-bottom: 5rem;
	}
	button.btn.btn-search.dropdown-toggle {
	    background: transparent;
	    color: black;
	}
	.btn-toolbar .input-group {
	  width: auto;
	}
	.input-group {
	  position: relative;
	  display: flex;
	  flex-wrap: wrap;
	  align-items: stretch;
	  width: 100%;
	  margin-bottom: 3rem;
	}	
	.dropdown-menu {
	  position: absolute;
	  top: 100%;
	  left: 0;
	  z-index: 1000;
	  display: none;
	  float: left;
	  min-width: 10rem;
	  padding: 0.5rem 0;
	  margin: 0.125rem 0 0;
	  font-size: 0.85rem;
	  color: #858796;
	  text-align: left;
	  list-style: none;
	  background-color: #fff;
	  background-clip: padding-box;
	  border: 1px solid #e3e6f0;
	  border-radius: 0.35rem;
	}
	.dropleft .dropdown-menu {
	  top: 0;
	  right: 100%;
	  left: auto;
	  margin-top: 0;
	  margin-right: 0.125rem;
	}
	.dropup .dropdown-menu {
	  top: auto;
	  bottom: 100%;
	  margin-top: 0;
	  margin-bottom: 0.125rem;
	}
	.dropright .dropdown-menu {
	  top: 0;
	  right: auto;
	  left: 100%;
	  margin-top: 0;
	  margin-left: 0.125rem;
	}
	.dropright .dropdown-toggle::after {
	  display: inline-block;
	  margin-left: 0.255em;
	  vertical-align: 0.255em;
	  content: "";
	  border-top: 0.3em solid transparent;
	  border-right: 0;
	  border-bottom: 0.3em solid transparent;
	  border-left: 0.3em solid;
	}
	.dropright .dropdown-toggle:empty::after {
	  margin-left: 0;
	}
	.dropright .dropdown-toggle::after {
	  vertical-align: 0;
	}
	#addressBtn{float:right;}	
	
	
	/* Modal 스타일 */
	/* 기본 틀 스타일 */
	.modal-footer {display: table-cell !important;}
	button.completeBtn {
	    position: relative;
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	button.cancelBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	
	
	/* 여기서부턴 페이지마다 조금씩 다름 */
	#couponHeader>h5{font-weight:bold;}
	div#couponHeader {
	    text-align: left;
	    margin: 0 0 20px 20px;
	}
	table#coupon-table {
	    width: 100%;
	    text-align: left;
	    margin-left: 3rem;
	}
	textarea#condition {
	    resize: none;
	    width: 362px;
	    height: 140px;
	    margin-top: 5px;
	}
	input#coupon-title {
		width: 362px;
	}
	
	
	table#coupon-detail-table {
	    width: 100%;
	    height: 74%;
	    text-align: left;
	    margin-left: 3rem;
	}
	
	
</style>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	<script>
		var insertBranch = "<%=insertBranch%>";
		
		$(function(){
			if(insertBranch != "null"){
				alert(insertBranch);
				<%session.removeAttribute("insertBranch");%>
			}
		});
	</script>
	
	<!-- 지점등록 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>지점등록</h1>
		</div>
		<hr id="header-line">
		<br>

		<div class="btnList">
	       <button class="enrollBtn" onclick="goAdd();">등록</button>
		</div>
		
		
		<!-- 상세보기 Modal -->
		<div class="modal fade" id="detailInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      
		      <div class="modal-body">
		      	<br>
				<div id="couponHeader"><h5>지도</h5></div>	
				<hr>      
				<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
				
					
		      
		      </div>
		      
		      <div style="display:none;"></div>
		      
		      <div class="modal-footer">
		        <button type="button" class="completeBtn">닫기</button>
		      </div>
		      
		      
		    </div>
		  </div>
		</div>
		
		
        <div class="tab-content">
          <div id="home" class="container tab-pane active"><br>
            
            <table id="notice-table" class="table table-bordered" width="100%" cellspacing="0">
              <thead>
                <tr>
                    <th>번호</th>
                    <th>지역</th>
                    <th>지점</th>
                    <th>전화번호</th>
                    <th>주소</th>
                </tr>
              </thead>
              
              <tbody>
	              <% if(list != null){ %>
	              	<% for(BranchManagement b : list){ %>
	              		<tr>
	              			<td><%=b.getBranchNo()%></td>
	              			<td><%=b.getAreaName()%></td>
	              			<td><%=b.getBranchName()%></td>
	              			<td class="infoDe"><%=b.getBranchPhone()%></td>
	              			<td>
	              				<%=b.getBranchAddress()%>
	              				<button type="button" id="addressBtn" class="addressBtn" data-toggle="modal" data-target="#detailInfo">위치보기</button>
	              				<input type="hidden" value="<%=b.getMapX()%>">
	              				<input type="hidden" value="<%=b.getMapY()%>">
	              			</td>
	              		</tr>
	              	<% } %>
	              <% }else { %>
	              	<tr>
	              		<td colspan="6">등록된 지점이 없습니다.</td>
	              	</tr>
	              <% } %>
              </tbody>
            </table>
          </div>
        </div>
            
         <!-- 전체 선택 스크립트 -->
         <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		 <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d483cae05a686fa35a6aaef87d12240&libraries=services"></script>
         <script>
             function checkAll(){
                 if( $("#th_checkAll").is(':checked') ){
                     $("input[name=checkRow]").prop("checked", true);
                 }else{
                     $("input[name=checkRow]").prop("checked", false);
                 }
             }
             
             function goAdd(){
            	 location.href="<%=contextPath%>/addBranch.t.br";
             }
        		 /* var x = $(this).next().val();
        		 var y = $(this).next().next().val(); */
             /* 지도 script */
             /* x, y 축 값 추출 부분 */
             
             $(function(){
	             $(".addressBtn").click(function(){
            
            	 
	            	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	     	        mapOption = {
	     	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	     	            level: 5 // 지도의 확대 레벨
	     	        };
	     	
	     		    //지도를 미리 생성
	     		    var map = new daum.maps.Map(mapContainer, mapOption);
	     		    //주소-좌표 변환 객체를 생성
	     		    var geocoder = new daum.maps.services.Geocoder();
	     		    //마커를 미리 생성
	     		    var marker = new daum.maps.Marker({
	     		        position: new daum.maps.LatLng(37.537187, 127.005476),
	     		        map: map
	     		    });
	     		
	     		
	     		    function sample5_execDaumPostcode() {
	     		        new daum.Postcode({
	     		            oncomplete: function(data) {
	     		                var addr = data.address; // 최종 주소 변수
	     		
	     		                // 주소 정보를 해당 필드에 넣는다.
	     		                document.getElementById("sample5_address").value = addr;
	     		                // 주소로 상세 정보를 검색
	     		                geocoder.addressSearch(data.address, function(results, status) {
	     		                    // 정상적으로 검색이 완료됐으면
	     		                    if (status === daum.maps.services.Status.OK) {
	     		
	     		                        var result = results[0]; //첫번째 결과의 값을 활용
	     		
	     		                        // 해당 주소에 대한 좌표를 받아서
	     		                        var coords = new daum.maps.LatLng(result.y, result.x);
	     		                        
	     		                        // 지도를 보여준다.
	     		                        mapContainer.style.display = "block";
	     		                        map.relayout();
	     		                        
	     		                        // 지도 중심을 변경한다.
	     		                        map.setCenter(coords);
	     		                        
	     		                        // 마커를 결과값으로 받은 위치로 옮긴다.
	     		                        marker.setPosition(coords);
	     		                        
	     		                        // 값을 받아줄 input hidden에 값 넣어주기
	     		                        $("#mapX").val(result.x);	// 127.005476
	     		                        $("#mapY").val(result.y);	// 37.537187
	     		                        
	     		                    }
	     		                });
	     		            }
	     		        }).open();
	     		    }
	             });
	             
	             $(".infoDe").prevAll(function(){
	            	location.href = "" 
	             });
	             
	             
             });
        		 
			

         </script>
            
            
	<!-- search form -->
	<form class="navbar-form navbar-search" role="search">
	    <div class="input-group">
	    
	        <div class="input-group-btn">
	            <button type="button" class="btn btn-search btn-default dropdown-toggle" data-toggle="dropdown">
	                <span class="glyphicon glyphicon-search"></span>
	                <span class="label-icon">전체</span>
	                <span class="caret"></span>
	            </button>
	            <ul class="dropdown-menu pull-left" role="menu">
	              <li>
	                <a href="#">
	                    <span class="glyphicon glyphicon-user"></span>
	                    <span class="label-icon">이름</span>
	                </a>
	              </li>
	               <li>
	                    <a href="#">
	                        <span class="glyphicon glyphicon-user"></span>
	                        <span class="label-icon">예약 번호</span>
	                    </a>
	                </li>
	                
	                <li>
	                    <a href="#">
	                    <span class="glyphicon glyphicon-book"></span>
	                    <span class="label-icon">차량 번호</span>
	                    </a>
	                </li>
	            </ul>
	        </div>
	
	        <input type="text" class="form-control">
	    
	        <div class="input-group-btn">
	            <button type="button" class="btn btn-search btn-default" id="searching">검색</button> 
	        </div>
	    </div>  
	</form>   

        <div class="pagination">
        	<!-- 맨 처음으로 이동(<<) -->
        	<a href="<%=contextPath%>/list.t.br"> &lt;&lt; </a>
        	<!-- 이전 페이지(<) -->
        	<a href="<%=contextPath%>/list.t.br?currentPage=<%=currentPage-1%>"> &lt; </a>
        	
        	<!-- 페이지 목록 -->
        	<% for(int p=currentPage; p<=endPage; p++){ %>
        		<% if(currentPage == p){ %>
        			<li><a><%=p%></a></li>
        		<% }else { %>
        			<li><a href="<%=contextPath%>/list.t.bo?currentPage=<%=p%>"><%=p%></a></li>
        		<% } %>
        	<% } %>
        	
        	<!-- 다음 페이지(>) -->
        	<a href="<%=contextPath%>/list.t.br?currentPage=<%=currentPage+1%>"> &gt; </a>
        	<!-- 맨 끝으로 이동(>>) -->
        	<a href="<%=contextPath%>/list.t.br?currentPage=<%=maxPage%>"> &gt;&gt; </a>
        </div>
		
	</div>

</body>
</html>