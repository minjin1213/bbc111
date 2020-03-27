<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    bottom: -25%;
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
</style>
</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 공지사항 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1 id="notice-title">공지사항</h1>
		</div>
		<hr id="header-line">
		<br>
		<h5 id="notice-content-title">공지사항 1번 제목</h5>
		<br>
		<br>
		<hr id="header-line-bottom">
		<span id="writer">작성자 : 관리자</span>
		<span id="write-date">작성일자 : 2020-01-01</span>
		<br>
		<hr id="header-line-bottom">
		
		<div class="btnArea">
	        <button class="enrollBtn" data-toggle="modal" data-target="#myModal">수정</button>
	        <button class="deleteBtn" onclick="deleteAl();">삭제</button>
       	</div>
       	
		<pre id="notice-body">공지사항 1번 글 내용 부분</pre>
		
		<br><br><br><br>
		
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
	    	<div class="modal-content">
		      
				<div class="modal-body">
		      	<br>
		      
			      	<table>
			      		<tr>
			      			<th style="width:100px;">제목</th>
			      			<td><textarea id="q-title" name="q-title"></textarea>
			      		</tr>
			      		<tr>
			      			<td><br></td>
			      		</tr>
			      		<tr>
			      			<td>내용</td>
			      			<td><textarea id="q-content" name="q-content"></textarea></td>
			      		</tr>
			      	</table>
		      </div>
		      
		      <div style="display:none;"></div>
		      
		      <div class="modal-footer">
		        <button type="button" class="modal-enrollBtn" onclick="comBtn();">확인</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		</div>
	</div>
	<script>
		function goList(){
			location.href="branchNotice.jsp";
		}
		
		function deleteAl(){
			alert("글을 삭제하시겠습니까?");
		}
		function comBtn(){
			alert("수정이 완료되었습니다.");
			location.href="noticeView.jsp";
		}
	</script>

</body>
</html>