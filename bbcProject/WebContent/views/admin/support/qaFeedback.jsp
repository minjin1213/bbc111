<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.myinquiry.model.vo.MyInquiry" %>
<%
	MyInquiry m = (MyInquiry)request.getAttribute("m");
	int iNo = (int)request.getAttribute("iNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#qa-table{
		margin-left: 8rem;
		text-align: left;
	}
	#qa-table th{
		height: 50px;
		width: 130px;	
	}
	#qa-table td{padding-right: 40px;}
	#qa-content {
	    margin-left: 9.5rem;
	    width: 50%;
	    height: 22%;
	    resize: none;
	    border-radius: 10px;
	    display: flex;
	}
	#feedback-area{
		display: flex;
	    resize: none;
	    margin-left: 9.5rem;
	    margin-top: 3px;
	    width: 50%;
	    height: 100px;
	    border-radius: 10px;
	}
	button#feedbackBtn {
        margin-top: 24px;
	    margin-left: -29%;
	    position: relative;
	    /* display: flex; */
	    border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: orange;
	    color: white;
	    /* width: 80px; */
	    height: 35px;
	    justify-content: center;
	}
	button#backList{
		border-radius: 5px;
	    outline: 0;
	    border: 0;
	    background-color: rgba(90, 92, 105, 0.5);
	    color: white;
	    width: 80px;
	    height: 35px;
	    margin-bottom: 0.75rem;
	}

</style>

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
		
		<table id="qa-table">
			<tr>
				<th><li>이름</li></th>
				<td><%=m.getMemberName()%></td>
				<th><li>작성일자</li></th>
				<td><%=m.getInquiryDate()%></td>
			</tr>
			<tr>
				<th><li>이메일</li></th>
				<td><%=m.getMemberEmail()%></td>
				<th><li>처리상태</li></th>
				<td><%=m.getInquiryStatus()%></td>
			</tr>
			<tr>
				<th><li>휴대전화</li></th>
				<td><%=m.getPhone()%></td>
			</tr>
			<tr>
				<th><li>제목</li></th>
				<td><%=m.getInquiryTitle()%></td>
			</tr>
			<tr>
				<th><li>내용</li></th>
			</tr>
		</table>
		<textarea id="qa-content" readonly><%=m.getInquiryContent()%></textarea>
		
		<table id="qa-table">
			<tr>
				<th><li>답변</li></th>
				<td width="230px"></td>
				<th><li>답변일자</li></th>
				<td><%=m.getInquiryAnswerDate()%></td>
			</tr>
		</table>
		<form action="<%=contextPath%>/update.t.mi" method="post"> 
			<textarea id="feedback-area" name="answer"><%=m.getInquiryAnswer()%></textarea>
			<input type="hidden" name="no" value="<%=iNo%>">
			<div>
				<button type="submit" id="feedbackBtn">답변하기</button>
				<button type="submit" id="backList" onclick="backList();">목록으로</button>			
			</div>
		</form>
	</div>
	<script>		
		function answer(){
			location.href="<%=contextPath%>/update.t.mi?iNo="+iNo;
		}
		
		function backList(){
			location.href = "<%=contextPath%>/detail.t.mi";
		}
	</script>
</body>
</html>