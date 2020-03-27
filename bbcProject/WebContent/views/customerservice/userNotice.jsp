<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.notice.model.vo.*" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
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
<title>Insert title here</title>



</head>

<style>


.outer{ /* 한거 */
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}		
	.main-title{ /* 한거 */
		margin-top: 35px; 
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
        margin-top: 60px;
        margin-right: 20px;
        margin-bottom: 7px
    }

	#input-div{
		
		margin-left: 265px;
		margin-top: 45px;
	}
	
    #input-form{
        margin-top: 3rem;
        margin-bottom: 3rem;
    }

    #input-bt {
        border: 0;
        outline: 0;
        width: 80px;
        height: 30px;
        color: white;
        background-color: orange;
        border-radius: 3px;
        margin-left: 1rem;
    }
    
    #notice-keyword {
        height: 30px;
    }



.userpagination {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
  margin-left: 260px;
  margin-top: 15px;
}
.userpagination a {
    color: black;
    float: left;
    padding: 8px 12px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #e2e2e2;
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
  color: #337ab7;
  text-decoration: none;
  background-color: #fff;
  border: 1px solid #ddd;
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

.ListArea>tbody>tr:hover{
	cursor:pointer;
	background:gray;
}


</style>


<body>
	<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>
	
    <div class="outer">
        <div class="main-title">공지사항</div>	
		<hr class="garo">



            <table class="ListArea" id="tableMain">
            
                <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>글쓴이</th>
                      <th>등록일</th>
                      <th>조회수</th>
                    </tr>
                </thead>
                
                <tbody>
                   <!--   <tr>
                        <td>10</td>
                        <td style="text-align: left;">이용약관 변경에 대한공지</td>
                        <td>관리자</td>
                        <td>2020-02-22</td>
                        <td>5</td>
                    </tr> -->
                    
                    <% if(list.isEmpty()) { %>
                    <tr>
                    	<td colspan="5">조회된리스트없습니다</td>
                    </tr>
                    
                    <% } else{ %>
                     	<% for(Notice n : list) { %>
                     		<tr>
                     			<td><%=n.getNoticeNo()%></td>
                     			<td style="text-align: left;"> <%= n.getNoticeTitle() %> </td>
                     			<td> <%= n.getMemberName() %> </td>
                     			<td> <%= n.getEnrollDate() %> </td>
                     			<td> <%= n.getNoticeReadCnt() %> </td>
                     		</tr>
                     	<% } %>
                    <% } %> 
                                                            
                </tbody>

            </table>
			
            <div id="input-div">
                <form id="input-form">
    
                <select id="list" name="list">
                <option value="notice-whole" selected>전체 </option>
                <option value="notice-title">제목 </option>
                <option value="notice-content">내용 </option>
                </select>
    
                <input type="text" id="notice-keyword">
    
                <button id="input-bt">검색</button>
                </form>
            </div>

            <div class="userpagination">
                <a href="<%=contextPath%>/CsList.no">«</a>
                
                <%if(currentPage == 1) { %>
                 <li><a>&lt;</a></li>
                <% } else { %>
                <li><a href="<%=contextPath%>/CsList.no?currentPage=<%=currentPage-1%>">&lt;</a></li>                
                <% } %>
                
                <%for(int p=startPage; p<=endPage; p++) { %>
                	<li><a href="<%=contextPath%>/CsList.no?currentPage=<%=p%>"> <%= p %> </a></li>
                <% } %>

                 <%if(currentPage == maxPage) { %>
                 <li><a>&gt;</a></li>
                <% } else { %>
                <li><a href="<%=contextPath%>/CsList.no?currentPage=<%=currentPage+1%>">&gt;</a></li>                
                <% } %>

                
                <a href="<%=contextPath%>/CsList.no?currentPage=<%=maxPage%>">»</a>
            </div>
			
			<script>
			$(function(){
				$(".ListArea>tbody>tr").click(function(){
					
					var nno = $(this).children().eq(0).text();
					//console.log(nno);
					location.href="<%=contextPath%>/CsNodetail.no?nno="+nno;
				});			
			});
       
			</script>  
       
              

	</div> <!-- <div class="outer"> --> 
	
</body>
</html>