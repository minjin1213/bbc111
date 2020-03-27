<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.notice.model.vo.Notice, java.util.ArrayList,
				 com.bbc.common.page.vo.PageInfo" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String deleteCom = (String)session.getAttribute("deleteCom");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table{margin-left: 1rem;}
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
	    margin-left: 3.5rem;
	    width: 1110px;
	}
	
	/* 민진 한테 받은 search 스타일 부분 */
	.navbar-form {
	  margin-top: 3rem;
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
	button.faqAdd {
	    position: relative;
	    left: 20%;
	}
	.faq-dialog {
	    max-width: 500px;
	    margin: 1.75rem auto;
	}
	#q-content, #q-title{resize: none}
	.modal-dialog {
	    max-width: 700px !important;
        margin: 17rem 37rem !important;
	}
	.modal-content{height: 460px !important;}
	textarea#q-title {
	    width: 500px;
	    height: 40px;
	    border-radius: 10px;
	}
	textarea#q-content{
		width: 500px;
		height: 200px;
		border-radius: 10px;
	}
	.modal-footer {display: table-cell !important;}
	div#noticeHeader {
	    text-align: left;
	    margin: 0 0 20px 20px;
	}
	#noticeHeader{
		text-align: left;
	    margin: 0 0 20px 20px;
	}
	button.completeBtn {
	    position: relative;
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
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
	
</style>
</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	<script>
		
		
		$(function(){
			var deleteCom = "<%=deleteCom%>";
			
			if(deleteCom != "null"){
				alert(deleteCom);
				// 세션에 담긴 메세지 한번만 출력하고 삭제하기
				<% session.removeAttribute("deleteCom"); %>
			}
		});
	</script>
	
	<!-- 공지사항 리스트 보여주는 페이지 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>공지사항</h1>
		</div>
		<hr id="header-line">
		<br>
		
		<!-- Button trigger modal -->
		<div class="btnList">
	        <button class="enrollBtn" onclick="addNotice();">등록</button>
        </div>
		
        <div class="tab-content">
          <div id="home" class="container tab-pane active"><br>
            
            <form action="<%=contextPath%>/">
	            <table id="notice-table" class="table table-bordered" width="100%" cellspacing="0">
	              <thead>
	                <tr>
	                    <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"></th>
	                    <th>번호</th>
	                    <th>제목</th>
	                    <th>글쓴이</th>
	                    <th>등록일</th>
	                    <th>조회수</th>
	                </tr>
	              </thead>
	              
	              <tbody>
	              	<% if(list != null){ %>
		              	<% for(Notice n : list){ %>
		              			<tr class="detail">
		              				<th><input type="checkbox" class="deleteCheck" name="checkRow" value="${content.IDX}"></th>
		              				<td><%=n.getNoticeNo()%></td>
		              				<td><%=n.getNoticeTitle()%></td>
		              				<td><%=n.getMemberName()%></td>
		              				<td><%=n.getModifyDate()%></td>
		              				<td><%=n.getNoticeReadCnt()%></td>
		              			</tr>
		              	<% } %>
	              	<% }else { %>
	              		<tr>
	              			<td colspan="6">등록된 공지사항이 없습니다.</td>
	              		</tr>
	              	<% } %>
	              
	    
	              </tbody>
	            </table>
            </form>
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
            };
            /* 공지사항 상세정보로 넘어가기 위한 script */
            $(function(){
            	$("td").click(function(){
            		var no = $(this).siblings().eq(1).text();
            		//console.log(no);	
            		location.href = "<%=contextPath%>/uDetail.t.no?no="+no;
            	});
            });
            /* 공지사항 삭제를 위한 script */
            $(function(){
            	$("tr>th").click(function(){
            		var deleteNo = $(this).siblings().eq(1).text();
            		cosole.log(deleteNo);
            	});
            });
            
			function addNotice(){
				location.href = "<%=contextPath%>/uAddNoticePage.t.no";
			};
            
            

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
            <a href="<%=contextPath%>/list.t.mi"> &lt;&lt; </a>
            <!-- 이전 페이지(<) -->
            <a href="<%=contextPath%>/list.t.mi?currentPage=<%=currentPage-1%>"> &lt; </a>
           	
           	<!-- 페이지 목록 -->       
            <% for(int p=startPage; p<=endPage; p++){ %>
            	<% if(currentPage == p){ %>
            		<li><a><%=p%></a>
            	<% }else { %>
            		<li><a href="<%=contextPath%>/list.t.bo?currentPage=<%=p%>"><%=p%></a>
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