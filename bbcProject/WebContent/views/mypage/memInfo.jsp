
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import ="java.util.ArrayList"%>
 <%@page import="com.bbc.userInfo.model.vo.*"%>
 <%
 	ArrayList<UserInfo> list = (ArrayList<UserInfo>)request.getAttribute("info");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>

<style>

    .outer{
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}	

    .main-title{
		margin-top: 35px; 
		font-size: 20px;
		font-weight: 900;
	}	
	hr.garo{
		border: 1px solid #757272;
		margin: 17px 0px 0px 0px;
	}	
	tr{
		border:1px solid black;
		text-align:center;
	}
	th{
		border:1px solid black;	
		background-color: lightgray;
		font-size:15px;
		
	}
	td{
		text-align:center;
	
	}
	


</style>
</head>
<body>

    
    <%@ include file="../common/menubar.jsp" %>

    
        <div class="outer"> 
            <span class="main-title">회원 정보 </span> 
            <hr class="garo">
	
	<form>
	
	 <table style="border:1px solid lightgray; margin-top:17px; width:60%; height:70px;">				  
							    <tbody>
	 	<% if( list != null){ %>
					<% for(UserInfo u : list){ %>
					<tr>
					
							      <tr>
								       	<th scope="row"><strong>아이디</strong></th>
										<td> <%= u.getMemberId() %></td>
							      </tr>
							      <tr>
							       <tr>
								       	<th scope="row"><strong>이름</strong></th>
										<td> <%= u.getMemberName() %></td>
							      </tr>
							      <tr>
							       <tr>
								       	<th scope="row"><strong>이메일</strong></th>
										<td> <%=u.getMemberEmail() %></td>
							      </tr>
							      <tr>
							       <tr>
								       	<th scope="row"><strong>연락처</strong></th>
										<td> <%= u.getPhone() %></td>
							      </tr>
							      <tr>
							       <tr>
								       	<th scope="row"><strong>주소</strong></th>
										<td> <%= u.getMemberZipcode() %></td>
							      </tr>
							      <tr>

					</tr>
					<% } %>
				<% } %> 
							    </tbody>
							</table>
	
	
	  <button  onclick="goEdit();" style="background:#ffc107; lightgray;color:white;font-weight:bold;width: 100px;height: 40px;border-radius: 4px;float:right;text-align:center;margin-top: 5%;margin-right: 50%;margin-left: -40;margin-left: -41;">수정</button>
		<button  type="submit" style="background: lightgray;color:white;font-weight:bold;width: 100px;height: 40px;border-radius: 4px;float:right;text-align:center;margin-top: 5%;margin-right: -25%;margin-left: 0px;">회원 탈퇴</button>
	</form>
    
   
    </div>

   
</body>

<script>
	function goEdit(){
		location.href="<%=request.getContextPath()%>/change.ui";
	}
</script>
</html>