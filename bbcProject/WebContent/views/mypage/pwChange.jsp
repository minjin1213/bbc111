<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

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
	
	
.all{
    border: 1px solid lightgray;
    height: 130px;
    margin-left: 20px;
    width:60%;
    display: none;
    background-color: lightgray;
    padding-top:17px;
    padding-left:40px;
}



#hw{
    width:150px;
    height:15px;
    margin-bottom: 10px;
}
p{
	font-color:black;
}	
 #fnt{
 	font-size:20px;
	color:black;
	padding-left:10px;
}
</style>
</head>
<body>

    
    <%@ include file="../common/menubar.jsp" %>

    
        <div class="outer"> 
            <span class="main-title">비밀번호 찾기</span>
            <hr class="garo">

	<form method="post" action="<%= request.getContextPath()%>/findpw2.ui">
      <p style="margin-top: 17px;">
     
        <table>

        <tr>
        <td>
            <b style="margin-top: 10px;">이름</b> <input id="hw" type="text" style="margin-left: 53px;height: 26px;width: 250px;" name="Name">  <br><br>
        </td>
        </tr>
        <tr>
            <td>
                 <b>이메일 주소</b> <input id="hw" style="margin-left:8px;height: 26px;width: 251px;" type="text" name="Email">  <br><br>
            </td>
        </tr>
         <tr>
                <td>
                    <b>휴대번호</b> <input id="hw" type="text" style="margin-left: 25px;height: 26px;width: 250px;" name="Phone" placeholder="xxx-xxxx-xxxx">  
                </td>
            </tr>
         </table>   
    </p> 
    	
    
    <button id="myBtn" type="submit" style="background: #ffc107; color:white; font-weight:bold; width: 100px; height: 40px; border-radius: 4px; float:right; text-align:center; margin-top: 250px; margin-right: 380px;">다음</button>
    </form>
    </div>
   

</body>

</html>