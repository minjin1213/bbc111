<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="com.bbc.userInfo.model.vo.UserInfo, com.bbc.driverlicense.model.vo.DriverLicense"%>
<% 
	DriverLicense d = (DriverLicense)request.getAttribute("d");
	
%>


<!DOCTYPE html>
<html>
<head>

   
<meta charset="UTF-8">
<title>운전면허 등록</title>
<style>
.outer{
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}	
	
hr.garo{
		border: 1px solid #757272;
		margin: 17px 0px 0px 0px;
	}	
	
.main-title{
		margin-top: 35px; 
		font-size: 20px;
		font-weight: 900;
	}	
	
<-- upload -->
.uploader {
  display: block;
  clear: both;
  margin: 0 auto;
  float: left;
  width: 20%;
  height:200%;
  margin-top: 10px;
  margin-left: 80px;

}
.uploader label {
  float: left;
  clear: both;
  width: 30%;
  height: 200px;
  margin-top: 50px;
  margin-left: 50px;
  padding: 2rem 1.5rem;
  text-align: center;
  background: #fff;
  border-radius: 7px;
  border: 3px solid #eee;
  -webkit-transition: all .2s ease;
  transition: all .2s ease;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.uploader label:hover {
  border-color: #ffc107;
}
.uploader label.hover {
  border: 3px solid #ffc107;
  box-shadow: inset 0 0 0 6px #eee;
}
.uploader label.hover #start i.fa {
  -webkit-transform: scale(0.8);
          transform: scale(0.8);
  opacity: 0.3;
}
.uploader #start {
  float: left;
  clear: both;
  width: 100%;
  padding-top: 30px;
}
.uploader #start.hidden {
  display: none;
}
.uploader #start i.fa {
  font-size: 50px;
  margin-bottom: 1rem;
  -webkit-transition: all .2s ease-in-out;
  transition: all .2s ease-in-out;
}
.uploader #response {
  float: left;
  clear: both;
  width: 100%;
}
.uploader #response.hidden {
  display: none;
}
.uploader #response #messages {
  margin-bottom: .5rem;
}
.uploader #file-image {
  display: inline;
  margin: 0 auto .5rem auto;
  max-width: 180px;
}
.uploader #file-image.hidden {
  display: none;
}
.uploader #notimage {
  display: block;
  float: left;
  clear: both;
  width: 100%;
}
.uploader #notimage.hidden {
  display: none;
}

.uploader .progress[value]::-webkit-progress-bar {
  border-radius: 4px;
  background-color: #eee;
}
.uploader .progress[value]::-webkit-progress-value {
  background: -webkit-linear-gradient(left, #ffc107 0%, #ffc107 50%);
  border-radius: 4px;
}
.uploader .progress[value]::-moz-progress-bar {
  background: linear-gradient(to right, #ffc107 0%, #454cad 50%);
  border-radius: 4px;
}
.uploader input[type="file"] {
  display: none;
}
.uploader div {
  margin: 0 0 .5rem 0;
  color: #5f6982;
}
.uploader .btn {
  display: inline-block;
  margin: .5rem .5rem 1rem .5rem;
  clear: both;
  font-family: inherit;
  font-weight: 700;
  font-size: 14px;
  text-decoration: none;
  text-transform: initial;
  border: none;
  border-radius: .2rem;
  outline: none;
  padding: 0 1rem;
  height: 36px;
  line-height: 36px;
  color: #fff;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  box-sizing: border-box;
  background: #ffc107;
  border-color: #ffc107;
  cursor: pointer;
}

  input[type="text"],input[type="date"], input[type="checkbox"],select{ 
    color: black; 
    font: 'trebuchet ms',helvetica,sans-serif; 
    background-color: white; 
    border:1px solid; 
    border-color: lightgray; 
    box-size
} 
#right{
   margin-left: 420px;
   margin-top: 68.797px;
}

#chg{
    width: 60px;
    height: 30px;
    margin-left: 10px;
    background-color: white;
}

.chgs{
    height: 25px !important;
    border-radius: 10%;
    text-align: center;
    margin-left: 4px !important;
    padding-right: 10px;
    padding-top: 1px;


#letter{
	font-size:15p;
}

body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position:flex; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  text-align: center;
  left: 0;
  top: 0;
  width: 40%; /* Full width */
  height: 30%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
  text-align:center;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>

    </head>
    <body>
    
    <!-- 상단 메뉴바 include -->
    <%@ include file="../common/menubar.jsp" %>
	

		<div class="outer"> 
		
		   
		   <%if(d != null) {%>
		   		 <div class="main-title">운전면허</div>
		        <hr class="garo"> 
	
			
				
				
				<form action="<%=request.getContextPath()%>/delete.dl" method="post">
	             <img src="<%=request.getContextPath()%>/resources/driverLicense_upfiles/<%=d.getLicenseModifyName() %>" style="margin-left: 90px;margin-top: 40px;" width="250px" height="170px">
	                <div id="right" style="margin-bottom: 0px; margin-top: 35px;margin-bottom: 0px;margin-top: -15%;">
       
            		<ul style="margin-right: 70px;margin-top: -38%;margin-bottom: 100px;">
                		<li>
                    
                         	<span for="type" id="letter" style="width: 20%;"><strong>면허 종류:</strong> </span>
								<input type="text" style="width:25%;" value="&nbsp;&nbsp;<%=d.getLicenseType()%>" readonly>
                    
               		  </li>
		                <li style="margin-top:14px;">
	                        <span for="type" id="letter"><strong>면허증 번호: </strong></span>
	                         
	                         <% if(d.getRentNumber1().equals("12")){ %>
	                         	  <input type="text" id="small" style="width:60px;"value="&nbsp;&nbsp;부산" readonly>
		                         <%} else if(d.getRentNumber1().equals("11")){%>
		                         <input type="text" id="small" style="width:60px;"value="&nbsp;&nbsp;서울" readonly>
		                         <%} else if(d.getRentNumber1().equals("13")){%>
		                          <input type="text" id="small" style="width:60px;"value="&nbsp;&nbsp;경기" readonly>
		                         <%} else if(d.getRentNumber1().equals("15")){%>
		                          <input type="text" id="small" style="width:60px;"value="&nbsp;&nbsp;충북" readonly>
		                         <%} else {%>
		                            <input type="text" id="small" style="width:60px;"value="&nbsp;&nbsp;인천" readonly>
	                         <%} %>
	                        <input type="text" id="small" value="&nbsp;&nbsp;<%=d.getRentNumber2()%>" readonly>
		                   
		                </li>
		                <li style="margin-top:14px;">
		                        <span for="발급일" id="letter"><strong>발급일:</strong></span>
		                        <input type="date" style="width: 200px;" class="chgs" name="new" value="<%=d.getLicenseIssueDate()%>" readonly>
		        
		                </li>
		                    <li style="margin-top:14px;">
		                        <span for="만료일" id="letter"><strong>만료일:</strong></span>
		                        <input type="date" style="width: 200px;" class="chgs" name="expire" value="<%=d.getLicenseReturnDate()%>" readonly>
		                </li> 
		            </ul>
		            
		        </div>
		      
	
		     				<!-- 등록 -->
		     	
				<button type="submit" onclick="deletedl();" class="delete" style="background: #ffc107; color:white; font-weight:bold; width: 100px; height: 40px; border-radius: 4px; float:right; text-align:center; margin-top: 40px; margin-right: 380px;" >삭제</button>
	    		  </form>
		   <% } else {%>
	    
	    	
	   
	    	<div class="main-title">운전면허</div>
		   		
		    	<button type="button" onclick="goDriverLicense();"  style="float:right;background: #ffc107;height:20px;font-size:10px;width:90px;padding-top:2px;border-radius:5px;margin-top: -0.5%;color:white;">면허증 등록</button>
				<hr class="garo"> 

		</div>
		<%} %>

		
<script>


function deletedl(){
	
	var c = confirm("삭제하시겠습니까?");
	
	if(c == true){ alert("삭제되었습니다.");}
	}


function goDriverLicense(){
 location.href = "<%= request.getContextPath()%>/make.dl";	
}




</script>


</body>

</html>