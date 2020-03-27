<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.notice.model.vo.Notice, java.util.ArrayList" %>
<%
	Notice n = (Notice)request.getAttribute("n");
	int no = (int)request.getAttribute("no");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#header-line-bottom{
		width: 70%;
	    margin-left: 5.5rem;
	}
	#notice-content-title{
		float: left;
		margin-left: 6.5rem;
		font-weight:bold;
	}
	.btnArea{
	    text-align: end;
	    margin-left: 9.5rem;
	    width: 65%;
	}
	.enrollBtn, #view-list, .modal-enrollBtn{
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
	#notice-body{
		float: left;
		margin-left: 8rem;
	}
	#outer>#notice-table-btn>table, tr, td, th{border: 1px solid rgba(0, 0, 0, 0.1);}
	#notice-list-small>td{border: 1px solid black;}
	#notice-table-btn{
		position: relative;
	    left: 18%;
	    width: 755px;
	}
	span#writer {
	    float: left;
	    margin-left: 7rem;
	}
	span#write-date {
	    float: right;
	    margin-right: 27rem;
	}
	span#read_count {
	    float: right;
	    margin-right: 27rem;
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
	.modal-body{padding:0px !important;}
	.modal-footer {padding-left: 215px !important;}
	div#modal-size{
		height: 500px !important;
	}
	
	
	/* 파일 첨부 영역 */
	#file-title{
		margin-left: 6rem;
		text-align: left;
	}
	table#file-table {
	    margin-left: 6rem;
	}
	span#fileName1 {
	    float: left;
	    margin-left: 9rem;
	}
	span.fileName {
	    float: left;
	    margin-left: 20px;
	}
	h5#modal-top-title {
	    text-align: left;
	    margin-top: 20px;
	    margin-left: 20px;
	}
</style>
</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 공지사항 상세정보 보는 페이지 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1 id="notice-title">공지사항</h1>
		</div>
		<hr id="header-line">
		<br>
		<h5 id="notice-content-title"><%=n.getNoticeTitle()%></h5>
		<span id="read_count">조회수 : <%=n.getNoticeReadCnt() %></span><br>
		<span id="read_count">
			<% if(n.getNoticeImport() == 1) { %>
				중요 /
			<% }else { %>
				일반 /
			<% } %>
			<% if(n.getNoticeField() == 1){ %>
				 지점
			<% }else { %>
				 사용자
			<% } %>
		</span>
		<br>
		<hr id="header-line-bottom">
		
		<span id="writer">작성자 : <%=n.getMemberName()%></span>
		<span id="write-date">작성일자 : <%=n.getEnrollDate()%></span>
		<br>
		<hr id="header-line-bottom">
		
		<div class="btnArea">
	        
	        <form action="uDelete.t.no" method="post">
		        <button class="enrollBtn" data-toggle="modal" data-target="#myModal">수정</button>
	        	<input type="hidden" name="noticeNo" value="<%=no%>">
		        <button type="submit" class="deleteBtn" onclick="deleteNotice();">삭제</button>
	        </form>
       	</div>
       	
		<pre id="notice-body"><%=n.getNoticeContent()%></pre>
		
		<br><br>
		<hr id="header-line">
		<p id="file-title">첨부파일</p>
		<span id="fileName1"><%=n.getRename() %></span>
		<span class="fileName">123</span>
		<span class="fileName">456</span>
	
		<br><br>
		
		<div id="notice-table-btn">
			<!-- 이전글, 다음글 영역 -->
			<table id="notice-list-small" style="border: 1px solid rgba(0, 0, 0, 0.1);">
				<tr>
					<td width="150">이전글</td>
					<td width="400">공지사항 0번 글</td>
					<td width="200">2019-12-25</td>
				</tr>
				<tr>
					<th>-</th>
					<th>공지사항 1번 글</th>
					<th>2020-01-01</th>
				</tr>
				<tr>
					<td>다음글</td>
					<td>공지사항 2번 글</td>
					<td>2020-03-01</td>
				</tr>
			</table>
			<br>
			<button type="button" id="view-list" onclick="goList();">목록</button>
		</div>
		
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content" id="modal-size">
				<div class="modal-title">
					<h5 id="modal-top-title">공지사항 수정</h5>
					<hr>
				</div>
				<form action="<%=contextPath%>/uUpdate.t.no" method="post">
					<div class="modal-body">
					  <input type="hidden" name="noticeNo" value="<%=no%>">
					  <input type="hidden" name="noticeDate" value="<%=n.getEnrollDate()%>">
				      <table id="modal-body-table">
			      		<tr>
			      			<th style="width:100px;">제목</th>
			      			<td><textarea id="q-title" name="q-title"><%=n.getNoticeTitle()%></textarea></td>
			      		</tr>
			      		<tr>
			      			<th>중요</th>
			      			<td>
			      				<% if(n.getNoticeImport() == 1){ %>
					      			<input type="checkbox" id="importCheck" name="importCheck" value="1" checked> 중요공지사항			      					
			      				<% }else { %>
			      					<input type="checkbox" id="importCheck" name="importCheck" value="0"> 중요공지사항
			      				<% } %>
			      			</td>
			      		</tr>
			      		<tr>
			      			<th>분류</th>
			      			<td>
			      				<% if(n.getNoticeField() == 0){ %>
					      			<input type="radio" id="userN" name="noticeV" value="1" checked>
					      			<label for="userN">사용자</label> 
					      			
					      			&nbsp;&nbsp; 
					      			
					      			<input type="radio" id="branchN" name="noticeV" value="2"> 
					      			<label for="branchN">지점</label>
			      				<% }else { %>
					      			<input type="radio" id="userN" name="noticeV" value="1"> 
					      			<label for="userN">사용자</label> 
					      			
					      			&nbsp;&nbsp; 
					      			
					      			<input type="radio" id="branchN" name="noticeV" value="2" checked> 
					      			<label for="branchN">지점</label>			      				
			      				<% } %>	
			      			</td>
			      		</tr>
			      		<tr>
			      			<th>내용</th>
			      			<td><textarea id="q-content" name="q-content"><%=n.getNoticeContent()%></textarea></td>
			      		</tr>
			      		<tr>
			      			<th>첨부파일</th>
			      			<td align="left"><label id="noticeImg1" for="file1"><%=n.getRename()%></label></td>
			      		</tr>
				      </table>
				      <div id="file-area">
		      			  <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
				      </div>
			      </div>
			      
			      <div style="display:none;"></div>
			      
			      <div class="modal-footer">
			        <button type="submit" class="modal-enrollBtn">수정</button>
			        <button type="button" class="deleteBtn" data-dismiss="modal">취소</button>
			      </div>
			  </form>
		    </div>
		</div>
	</div>
	<script>
		function goList(){
			location.href="<%=contextPath%>/uList.t.no";
		}
		
		/* 파일 첨부 영역 */
		$("#file-area").hide();
		
		$("#noticeImg1").click(function(){
			$("#file1").click();
		});	
		
		/* 중요 공지사항 체크값 script */
		$(function(){
			$("#importCheck").on("click", function(){
				if($("#importCheck").val() == "0"){
					$("#importCheck").val(1);
				}else{
					$("#importCheck").val(0);
				}
			});
		});
		
		function loadImg(inputFile, num){
			if(inputFile.files.length == 1){
				
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e){
					switch(num){
					case 1: $("#noticeImg1").attr("src", e.target.result); break;
					case 1: $("#noticeImg2").attr("src", e.target.result); break;
					case 1: $("#noticeImg3").attr("src", e.target.result); break;
					}
				}
			}
		}
		
	</script>

</body>
</html>