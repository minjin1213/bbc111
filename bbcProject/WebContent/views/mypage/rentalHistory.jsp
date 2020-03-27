<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.bbc.reservation.model.vo.Reservation" %>
 <%@ page import="java.util.ArrayList" %>
 <%
 	ArrayList<Reservation> list = (ArrayList<Reservation>)request.getAttribute("reservationlist");
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량이용 내역 </title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
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

    #tableMain{
        width:860px;
        border:1px solid lightgray;
        border-left: none;
        border-right: none;
        border-collapse: separate;
        border-spacing:0px;
        margin-top:40px;
        text-align: center;
    }

    table{
        width: 100%;
    }
    th{
        margin-top: 10px;
        background: lightgray;
        box-sizing: border-box;
    }

    th,td {
       
         text-align: center;
         border: 1px solid lightgray;
         border-left: none ;
         border-right: none;
    }


    #pop{
        border: 1px solid lightgray;
        font-size: 10px;
        text-align:left
    }
    
    #tableMain > img{
    	 display:block;
    	 width: 70px; 
    	 height: 40px;
    
    }

   

    #bor{
        border: 1px solid gray;
        text-align: center;
        font-weight: bold;
        height:40px;
    }

    .pay{
        text-align: left;
        font-weight: bold;
        background-color: rgba(211, 211, 211, 0.418);
    }

    .breakrow{
        border: 1px solid lightgray;
        margin-top:10px;
        margin-bottom:10px;
    
    }

    input{
        background-color: #ffc107;
        color:white;
        border-radius: 2px;

    }

    #sep{
        border: 1px solid gray; 
        border-collapse: collapse;

    }
    
    #space{
        margin-left: 20px;
      	width:60;
      	height:25px;
      	text-align:center;
      	margin-top:5px;
      	margin-bottom:5px;
      	color:white;
      	font-size:10px;
    }



    .arrow {
            float: left;
            border: 10px solid transparent;
            margin-top: 10px;
            margin-left: 20px;
            border-top-color: lightgray;
            transition: 350ms;
            position: absolute;
    }
    .accordion-head.open{
            background: white;
    }
    .accordion-head.open1{
            background: #eee;
    }
    .accordion-head.open .arrow {
 
         
            
    }
    
    
    
.search{
        background: #ffc107;
        color:white;
        font-weight:bold;
        width: 80px;
        height: 20px;
        border-radius: 4px;
        float:right;
        text-align:center;
        margin-top: 15px;
        font-size: 11px;
    }

    

    

    .popup {
          position: relative;
          display: inline-block;
          cursor: pointer;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
      
        }
        
    .popup .popuptext {
          visibility: hidden;
          width: 200px;
          background-color: gray;
          color: black;
          text-align: center;
          border-radius: 6px;
          padding: 10px 10px 10px 10px;
          position: absolute;
          bottom: -175px;
          right:0px;
          
          
     }
        
    .popup .show {
          visibility: visible;
          -webkit-animation: fadeIn 1s;
          animation: fadeIn 1s;
    }
    
    .popup .hide{
            visibility: none;
    }	
        
    .month{
            background-color:#ffc107;
            color:white;
            margin-top: 5px;
            margin-bottom: 3px;
            margin-left: 2px;
            margin-right: 3px;
            font-size:10px;
            height:20px;
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
    
    
    <%@ include file="../common/menubar.jsp" %>
    
        <div class="outer"> 
            <span class="main-title">차량이용 내역</span>
            <hr class="garo">
            
            
            
    <!-- 사용자 지정 -->
    		 <div class="popup" style="float: right;"> 
                <button onclick="myFunction();" class="search">사용자 지정</button>
                <span class="popuptext" id="myPopup"> 
                        <b style="font-size: 15px; color:white">조회기간</b><br>
             <span> <input  type="date" name="listDate" value="01/01/2018" style="width: 155px;height: 24px; background-color:white;" >
 					<br>
 				~
 					<br>            
              <input type="date" name="listDate" value="02/01/2018" style="width: 155px;height: 24px; background-color:white;"> </span> <br>
                  <button class="month" type="submit" value="1개월">1개월</button>	
                  <button class="month" type="submit" value="3개월">3개월</button>	
                  <button class="month" type="submit" value="6개월">6개월</button> <br>
                  <button  onclick="myFunction();"class="month" id="length" type="submit" value="적용" style="Width:100px;">적용</button>
                 
              </div>


     <script>
function myFunction() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
  }

     </script>
  
  	<!--  테이블 -->
            <table id="tableMain" class="accordion" style="text-align:center;">
                    <thead>
                        <tr>
                          <th style="height:40px;">이용기간</th>
                          <th style="height:40px;">차종</th>
                          <th style="height:40px;padding-left: 30px;" >지점명 </th>
                           <th>
                           상태
                           </th>
                          
                        </tr>
                    </thead>
                    <tbody>
     
     
     <% if(list != null){ %>
     				<% for(Reservation r : list){ %>
      <!-- 테이블 정보 -->
      <tr class="accordion-head breakrow open">
        <td><div class="arrow"></div> <%=r.getRentDate() %> ~ <%=r.getReturnDate() %> </td>
        <td> <%=r.getCarTypeName() %></td>
        <td ><%=r.getRentBranch()%>~<%=r.getReturnBranch()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        
        
        <% if ( r.getReservationStatus().equals("1")){ %>
        <td style="padding-right: 20px;">
        <input id="space" type="button" value="예약중" readonly >
        </td>
        <%} else if (r.getReservationStatus().equals("2")){ %>
        <td style="padding-right: 20px;">
        <input id="space" type="button" value="대여중" readonly >
        </td>
        <%} else if (r.getReservationStatus().equals("3")) {%>
        <td style="padding-right: 20px;">
         <input id="space" type="button" value="반납완료" readonly >
         </td>
         <%} else{ %>
         <td style="padding-right: 20px;">
        <input id="space" type="button" value="예약취소" readonly >
        </td>
        <%} %>
        
      </tr>
      <tr class="accordion-body" style="display: none;">
        <td colspan="3">
          <table id="sep">
            <tbody>
              <tr id="pop">
                <td id="bor" rowspan="5" style="width: 302px;" ><img src="http://www.cctoday.co.kr/news/photo/201509/925979_306258_1646.jpg" style="width:400px"></td>
              	
							 <tr id="pop">
							 <td id="bor" >보험료</td>
							  <td style="border:1px solid gray" ><%=r.getCwdPrice() %> 원 </td>
							
							</tr>
							 <tr id="pop">
							  <td id="bor">대여료</td>
							  <td style="border:1px solid gray" colspan="2"><%=r.getPrice()%> 원</td>
							  </tr>
							  <tr id="pop" >
							<td id="bor" >쿠폰/이벤트</td>
							<td style="border:1px solid gray" colspan="2"><%=r.getDiscountPrice()%> 원</td>
							
							</tr>
							 <tr id="pop">
							  <td id="bor">총 대여금액 </td>
							  <td style="border:1px solid gray" colspan="2"><%=r.getTotalPrice() %> 원</td>
							
							<tr id="pop">
                <td id="bor" colspan="2">결제 일시</td>
               
                <td style="border:1px solid gray" colspan="2"><%=r.getPayDate() %></td>
                 <tr id="pop">
                <td id="bor" colspan="2">결제 금액</td>
                <td style="border:1px solid gray" colspan="2"><%=r.getPayAmount() %> 원</td> 
              </tr>
              <tr id="pop">
                <td id="bor" colspan="2">결제 방식</td>
                <td style="border:1px solid gray" colspan="2" ><%=r.getPayMethod()%></td>
              </tr>
              <tr id="pop">
                <td  style="border:1px solid gray" id="bor"colspan="2">환불 여부</td>
                <% if(r.getRefundStatement() != null){ %>
                <td  colspan="2" style="border:1px solid gray"  ><%=r.getRefundStatement() %></td>
                <%} else { %>
                     <td  colspan="2" style="border:1px solid gray"  > - </td>
                     <%} %>
              </tr>
               <tr id="pop">    
                <td style="border:1px solid gray"  colspan="2" id="bor">환불 일시</td>
                     <% if(r.getRefundDate() != null){ %>
                <td style="border:1px solid gray"  colspan="2"><%=r.getRefundDate() %></td>
                  <%} else { %>
                      <td  colspan="2" style="border:1px solid gray"  > - </td>
                        <%} %>
              </tr>
         
               
            </tbody>
          </table>
        </td>
      </tr>
      
      <% } %>
      <% } %>
                      
              
          
     
    <!-- 테이블 정보 끝  -->
    
        
                      
              
           
        
    
    
                        
           </tbody>
          </table>
          
          <!-- 테이블 끝 -->
          
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
    </div>
    <script>




    $(document).on('click', '.accordion-head', function(){


    $('.accordion-head').removeClass('open');
    if (!$(this).hasClass('open')){
      $(this).addClass('open1'); 
    }
    else{ 
      $('.accordion-head').removeClass('open'); 
      $(this).addClass('close'); 
    }
    $('.accordion-body').slideUp("fast");
    $(this).next().slideDown("fast"); 

    $(document).on('dblclick', '.accordion-head', function(){
        
      if (!$(this).hasClass('open')){
          $('.accordion-head').removeClass('open1');
    }
    else{
      $('.accordion-head').removeClass('open'); 
      $(this).addClass('close'); 
    }
    $('.accordion-body').slideUp("fast");
    });
    });
            


    
    </script>
    
          
</body>
</html>
