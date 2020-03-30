<%@page import="com.bbc.mycoupon.model.vo.MyCoupon"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		ArrayList<MyCoupon> list = (ArrayList<MyCoupon>)request.getAttribute("couponlist");
%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>쿠폰함</title>
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
</style>
<style>
	.outer{
		width:850px;
		/*height: 500px;*/
		/*height:500px;*/
		/*color:white;*/
		/*margin-top:50px;*/
		margin-left:auto;
		margin-right:auto;
	}
	
    .title{
        margin-top:35px !important;
        font-size:20px;
        font-weight:900;
    }

    hr.garo {
        border: 1px solid #757272;
        margin-top:17px;
        margin-bottom:17px;
    }
    table {
         margin-top: 40px;
         border-collapse: separate;
         border-spacing: 0px;
       
        
    }
    table,th,td {
        width: 860px;
        border: 1px solid lightgray;
        border-left: none;
        border-right: none;
        text-align:center;
    }   
   
    th{
        margin-top: 10px;
        background: lightgray;
    }
    th,td {
         padding: 15px 20px;
         text-align: center;
    }

 
    
    .page{
        background-color:rgb(244, 244, 244);
        margin-top: 50px;
        color: black;
        border-radius:5px;
        font-size: 20px;
    }


    #pop{
        border: 1px solid gray;
        font-size: 10px;
        text-align:left;
    	padding:10px;
    	height:20px;
    }

    #bor{
       
        text-align: left;
        font-weight: bold;
        left
    }


    .arrow {
            float: left;
            border: 10px solid transparent;
            margin-top: 3px;
            margin-left: 20px;
            border-top-color: lightgray;
            transition: 350ms;
            position: absolute;
    }
    .accordion-head.open{
            background: white;
    }
    .accordion-head.open .arrow {
    		top-margin:5px;
            text-align:center;
           
    }
    .tableheader{
    	height:40px;
    }
    
	.pagination {
	  display: inline-block;
	  margin: 20px 0;
	  border-radius: 4px;
	  margin-left: 260px;
	  margin-top: 60px;
	  text-align:center;
	}
	.pagination a {
	    color: black;
	    float: left;
	    padding: 8px 12px;
	    text-decoration: none;
	    transition: background-color .3s;
	    border: 1px solid #e2e2e2;
	    margin: 0 8px 2px 2px;
	}
	.pagination > li {
	  display: inline;
	}
	.pagination > li > a,
	.pagination > li > span {
	  position: relative;
	  float: left;
	  padding: 6px 12px;
	  margin-left: -1px;
	  line-height: 1.42857143;
	  color: #337ab7;
	  text-decoration: none;
	  background-color: #fff;
	  border: 1px solid #ddd;
	}
	.pagination > li:first-child > a,
	.pagination > li:first-child > span {
	  margin-left: 0;
	  border-top-left-radius: 4px;
	  border-bottom-left-radius: 4px;
	}
	.pagination > li:last-child > a,
	.pagination > li:last-child > span {
	  border-top-right-radius: 4px;
	  border-bottom-right-radius: 4px;
	}
	.pagination > li > a:hover,
	.pagination > li > span:hover,
	.pagination > li > a:focus,
	.pagination > li > span:focus {
	  color: #23527c;
	  background-color: #eee;
	  border-color: #ddd;
	}
	.pagination > .active > a,
	.pagination > .active > span,
	.pagination > .active > a:hover,
	.pagination > .active > span:hover,
	.pagination > .active > a:focus,
	.pagination > .active > span:focus {
	  z-index: 2;
	  color: #fff;
	  cursor: default;
	  background-color: #337ab7;
	  border-color: #337ab7;
	}
	.pagination > .disabled > span,
	.pagination > .disabled > span:hover,
	.pagination > .disabled > span:focus,
	.pagination > .disabled > a,
	.pagination > .disabled > a:hover,
	.pagination > .disabled > a:focus {
	  color: #777;
	  cursor: not-allowed;
	  background-color: #fff;
	  border-color: #ddd;
	}
	.pagination-lg > li > a,
	.pagination-lg > li > span {
	  padding: 10px 16px;
	  font-size: 18px;
	}
	.pagination-lg > li:first-child > a,
	.pagination-lg > li:first-child > span {
	  border-top-left-radius: 6px;
	  border-bottom-left-radius: 6px;
	}
	.pagination-lg > li:last-child > a,
	.pagination-lg > li:last-child > span {
	  border-top-right-radius: 6px;
	  border-bottom-right-radius: 6px;
	}
	.pagination-sm > li > a,
	.pagination-sm > li > span {
	  padding: 5px 10px;
	  font-size: 12px;
	}
	.pagination-sm > li:first-child > a,
	.pagination-sm > li:first-child > span {
	  border-top-left-radius: 3px;
	  border-bottom-left-radius: 3px;
	}
	.pagination-sm > li:last-child > a,
	.pagination-sm > li:last-child > span {
	  border-top-right-radius: 3px;
	  border-bottom-right-radius: 3px;
	}
    
</style>

    </head>
    <body>
    
    <!-- 상단 메뉴바 include -->
    <%@ include file="../common/menubar.jsp" %>
	

		<div class="outer"> 
		     <div class="main-title">쿠폰함</div>
		<hr class="garo"> 
	 

            <table id="tableMain" style="margin-top: 25px;">
            
                <thead>
                    <tr class="tableheader">
                      <th>사용여부</th>
                      <th>쿠폰명</th>
                      <th>기간</th>
                    </tr>
                </thead>
                <tbody>
			

           
         	<% if( list != null){ %>
					<% for(MyCoupon c : list){ %>
					<tr>
					
					
              <tr class="accordion-head breakrow open"><td style="height:40px"><div class="arrow"></div><%=c.getCouponUse()%></td>
              <td style="left-margin:5px;"><%=c.getCouponName() %></td><td><%=c.getCouponPost()%>~<%=c.getCouponExp() %></td></tr>    
                    <tr><td id="pop" colspan="3"><div id="bor">할인혜택</div>
                       &nbsp; &nbsp;<%=c.getCouponDc() %>원</td></tr>
                    <tr><td id="pop" colspan="3"><div id="bor">쿠폰타입</div>
                       &nbsp;&nbsp; <%=c.getCouponType() %></td></tr>
                    <tr><td id="pop" colspan="3"><div id="bor">사용조건</div>
                       &nbsp; &nbsp;<%=c.getCouponCondition() %><br>
                 

					</tr>
					<% } %>
				<% } %> 
				
				
   
      		</tbody>
                                                
            </table>
       
       		<div class="pagination" style="padding-left:250px; margin-top:60px;">
                <a href="#">«</a>
                <a href="#">&lt;</a>
                <li><a href="#home">1</a></li>
                <li><a href="#home">2</a></li>
                <li><a href="#home">3</a></li>
                <li><a href="#home">4</a></li>
                <li><a href="#home">5</a></li>
                <a href="#">&gt;</a>
                <a href="#">»</a>
            </div>
            
              
<script>

$(document).ready(function(){

$('tr.breakrow').nextUntil('tr.breakrow').hide();

    $('#tableMain').on('click', 'tr.breakrow',function(){
    
        $('tr.breakrow').nextUntil('tr.breakrow').hide();
        
        $(this).nextUntil('tr.breakrow').slideDown("fast");
        $(this).css("background-color","#eee")
        $('#tableMain').on('dblclick', 'tr.breakrow',function(){
        $(this).nextUntil('tr.breakrow').slideUp("fast");
        $(this).css("background-color","white")
        });
});
});

</script>
							

</div>
</body>

</html>