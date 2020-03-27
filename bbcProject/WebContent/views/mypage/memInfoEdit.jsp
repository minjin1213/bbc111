<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="java.util.ArrayList"%>
 <%@page import="com.bbc.userInfo.model.vo.*"%>
 <%
 	UserInfo mem = (UserInfo)request.getAttribute("mem");
 	
 	String userId = mem.getMemberId();
 	String userPwd = mem.getMemberPwd();
 	String userName = mem.getMemberName();
 	String phone = (mem.getPhone() != null) ? mem.getPhone() : "";
 	String email = (mem.getMemberEmail() != null) ? mem.getMemberEmail() : "";
 	String address = (mem.getMemberAddress() != null) ? mem.getMemberEmail() : "";
 	String detailAddress = (mem.getMemberZipcode() != null ) ? mem.getMemberZipcode(): ""; 	
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원정보 수정</title>
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
	
		
	form {                                         
	   	
	    width: 860px; 
	}
	.str{
	    color:red;
	    font-size: 10px;
	}
	form input{
	      display: inline-block;
		    width: 300px;
		    height: 30px;
		    border-radius: 4px;
		    vertical-align: middle;
		    border: 1px solid #bbb;
		    box-sizing: border-box;
		    font-size: 14px;
		    color: #757272;
		    margin-left:10px;
		    padding: 0px 10px;
	}
	    
	.search{
	        background: #ffc107;
	        color:white;
	        font-weight:bold;
	        width: 80px;
	        height: 30px;
	        border-radius: 4px;
	        margin-top: 60px;
	        text-align:center;
	     
	        font-size: 15px;
	    }
	b{
		color:black;
	}
	
</style>
</head>
<body>

  <%@ include file="../common/menubar.jsp" %>

        <div class="outer"> 
            <span class="main-title">회원정보 수정</span>
            <hr class="garo">
		
		<p style="margin-top:15px;color:black;"><strong> 회원정보입력</strong> &nbsp;<b class="str">*는 필수 입력항목입니다</b></p>

<hr>          
<form name="RegForm" action="<%= request.getContextPath()%>/change.ui" onsubmit="return validate();" method="post">  
      
    <p><b class="str">* &nbsp;</b><b>성별:</b><b style="color:black;margin-left:5px;"> 남 </b> <input type="radio" name="gender" value="M" style="width:20px;"><b style="color:black;"> 여</b><input type="radio" name="gender" value="F" style="width:20px;color:black;"> </p> 
    <hr>      
    <p><b class="str">* &nbsp;</b><b>이름:</b> <input type="text" size=35 name="Name" id="name" required> </p> 
    <hr>
    <p><b class="str">* &nbsp;</b><b>아이디:</b> <input type="text" size=33 name="userId" id="userID" style="width: 286px;" required>  </p>
    <hr>
    <p><b class="str">* &nbsp;</b><b>비밀번호:</b> <input type="password" size=31 name="Password" id="userPass" style="width: 327px;" required> </p>
    <hr>
    <p><b class="str">* &nbsp;</b><b>비밀번호 확인:</b><input type="password" size=27 name="veriPassword" id="userPassC" required> </p>
    <hr>
    <p><b class="str">* &nbsp;</b><b>이메일:</b><input type="text" size=27 name="userEmail" id="userEmail" style="width: 350px;" required> </p>
    <hr>
    <p> <b class="str">* &nbsp;</b><b>휴대폰번호</b><input type="text" size=27 name="Phone" id="Phone"  placeholder="xxx-xxxx-xxxx" style="width: 325px;" required></p>
   	<hr>
    <p> <b class="str">* &nbsp;</b><b>주민번호:</b><input type="text" size=27 name="RRN" id="RRN"  placeholder="xxxxxx-xxxxxxx" style="width: 332px;" required></p>
    <hr>
    <p><b class="str">* &nbsp;</b><b>주소:</b>    
        <input type="text" size=63  name="address" id="address" style="margin-left: 7px; margin-top:5px;" placeholder="주소"><br>
        <input type="text" size=63  name="detailAddress" id="detailAddress" style="margin-left:60px; margin-top:5px;" placeholder="상세주소"> </p>   
           

    <p>
    <center><input type="submit" value="등록" name="Submit" class="search" >  </center>  
    </p>          
</form> 
		</div>
<script type="text/javascript">

function validate()                                    
{ 
	var checkIP = /^[a-zA-Z0-9]{4,12}$/; //ID와 PASSWORD 유효성 검사 정규식
    var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;  //Email 유효성 검사 정규식
    var checkPN =/^[0-9]{13}$/;
	var checkPhone =/^\(?([0-9]{3})\)?[-. ]?([0-9]{4})[-. ]?([0-9]{4})$/;
    
    var userID = document.getElementById("userID");  //ID
    var userPass = document.getElementById("userPass");  //PASSWORD
    var userPassC = document.getElementById("userPassC");  //PASSWORD CHECKING
    var userEmail = document.getElementById("userEmail");  //EMAIL
    var name = document.getElementById("name");  //NAME
	var address = document.getElementById("address");
    var detailAddress = document.getElementById("detailAddress");
	var phone = document.getElementById("Phone");
    var rrn = document.getElementById("RRN");
    if(name.value==''){
        alert("이름을 입력하세요");
        name.focus();
        return false;
     }
    if(rrn.value==''){
        alert("주민등록번호를 입력하세요");
        rrn.focus();
        return false;
     }
    //ID 유효성검사
    if(userID.value==''){
       alert("아이디를 입력하세요");
       userId.focus();
       return false;
    }
    if(!checkIP.test(userID.value)) {
      alert("아이디:4~12자리 알파벳과 숫자를 입력하세요");
      	userID.focus();
        return false;
    }

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

    //EMAIL 유효성검사
    if(userEmail.value==''){
     alert("이메일을 입력하세요.");
     userEmail.focus();
     return false;
    }
    if(!checkEmail.test(userEmail.value)){
      alert("올바른 이메일 주소를 입력하세요.");
      userEmail.focus();
      return false;
    }
    //전화번호 유효성 검사 
    if(!checkPhone.test(phone.value)){
    	alert("xxx-xxx-xxxx로 입력해주세요");
    	phone.focus();
    	return false;
    }

     if(address.value==''){
         alert("주소를 입력하세요");
         address.focus();
         return false;
     }
     if(detailaddress.value==''){
         alert("상세주소를 입력하세요");
         detailaddress.focus();
         return false;
     }
    
     window.alert("성공하였습니다.");
     location.href="<%=request.getContextPath()%>";
     
     return true;

    } 
   	

</script>


 
</body>
</html>