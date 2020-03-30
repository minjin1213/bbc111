<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="com.bbc.userInfo.model.vo.UserInfo"%>
<%
	UserInfo id = (UserInfo)request.getAttribute("findpw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

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
	
	table{
		margin-top: 17px;
		border: 1px solid black;
		width: 70%;
		height: 50%;'
	
	}


</style>
</head>
<body>

    
    <%@ include file="../common/menubar.jsp" %>

    
        <div class="outer"> 
            <span class="main-title">비밀번호 변경</span> 
            <hr class="garo">

	<form action="<%= request.getContextPath() %>/updatepw.ui" onsubmit="return validate();" method="post" >
	
	 <input type="hidden" name="id" value="<%=id.getMemberId()%>">
		<table>
		<tr>
			<td style="padding-left: 20px;padding-top: 20px;padding-right: 10px;">
			    비밀번호는 대문자,소문자,숫자,특수문자 중 2종류 이상을 조합하여 최소 10자리 이상 또는
    3종류 이상을 조합하여 최소 8자리 이상만 사용할 수 있습니다.
			</td>	
		</tr>
		<tr>
			<td style="padding-left: 20px;padding-bottom:20px;padding-top: 30px;">
			<b>새 비밀번호:</b> <input type="password" name = "newpw" id="userPass">
			</td>
		</tr> 
		<tr style="padding-top:15px">
			<td style="padding-left: 20px;padding-bottom:20px;">
			<b>비밀번호 확인:</b> <input type="password" id="userPassC">
			</td>
		</tr>
		</table>

 
    <button id="myBtn" type="Submit" style="background: #ffc107; color:white; font-weight:bold; width: 100px; height: 40px; border-radius: 4px; float:right; text-align:center; margin-top: 250px; margin-right: 380px;">다음</button>
	</form>
    </div>


<script>


</script>

<script type="text/javascript">
function validate() {
	
	var checkIP = /^[a-zA-Z0-9]{4,12}$/; //ID와 PASSWORD 유효성 검사 정규식
	
    var userPass = document.getElementById("userPass");  //PASSWORD
    var userPassC = document.getElementById("userPassC");  //PASSWORD CHECKING
	console.log(userPass);
    console.log(userPassC)

    //PASSWORD 유효성검사
    if(userPass.value==''){
       alert("비밀번호를 입력하세요.");
       userPass.focus();
       return false;
    }
    if(!checkIP.test(userPass.value)){
      alert("비밀번호:4~12자리 알파벳과 숫자를 입력하세요");
      userPass.focus();
      return false;
    }
    if(userPass.value!=userPassC.value){
      alert("비밀번호가 일치하지 않습니다.");
      userPassC.focus();
      return false;
    }

    
     window.alert("성공하였습니다.");
     
     return true;

    } 
  </script>
</body>

</html>