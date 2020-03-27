<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.myinquiry.model.vo.*" %>
<%
	ArrayList<MyInquiry> list = (ArrayList<MyInquiry>)request.getAttribute("list");
	UserPageInfo pi = (UserPageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>

    .outer{ /* 한거 */
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}		
	.main-title{ /* 한거 */
		margin-top: 17px; 
		font-size: 20px;
		font-weight: 900;
	}	

	hr.garo{ /* 한거 */
		border: 1px solid #757272;
		margin: 17px 0px 0px 0px;
	}

    #tableMain{ /* 한거 */
        width:100%;
        border:1px solid lightgray;
        border-left: none;
        border-right: none;
        border-collapse: separate;
        border-spacing:0px;
        margin-top:40px;
        text-align: center;
    }

    table { /* 한거 */
         width: 100%;        
    }
    th,td {  /* 한거 */
        padding: 10px 13px !important;
       text-align: center;
       border: 1px solid lightgray;
       border-left: none ;
       border-right: none;
    }

    th{    /* 한거 */
        margin-top: 10px;
        background: lightgray;
        box-sizing: border-box;
    }

    /* #pop{
        border: 1px solid gray;
        font-size: 10px;
        text-align:left;
    }

    #bor{
       
        text-align: left;
        font-weight: bold;
    } */


    .search{ /* 한거 */
        background: #ffc107;
        color:white;
        font-weight:bold;
        width: 80px;
        height: 20px;
        border-radius: 4px;
        float:right;
        text-align:center;
        margin-top: 15px;
        margin-right: 20px;
        margin-bottom: 7px
    }
        .search2{ /* 한거 */
        background: #ffc107;
        color:white;
        font-weight:bold;
        width: 80px;
        height: 20px;
        border-radius: 4px;
        float:right;
        text-align:center;
        margin-top: 15px;
        margin-right: 20px;
        margin-bottom: 7px
    }



.userpagination {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
  margin-left: 260px;
  margin-top: 60px;
}
.userpagination a {
    color: black;
    float: left;
    padding: 8px 12px;
    text-decoration: none;
    transition: background-color .3s;
    margin: 0 8px 2px 2px;
}

.userpagination > li {
  display: inline;
}

.userpagination > li > a,
.userpagination > li > span {
  position: relative;
  float: left;
  padding: 6px 12px;
  margin-left: -1px;
  line-height: 1.42857143;

  text-decoration: none;
  background-color: #fff;

}
.userpagination > li:first-child > a,
.userpagination > li:first-child > span {
  margin-left: 0;
  border-top-left-radius: 4px;
  border-bottom-left-radius: 4px;
}
.userpagination > li:last-child > a,
.userpagination > li:last-child > span {
  border-top-right-radius: 4px;
  border-bottom-right-radius: 4px;
}
.userpagination > li > a:hover,
.userpagination > li > span:hover,
.userpagination > li > a:focus,
.userpagination > li > span:focus {
  color: #23527c;
  background-color: #eee;
  border-color: #ddd;
}
.userpagination > .active > a,
.userpagination > .active > span,
.userpagination > .active > a:hover,
.userpagination > .active > span:hover,
.userpagination > .active > a:focus,
.userpagination > .active > span:focus {
  z-index: 2;
  color: #fff;
  cursor: default;
  background-color: #337ab7;
  border-color: #337ab7;
}
.userpagination > .disabled > span,
.userpagination > .disabled > span:hover,
.userpagination > .disabled > span:focus,
.userpagination > .disabled > a,
.userpagination > .disabled > a:hover,
.userpagination > .disabled > a:focus {
  color: #777;
  cursor: not-allowed;
  background-color: #fff;
  border-color: #ddd;
}
.userpagination-lg > li > a,
.userpagination-lg > li > span {
  padding: 10px 16px;
  font-size: 18px;
}
.userpagination-lg > li:first-child > a,
.userpagination-lg > li:first-child > span {
  border-top-left-radius: 6px;
  border-bottom-left-radius: 6px;
}
.userpagination-lg > li:last-child > a,
.userpagination-lg > li:last-child > span {
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
}
.userpagination-sm > li > a,
.userpagination-sm > li > span {
  padding: 5px 10px;
  font-size: 12px;
}
.userpagination-sm > li:first-child > a,
.userpagination-sm > li:first-child > span {
  border-top-left-radius: 3px;
  border-bottom-left-radius: 3px;
}
.userpagination-sm > li:last-child > a,
.userpagination-sm > li:last-child > span {
  border-top-right-radius: 3px;
  border-bottom-right-radius: 3px;
}


</style>
<body>
	<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <div class="main-title">나의 문의 내역</div>	
		<hr class="garo">

            <div class="popup" style="float: right;">
                <button class="search2" style="font-size:10px;" onclick="location.href='<%=contextPath%>/insertForm.bo';">문의하기</button>

            </div>

            <table id="tableMain">
            
                <thead>
                    <tr class="tableheader">
                      <th>번호</th>
                      <th>제목</th>
                      <th>작성일자</th>
                      <th>처리상태</th>
                    </tr>
                </thead>
                <tbody>
                <!--  
                    <tr>
                        <td>10</td>
                        <td>이용방법은요?</td>
                        <td>2020-02-22</td>
                        <td>답변완료</td>
                    </tr>    
                    <tr>
                        <td>9</td>
                        <td>결제방법은요?</td>
                        <td> 2020-01-22</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>회원가입은요?</td>
                        <td> 2019-12-01</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>지점위치는요?</td>
                        <td> 2019-10-01</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>지점번호</td>
                        <td> 2019-06-01</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>쿠폰에관하여</td>
                        <td> 2019-05-01</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>회원가입에관하여</td>
                        <td> 2019-04-01</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>휴대폰인증</td>
                        <td> 2019-03-01</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>채팅</td>
                        <td> 2019-02-01</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>전화문의</td>
                        <td> 2019-01-01</td>
                        <td>답변완료</td>
                    </tr>
                -->
                   <%if(list.isEmpty()){ %>
				 	<tr>
				 		<td colspan="5">존재하는 나의문의사항이 없습니다.</td>
				 	</tr>
				 
				 <% }else { %>
				 	<% for(MyInquiry n: list) { %>
				 		<tr>          
				 			<td><%= n.getInquiryNo() %></td>
				 			<td><%= n.getInquiryTitle() %></td>
				 			<td><%= n.getInquiryDate() %></td>
				 			<td><%= n.getInquiryStatus() %></td>
				 		</tr>
				 	<% } %>
				 <% } %>

                                         
                </tbody>
                
                

            </table>

            <div class="userpagination">
                <a href="<%=contextPath%>/MyInquiryList.my">«</a>
                
                <%if(currentPage == 1) { %>
                 <li><a>&lt;</a></li>
                <% } else { %>
                <li><a href="<%=contextPath%>/MyInquiryList.my?currentPage=<%=currentPage-1%>">&lt;</a></li>                
                <% } %>
                
                <%for(int p=startPage; p<=endPage; p++) { %>
                	<li><a href="<%=contextPath%>/MyInquiryList.my?currentPage=<%=p%>"> <%= p %> </a></li>
                <% } %>

                 <%if(currentPage == maxPage) { %>
                 <li><a>&gt;</a></li>
                <% } else { %>
                <li><a href="<%=contextPath%>/MyInquiryList.my?currentPage=<%=currentPage+1%>">&gt;</a></li>                
                <% } %>

                
                <a href="<%=contextPath%>/MyInquiryList.my?currentPage=<%=maxPage%>">»</a>
            </div>

       
              

	</div> <!-- <div class="outer"> -->

	
</body>
</html>