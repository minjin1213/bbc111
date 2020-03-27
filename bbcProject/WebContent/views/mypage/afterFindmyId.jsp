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
	
	.area{
	
	    border:1px solid black;
	    margin-left: 20px;
	    margin-top:10px;
	    width: 40%;
	    height:70px;
	    text-align: center;
	    padding-top:20px;
	}
    </style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	 <div class="outer"> 
            <span class="main-title">아이디 찾기</span>
            <hr class="garo">
    <br>
	<b style="margin-top:17px;"> * 일치하는 회원 정보가 있습니다 </b>
    <div class="area">
            아이디는 <b style="background: lightgray;">"shinhwa"</b>입니다

    </div>
    
    
    	 <button onclick="next();" id="myBtn" type="submit" style="background: #ffc107; color:white; font-weight:bold; width: 100px; height: 40px; border-radius: 4px; float:right; text-align:center; margin-top: 250px; margin-right: 380px;">다음</button>
    </div>
    
    <script>
   function next(){
		location.href = "<%=request.getContextPath()%>";
	}
   
   </script>
</body>


</html>