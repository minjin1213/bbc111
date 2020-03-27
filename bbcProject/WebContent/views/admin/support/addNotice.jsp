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
        margin-top: 52px;
	}
	#notice-content-title{
		float: left;
		margin-left: 6.5rem;
		font-weight:bold;
	}
	#add-table{
		text-align:left;
		margin-left: 8%;
		border-collapse: separate;
  		border-spacing: 10px 15px;
	}
	input#notice-title {
		width: 250%;
		border-radius: 10px;	
	}
	textarea#notice-content{
    	width: 216%;
	    height: 240px;
	    resize: none;
	    border-radius: 10px;
	}
	div#btn-area {
	    margin-top: 30px;
	    width: 77%;
	}
	#enrollBtn{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}
	
	.lab{margin-bottom:0px !important; }
	
</style>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 공지사항 등록페이지 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1 id="notice-title">공지사항</h1>
		</div>
		<hr id="header-line">
		<h5 id="notice-content-title">공지사항 등록</h5>
		<hr id="header-line-bottom">
		<br>
		
		<form action="<%=contextPath%>/uAddNoitce.t.no" enctype="multipart/form-data" method="post">
			<!-- 로그인 유저 번호 뽑아와야함 -->
			<input type="hidden" name="memNo" value="1">
			<table id="add-table">
				<tr>
					<th><li>분류</li></th>
					<td>
						<input type="radio" id="userN" name="noticeV" value="1">
						<label for="userN" class="lab"> &nbsp;사용자</label>&nbsp;&nbsp;&nbsp;
						<input type="radio" id="branchN" name="noticeV" value="2">
						<label for="branchN" class="lab"> &nbsp;지점</label>
					</td>
				</tr>
				<tr>
					<th><li>중요공지</li></th>
					<td>
						<input type="checkbox" id="importCheck" name="importCheck" value="0">
					</td>
				</tr>
				<tr>
					<th><li>제목</li></th>
					<td>
						<input type="text" id="notice-title" name="notice-title">
					</td>
				</tr>
				<tr>
					<th><li>파일첨부</li></th>
					<td>
						<input type="file" id="notice-file" name="notice-file">
					</td>
				</tr>
				<tr>
					<th><li>내용</li></th>
					<td>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<textarea id="notice-content" name="notice-content"></textarea>
					</th>
				</tr>
			</table>
			<div id="btn-area">
				<button type="submit" id="enrollBtn">등록하기</button>
			</div>
		</form>
		
		
	</div>
	<script>
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
		
	</script>
		
</body>
</html>