<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.myinquiry.model.vo.MyInquiry,
				 com.bbc.common.page.vo.PageInfo" %>
<%
	ArrayList<MyInquiry> list = (ArrayList<MyInquiry>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String updateC = (String)request.getAttribute("updateC");
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
	
	/* 테이블 클릭, hover 스타일 */
	.home>tbody>tr:hover{
		cursor: pointer !important;
		background: darkgray !important;
		
	}

	
</style>
<!-- 문의내역 답변 성공 메세지 출력 -->
<script>
	var updateC = "<%=updateC%>";
	
	$(function(){
		if(updateC != "null"){
			alert(updateC);
		}
	});

</script>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 문의내역 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>문의내역</h1>
		</div>
		<hr id="header-line">
		<br>
		
        <div class="tab-content">
          <div id="home" class="container tab-pane active"><br>
            
            <table id="notice-table" class="table table-bordered" width="100%" cellspacing="0">
              <thead>
                <tr>
                    <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>등록일</th>
                    <th>처리상태</th>
                </tr>
              </thead>
              <tbody>
              	<% if(list.isEmpty()){ %>
              		<tr>
              			<td colspan="6">조회된 리스트가 없습니다</td>
              		</tr>
              	<% }else{ %>
              		<% for(MyInquiry i : list){ %>
              			<tr class="detail">
              				<td><input type="checkbox" class="nonechk" name="checkRow"></td>
              				<td><%= i.getInquiryNo() %></td>
              				<td><%= i.getInquiryTitle() %></td>
              				<td><%= i.getMemberName() %></td>
              				<td><%= i.getInquiryDate() %></td>
              				<td><%= i.getInquiryStatus() %></td>
              			</tr>
              		<% } %>
              	<% } %>
              </tbody>
            </table>
		</div>
	</div>
            
	<!-- 전체 선택 스크립트 -->
	<script>
	    function checkAll(){
	        if( $("#th_checkAll").is(':checked') ){
	            $("input[name=checkRow]").prop("checked", true);
	        }else{
	            $("input[name=checkRow]").prop("checked", false);
	        }
	    }
	    
	    $(function(){
	    	$(".detail").click(function(){
	    		var iNo = $(this).children().eq(1).text();
	    		//console.log(iNo);
	    		
	    		location.href = "<%=contextPath%>/detail.t.mi?iNo=" + iNo;
	    	});
	    });
	    
	    

	</script>
            
            
	<!-- search form -->
	<form class="navbar-form navbar-search" role="search">
	    <div class="input-group">
	    
	        <div class="input-group-btn">
	            <button type="button" class="btn btn-search btn-default dropdown-toggle" data-toggle="dropdown">
	                <span class="glyphicon glyphicon-search"></span>
	                <span class="label-icon" value="none">전체</span>
	                <span class="caret"></span>
	            </button>
	            <ul class="dropdown-menu pull-left" role="menu">
	              <li>
	                <a href="#">
	                    <span class="glyphicon glyphicon-user"></span>
	                    <span class="label-icon" value="num">번호</span>
	                </a>
	              </li>
	               <li>
	                    <a href="#">
	                        <span class="glyphicon glyphicon-user"></span>
	                        <span class="label-icon" value="name">이름</span>
	                    </a>
	                </li>
	                <li>
	                    <a href="#">
	                    <span class="glyphicon glyphicon-book"></span>
	                    <span class="label-icon" value="status">처리상태</span>
	                    </a>
	                </li>
	            </ul>
	        </div>
			
	        <input type="text" class="form-control" name="search">
	    
	        <div class="input-group-btn">
	            <button type="button" class="btn btn-search btn-default" id="searching">검색</button> 
	        </div>
	    </div>  
	</form>   

        <div class="pagination">
        	<!-- 맨 처음으로 이동(<<) -->
            <a href="<%=contextPath%>/list.t.mi"> &lt;&lt; </a>
            <!-- 이전 페이지(<) -->
            <a href="<%=contextPath%>/list.t.mi?currentPage=<%=currentPage-1%>"> &lt; </a>
           	
           	<!-- 페이지 목록 -->       
            <% for(int p=startPage; p<=endPage; p++){ %>
            	<% if(currentPage == p){ %>
            		<li><a><%=p%></a>
            	<% }else { %>
            		<li><a href="<%=contextPath%>/list.t.mi?currentPage=<%=p%>"><%=p%></a>
            	<% } %>
            <% } %>
            
            <!-- 다음 페이지(>) -->
            <a href="<%=contextPath%>/list.t.mi?currentPage=<%=currentPage+1%>"> &gt; </a>
            <!-- 맨 끝으로 이동(>>) -->
            <a href="<%=contextPath%>/list.t.mi?currentPage=<%=maxPage%>"> &gt;&gt; </a>
        </div>
		
	</div>

</body>
</html>