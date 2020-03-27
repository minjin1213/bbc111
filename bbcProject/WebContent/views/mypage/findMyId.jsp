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
            <span class="main-title">아이디 찾기</span>
            <hr class="garo">


      <p style="margin-top: 17px;">
      <input type="radio" name="idFinder" value="email" class="check" onclick="showDiv1();"><b id="fnt">이메일주소로 찾기</b>
    <div class="all" id="box1" style="margin-top: 20px;">
        <table>

        <tr>
        <td>
            <b style="margin-top: 3px;">이름</b> <input id="hw" type="text" style="margin-left: 53px;height: 26px;width: 250px;">  <br><br>
        </td>
        </tr>
        <tr>
            <td>
                 <b>이메일 주소</b> <input id="hw" style="margin-left:8px;height: 26px;width: 251px;" type="text">  
            </td>
        </tr>
         </table>
        </div>    
    </p> 
    	<hr>

        <p>
       <input type="radio" name="idFinder" value="phone" class="check" onclick="showDiv2();"><b id="fnt">휴대폰번호로 찾기</b>
        <div class="all"  id="box2" style="margin-top: 20px;">
        <tr>
            <td>
                <b style="margin-top: 3px;">이름</b> <input id="hw" type="text" style="margin-left:35px;height: 26px; width: 60%;">  <br><br>
            </td>
            </tr>
            <tr>
                <td>
                    <b>휴대번호</b> <input id="hw" style="margin-left:8px;height: 26px; width: 60%;" type="text">  
                </td>
            </tr>
             </table> 
        </div> 
    </p>
    
    <button onclick="next();"id="myBtn" type="submit" style="background: #ffc107; color:white; font-weight:bold; width: 100px; height: 40px; border-radius: 4px; float:right; text-align:center; margin-top: 250px; margin-right: 380px;">다음</button>
    </div>
    
   <script>
   function next(){
		location.href = "<%=request.getContextPath()%>/views/mypage/afterFindmyId.jsp";
	}
   
   </script>
   <script>
       $(document).ready(function(){
           $('.check').click(function(){
               $('.check').not(this).prop('checked',false);
           });
       });


   </script>
    <script>

			
			function showDiv1() {
			    document.getElementById('box2').style.display = "none";
			   document.getElementById('box1').style.display = "block";
			}
			function showDiv2() {
			    document.getElementById('box1').style.display = "none";
			   document.getElementById('box2').style.display = "block";
			}
    </script>    
</body>

</html>