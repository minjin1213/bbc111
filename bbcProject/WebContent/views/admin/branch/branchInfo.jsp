<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.branchmanagement.model.vo.BranchManagement" %>
<%
	BranchManagement b = (BranchManagement)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#info-table{
		margin-left: 8rem;
		text-align: left;
	}
	#info-table th{
		height: 50px;
		width: 150px;	
	}
	#inof-content {
	    margin-left: 9.5rem;
	    width: 50%;
	    height: 22%;
	    resize: none;
	    border-radius: 10px;
	    display: flex;
	}
	#infomation-area{
		display: flex;
	    resize: none;
	    margin-left: 9.5rem;
	    margin-top: 3px;
	    width: 50%;
	    height: 30%;
	    border-radius: 10px;
	}
	button#infoBtn {
	    margin-top: 24px;
	    margin-left: 32%;
	    position: relative;
	    display: flex;
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    width: 80px;
	    height: 35px;
	    justify-content: center;
	}

</style>

</head>
<body>
	<%@ include file="../common/adminBase.jsp" %>
	
	<!-- 지점등록 상세 정보 페이지 시작 -->
	<div class="outer">
		
		<div class="faq-header">
			<h1>지점등록</h1>
		</div>
		<hr id="header-line">
		<br>
		
		<table id="info-table">
			<tr>
				<th><li>지역</li></th>
				<td><%=b.getAreaName()%></td>
			</tr>
			<tr>
				<th><li>지점</li></th>
				<td><%=b.getBranchName()%></td>
			</tr>
			<tr>
				<th><li>주소</li></th>
				<td><%=b.getBranchAddress()%></td>
			</tr>
			<tr>
				<th><li>전화번호</li></th>
				<td><%=b.getBranchPhone()%></td>
			</tr>
			<tr>
				<th><li>영업시간</li></th>
				<td><%=b.getBranchHrs()%></td>
			</tr>
			<tr>
				<th><li>교통안내</li></th>
				<td><%=b.getBranchDir()%></td>
			</tr>
			<tr><th><li>지도</li></th></tr>
		</table>
		
		
		<br>
		
		<textarea id="infomation-area" placeholder="지도영역"></textarea>
		
		<button type="button" id="infoBtn" onclick="goBranchView();">목록으로</button>
	</div>
	<script>
		function goBranchView(){
			window.history.back();
		}
	</script>
</body>
</html>