  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.coupon.model.vo.Coupon, java.util.ArrayList,
				com.bbc.common.page.vo.PageInfo" %>
<%
	ArrayList<Coupon> list = (ArrayList<Coupon>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String deleteCom = (String)session.getAttribute("deleteCom");
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
	.deleteBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	button.completeBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 60px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	button.completeBtn2{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	
	
	.btnList {
	    text-align: end;
	    margin-left: 6.5rem;
	    width: 1110px;
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
		
	
	/* 모달 스타일 */
	/* 기본 틀 스타일 */
	.modal-content{height: 430px !important;}	/* 쿠폰창은 조금 다름 */
	.modal-footer {display: table-cell !important;}
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
		height: 75%;
	    width: 100%;
	    text-align: left;
	    margin-left: 3rem;
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
	.tableIn{border-radius: 10px;}

	
</style>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	<script>
		$(function(){
			var deleteCom = "<%=deleteCom%>";
			
			if(deleteCom != "null"){
				alert(deleteCom);
				<%session.removeAttribute("deleteCom");%>
			}
		});
	</script>
	
	<!-- 쿠폰조회 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>쿠폰조회</h1>
		</div>
		<hr id="header-line">
		<br>
		<!-- 
			모달창 밖에 영역 눌렀을 때 안닫히게 하는거
			data-backdrop="static"
		 -->
     	<!-- 모달 팝업 부분 -->
		<!-- Button trigger modal -->
		<div class="btnList">
			<button class="enrollBtn" data-toggle="modal" data-target="#myModal">등록</button>
	        <button class="deleteBtn">삭제</button>
        </div>
		 
		<!-- 쿠폰 등록 Modal -->
		<form action="addCoupon.t.co" method="post">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      
			      <div class="modal-body">
			      	<br>
					<div id="couponHeader"><h5>쿠폰 등록</h5></div>	
					<hr>      	
			      	<table id="coupon-table">
			      		<input type="hidden" name="loginUser" value="1">
						<tr>
							<th>쿠폰명</th>
							<td><input type="text" class="tableIn" id="coupon-title" name="coupon-title"></td>
						</tr>
						<tr>
							<th>발급조건</th>
							<td>
								<select class="tableIn" name="couponV">
									<option>선택하세요</option>
									<option value="1">회원가입 축하 쿠폰</option>
									<option value="2">차량 첫 이용 쿠폰</option>
									<option value="3">차량 3회 이용 쿠폰</option>
								</select>						
							</td>
						</tr>
						<tr>
							<th>할인율</th>
							<td><input class="tableIn" type="text" name="couponDc"> %</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td>sysdate</td>
						</tr>
						<tr>
							<th>등록자</th>
							<td></td>
						</tr>
			      	</table>
			      </div>
			      
			      <div style="display:none;"></div>
			      
			      <div class="modal-footer">
			        <button type="submit" class="completeBtn2">등록하기</button>
			        <button type="button" class="cancelBtn" data-dismiss="modal">취소</button>
			      </div>
			      		      
			    </div>
			  </div>
			</div>
		</form>
		
		
				
		<!-- 쿠폰 리스트 부분 -->
		<div class="tab-content">
		  <div id="home" class="container tab-pane active"><br>
		    
		    <table id="notice-table" class="table table-bordered" width="100%" cellspacing="0">
		      <thead>
		        <tr>
		            <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></th>
		            <th>번호</th>
		            <th>쿠폰명</th>
		            <th>할인금액</th>
		            <th>발급조건</th>
		            <th>등록자</th>
		        </tr>
		      </thead>
		      <tbody>
		      	<% if(list.isEmpty()){ %>
		      			<tr>
		      				<td colspan="6">조회된 리스트가 없습니다.</td>
		      			</tr>
	      		<% }else { %>
		      		<% for(int i=0; i<list.size(); i++){ 
		      				Coupon c = list.get(i); %>
		      			<tr>
		      				<th>
		      					<input type="checkbox" class="checkNo" name="checkRow">
		      					<input type="hidden" value="<%=c.getCouponNo()%>">
		      				</th>
		      				<td data-toggle="modal" data-target="#couponDetail<%=i %>"><%=c.getCouponNo()%></td>
		      				<td data-toggle="modal" data-target="#couponDetail<%=i %>"><%=c.getCouponName()%></td>
		      				<td data-toggle="modal" data-target="#couponDetail<%=i %>"><%=c.getCouponDc()%> %</td>
		      				<td data-toggle="modal" data-target="#couponDetail<%=i %>">
		      					<% if(c.getCouponGive()==1){ %>
			      					회원가입
			      				<% }else if(c.getCouponGive()==2){ %>
			      					첫차량이용
			      				<% }else if(c.getCouponGive()==3){ %>
			      					이용내역3회누적
			      				<% } %>
		      				</td>
		      				<td data-toggle="modal" data-target="#couponDetail<%=i %>"><%=c.getMemberId()%></td>
		      			</tr>
		      		<% } %>
		      	<% } %>
		      </tbody>
		    </table>
		  </div>
		</div>
		
		<% for(int i=0; i<list.size(); i++){ 
		      				Coupon c = list.get(i); %>
		      
			<!-- 쿠폰 정보 조회 Modal -->
			<div class="modal fade" id="couponDetail<%=i %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      
			      <div class="modal-body">
			      	<br>
					<div id="couponHeader"><h5>쿠폰 정보</h5></div>	
					<hr>      	
			      	<table id="coupon-detail-table">
			      		<tr>
			      			<th>등록자</th>
			      			<td><%=c.getMemberId()%></td>
			      		</tr>
						<tr>
							<th>쿠폰명</th>
							<td><%=c.getCouponName()%></td>
						</tr>
						<tr>
							<th>발급조건</th>
							<% if(c.getCouponGive() == 1){ %>
								<td>회원가입축하쿠폰</td>
							<% }else if(c.getCouponGive() == 2){ %>
								<td>첫차량이용축하쿠폰</td>
							<% }else if(c.getCouponGive() == 3){ %>
								<td>차량3회이용감사쿠폰</td>
							<% } %>
						</tr>
						<tr>
							<th>쿠폰등록일</th>
							<td><%=c.getCouponCreateDate()%></td>
						</tr>
						<tr>
							<th>할인율</th>
							<td><%=c.getCouponDc()%> %</td>
						</tr>						
			      	</table>
			      </div>
			      
			      <div style="display:none;"></div>
			      
			      <div class="modal-footer">
			      	<button type="button" class="enrollBtn" data-toggle="modal" data-target="#couponUpdate<%=i%>">수정</button>
			        <button type="button" class="completeBtn" data-dismiss="modal">닫기</button>
			      </div>
			      
			    </div>
			  </div>
			</div>
		      				
		<%} %>
		
		<% for(int i=0; i<list.size(); i++){ 
	      				Coupon c = list.get(i); %>
		<!-- 쿠폰 정보 수정 Modal -->
		<form action="<%=contextPath%>/update.t.co" method="post">
			<div class="modal fade" id="couponUpdate<%=i%>" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      
			      <div class="modal-body">
			      	<br>
					<div id="couponHeader"><h5>쿠폰 정보</h5></div>	
					<hr>      	
			      	<table id="coupon-detail-table">
			      		<input type="hidden" name="couponNo" value="<%=c.getCouponNo()%>">
			      		<tr>
			      			<th>등록자</th>
			      			<td><%=c.getMemberId()%></td>
			      		</tr>
						<tr>
							<th>쿠폰명</th>
							<td><input type="text" class="tableIn" id="coupon-title" name="coupon-title" value="<%=c.getCouponName()%>"></td>
						</tr>
						<tr>
							<th>발급조건</th>
							<td>
								<select class="tableIn" name="couponV">
									<option>선택하세요</option>
									<option value="1">회원가입 축하 쿠폰</option>
									<option value="2">차량 첫 이용 쿠폰</option>
									<option value="3">차량 3회 이용 쿠폰</option>
								</select>						
							</td>
						</tr>
						<tr>
							<th>할인율</th>
							<td><input class="tableIn" type="text" name="couponDc" value="<%=c.getCouponDc()%>"> %</td>
						</tr>
						<tr>
							<th>등록일</th>
							<td><%=c.getCouponCreateDate()%></td>
						</tr>					
			      	</table>
			      </div>
			      
			      <div style="display:none;"></div>
			      
			      <div class="modal-footer">
			      	<button type="submit" class="enrollBtn">저장</button>
			        <button type="button" class="completeBtn" data-dismiss="modal">닫기</button>
			      </div>
			      
			      
			    </div>
			  </div>
			</div>
		
		</form>
		<% } %>
		
		<script>
			<!-- 전체 선택 스크립트 -->
		    function checkAll(){
		        if( $("#th_checkAll").is(':checked') ){
		            $("input[name=checkRow]").prop("checked", true);
		        }else{
		            $("input[name=checkRow]").prop("checked", false);
		        }
		    }
		    
		    $(function(){
		    	var deleteNo = 0;
		    	
		    	/* 체크하면 체크한 쿠폰번호 저장되는 부분 */
		    	$(".checkNo").click(function(){
		    		//console.log($(this).next().val());
		    		deleteNo = $(this).next().val();
		    	});
		    	
		    	/* 삭제로 넘기는 부분 */
		    	$(".deleteBtn").click(function(){
		    		if(confirm("정말로 삭제하시겠습니까?")){
		    			console.log(deleteNo);
		    			location.href = "<%=contextPath%>/deleteC.t.co?deleteNo="+deleteNo;
		    		}else{
		    			alert("삭제를 취소하셧습니다.")
		    		}
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
	                        <span class="label-icon">쿠폰명</span>
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
        	<!-- 맨 처음페이지 (<<) -->
        	<a href="<%=contextPath%>/list.t.co"> &lt;&lt; </a>
        	<!-- 이전 페이지 (<) -->
        	<a href="<%=contextPath%>/list.t.co?currentPage=<%=currentPage-1%>"> &lt; </a>
        	
        	<!-- 페이지 목록 -->
        	<% for(int p=startPage; p<=endPage; p++){ %>
        		<% if(currentPage == p){ %>
        			<li><a><%=p%></a></li>
        		<% }else { %>
        			<li><a href="<%=contextPath%>/list.t.co?currentPage=<%=p%>"><%=p%></a></li>
        		<% } %>
        	<% } %>
        
        	<!-- 다음 페이지 (>) -->
        	<a href="<%=contextPath%>/list.t.co?currentPage=<%=currentPage+1%>"> &gt; </a>
        	<!-- 맨 끝 페이지 (>>) -->
        	<a href="<%=contextPath%>/list.t.co?currentPage=<%=maxPage%>"> &gt;&gt; </a>
        </div>
		
	</div>

</body>
</html>