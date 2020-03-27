<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.bbc.notice.model.vo.*" %>

<%
	Notice n = (Notice)request.getAttribute("n");
ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
UserPageInfo pi = (UserPageInfo)request.getAttribute("pi"); 

int nno = Integer.parseInt(request.getParameter("nno"));
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
<style>

	hr.garo {
	    border: 1px solid #757272;
	    margin: 17px 0px 10px 0px;
	    margin-bottom: 15px;
	}
	.main-title {
    	margin-top: 35px;
    	font-size: 20px;
    	font-weight: 900;
	}
 	.wrapper{
    	width:850px;
   	 	margin-left:auto;
    	margin-right:auto;

	}
    
	.btn-default-ok {
	    background-color: #ffc107;
	    color: white;
	    /*font-weight: 900;*/
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
	
	.option-right-hr {
    	width: 99%;
    	border-bottom: 1px solid #757272;
    	padding: 0px 0px 15px 0px;
    	
	}
	
	label {
    display: inline-block;
    margin-bottom: .5rem;
    font-weight: 700;
	}



<!--내가넣은부분-->
	.hr.yong {
		width:99%;	
		border-bottom: 1px solid #757272; 
		padding: 0px 0px 15px 0px; 
	
	}
	
	
	 textarea {
	    width: 820px;
	    height: 155px;
	    font-size: 14px;
	    line-height: 22px;
	    padding: 8px 12px;
	    border: 1px solid #bbb;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    box-sizing: border-box;
	    resize: none;
	}
	


	.btn-ni-opinion {
	    width: 80px;
	    height: 30px;
	    font-size: 15px;
	    margin: 15px 5px 0px 5px;
	    margin-left: 365px;
	}
	
	
    .tb-notice-inquiry {
        font-weight: 700;
        margin-left: 15px;
    }

.grid {border-top:1px solid #000;}
.grid caption { width:0; height:0; font-size:0; line-height:0; overflow:hidden; visibility:hidden; }
.grid .tb_col { width:100%; border:0; } 
.grid .tb_col thead th,
.grid .tb_col tbody th,
.grid .tb_col tbody td {height:19px;line-height:20px;border-bottom:1px solid #ccc;border-left:1px solid #ccc;padding:11px 10px 9px 10px;font-weight: normal;}
.grid .tb_col thead th { background:#fafafa; color:#000; font-weight:bold;}   
.grid .tb_col thead th.type2 span { display: block;  }
.grid .tb_col thead th.bgGray { background: #e4e4e4; }
.grid .tb_col thead th.bgGray2 { background: #eeeeee; }
.grid .tb_col thead th:first-child { border-left:0; } 
.grid .tb_col thead th.borderL { border-left:1px solid #ccc;  } 
.grid .tb_col tbody th { text-align: center; background:#fafafa; font-weight:bold; color:#000; }
.grid .tb_col tbody th.left { text-align: left; }
.grid .tb_col tbody th.noBorderL { border-left:0; } 
.grid .tb_col tbody td {text-align: center;color:#646464;}
.grid .tb_col tbody td:first-child { border-left:0; } 
.grid .tb_col tbody td.left {text-align:left;}
.grid .tb_col tbody td.no_data { padding:55px 10px; }
.grid .tb_col tbody td.noStore { padding:40px 0;}
.grid .tb_col tbody th.borderL, .grid .tb_col tbody td.borderL { border-left:1px solid #ccc;  } 
.grid .tb_col th.red, .grid .tb_col td.red {background-color:#fdecec}
	
.view_list{
	margin-top: 90px;
}

     

</style>
</head>
<body>
		<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>

    <div class="wrapper">
		<div class="contact-form">
            <div class="main-title">공지사항</div>
            <hr class="garo">

			<div class="input-fields">
                <div class="noBorderT">
                    <table class="tb-notice-inquiry">
                        <tbody>
                            <tr>
                                <td><%=n.getNoticeTitle()%></td> 
                            </tr>
                            <tr>
                                <td><%=n.getEnrollDate()%></td> 
                            </tr>
                       </tbody>
                    </table>
                </div>
                <label class="option-right-hr"></label>

                <div class="board_view_content">
					<br>
					<%=n.getNoticeContent()%>
					
                </div>
                
                <div class="view_list grid">
                    <table class="tb_col">
                        <caption>이전, 다음, 현재 게시물</caption>
                        <colgroup>
                            <col style="width:100px"> 
                            <col style="width:auto"> 
                            <col style="width:180px"> 
                        </colgroup> 
                        <tbody> 
                            <tr class="prev"> 
                                <td>이전</td>
                                <td class="left"><a href="<%=contextPath%>/CsNodetail.no?nno=<%=nno-1%>"><input type="button" value="이전" id="b1"></a></td>
                                <td>2020.02.22</td>
                            </tr>
                            <tr class="current"> 
                                <td>-</td>
                                <td class="left"><a href="#"><%=n.getNoticeTitle()%></a></td>
                                <td>2019.12.01</td>
                            </tr>
                            <tr class="next"> 
                                <td>다음</td>
                                <td class="left"><a href="<%=contextPath%>/CsNodetail.no?nno=<%=nno+1%>">다음</a></td>
                                <td>2019.08.08</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            

				<br>
                <div class="btn_wrap">
                    <button type="button" class="btn-default-ok btn-ni-opinion">목록</button>
                </div>
			</div> <!--인풋필터 닫아주는거 ㅇㅇ-->
            <br>
            




        </div>
    </div>

</body>
</html>