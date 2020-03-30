<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bbc.myinquiry.model.vo.*" %>
<%
	MyInquiry m = (MyInquiry)request.getAttribute("m");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
.grid caption { width:0; height:0; font-size:0; line-height:0; overflow:hidden; visibility:hidden; }
.grid .tb_row { width:100%; border:0; margin: auto;}
.grid .tb_row tbody tr.borderTop { border-top:1px solid #000; }
.grid .tb_row tbody tr th,
.grid .tb_row tbody tr td { border-bottom:1px solid #ccc; border-left:1px solid #ccc; color: #646464; }
.grid .tb_row tbody tr th:first-child { border-left:0; }
.grid .tb_row tbody th.bgGray { background: #e4e4e4; }
.grid .tb_row tbody th.noBorderL { border-left:0; } 
.grid .tb_row tbody tr th { height:19px; line-height:19px;  padding:11px 10px 8px 10px; text-align: left;font-size:15px; background:#fafafa; color:#000;  }   
.grid .tb_row tbody tr td { height:19px; line-height:20px; padding:10px 15px 9px 15px; vertical-align: top;  }  
.grid .tb_row tbody th.borderL, .grid .tb_row tbody td.borderL { border-left:1px solid #ccc;}
.grid .tb_row tbody tr th.center { text-align: center; vertical-align: middle;}
.grid .tb_row tbody tr td.pl30 { text-align: center; vertical-align: middle;}

.grid .tb_row tbody tr th.center1 { text-align: center; vertical-align: middle; border-top:1px solid #ccc;}
.grid .tb_row tbody tr td.pl301 { text-align: center; vertical-align: middle; border-top:1px solid #ccc;}



.grid .tb_row2 { width:100%; border:0; margin: auto;}
.grid .tb_row2 tbody tr.borderTop { border-top:1px solid #000; }
.grid .tb_row2 tbody tr th { border-bottom:1px solid #ccc; border-right:1px solid #ccc; color: #646464; }
.grid .tb_row2 tbody tr td { border-bottom:1px solid #ccc; color: #646464; }
.grid .tb_row2 tbody tr th:first-child { border-left:0; }
.grid .tb_row2 tbody th.bgGray { background: #e4e4e4; }
.grid .tb_row2 tbody th.noBorderL { border-left:0; } 
.grid .tb_row2 tbody tr th { height:19px; line-height:19px;  padding:11px 10px 8px 10px; text-align: left;font-size:15px; background:#fafafa; color:#000;  }   
.grid .tb_row2 tbody tr td { height:19px; line-height:20px; padding:10px 15px 9px 15px; vertical-align: top;  }  
.grid .tb_row2 tbody th.borderL, .grid .tb_row tbody td.borderL { border-left:1px solid #ccc;}
.grid .tb_row2 tbody tr th.center { text-align: center; vertical-align: middle;}
.grid .tb_row2 tbody tr td.pl30 { text-align: center; vertical-align: middle;}

.grid .tb_row2 tbody tr th.center1 { text-align: center; vertical-align: middle; border-top:1px solid #ccc;}
.grid .tb_row2 tbody tr td.pl301 { text-align: center; vertical-align: middle; border-top:1px solid #ccc;}


hr.garo {
	    border: 1px solid #757272;
	    margin: 17px 0px 10px 0px;
	    margin-bottom: 15px;
	}
	.main-title {
    	margin-top: 17px;
    	font-size: 20px;
    	font-weight: 900;
	}

    .outer{ /* 한거 */
		width:860px;
		margin-left:auto;
		margin-right:auto;
	}
    label {
    display: inline-block;
    margin-bottom: .5rem;
    font-weight: 700;
	}
    .option-right-hr {
    	width: 99%;
    	border-bottom: 1px solid #757272;
    	padding: 0px 0px 15px 0px;
    	margin-bottom: 15px;
        
	}	

    .sub-title {
        margin-left: 15px;
    }



    .btn-default-ok {
	    background-color: #ffc107;
	    color: white;
	    /*font-weight: 900;*/
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	}
    
    .btn-opinion-list {
	    width: 120px;
	    height: 30px;
	    font-size: 15px;
	    margin: 15px 5px 0px 5px;
	    margin-left: 365px;
        

	}
    



</style>


<body>
<!-- 상단 메뉴바 include -->
<%@ include file="../common/menubar.jsp" %>

<div class="outer">   
    <div class="main-title">나의 문의 내역</div>	
    <hr class="garo">
    


    <!-- <label class="option-right-hr">문의</label> -->

    <div class="grid mb75">
        <table class="tb_row">
            <caption></caption>
            <colgroup>
                <col style="width: 300px;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th class="center1" scope="row">작성일자</th>
                    <td class="pl301"><%=m.getInquiryDate()%></td>
                </tr>
                <tr>
                    <th class="center" scope="row">성명</th>
                    <td class="pl30"><%=m.getMemberName()%></td>
                </tr>
                <tr>
                    <th class="center" scope="row">이메일</th>
                    <td class="pl30"><%=m.getMemberEmail()%></td>
                </tr>
                <tr>
                    <th class="center" scope="row">연락처</th>
                    <td class="pl30"><%=m.getPhone()%></td>
                </tr>
                <tr>
                    <th class="center" scope="row">제목 </th>
                    <td class="pl30"><%=m.getInquiryTitle()%></td>
                </tr>
                <tr>
                    <th class="center" scope="row">문의내용 </th>
                    <td class="pl30"><%=m.getInquiryContent()%></td>
                </tr>
            </tbody>
        </table>

        <div class="main-title">답변내용</div>	
        <hr class="garo">
        
        <table class="tb_row2">
            <caption></caption>
            <colgroup>
                <col style="width: 300px;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th class="center">제목</th>
                    <td class="pl30"><%=m.getInquiryTitle()%></td>
                </tr>
                <tr>
                    <td colspan="4" class="content">
						<%=m.getInquiryAnswer()%>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="btn_wrap">
            <button type="button" class="btn-default-ok btn-opinion-list" onclick="goBackMy()">목록</button>
        </div>
        <br>

    </div>



</div>
<script>

	

	function goBackMy() {

	    window.history.back();

	}

	

 

</script>     

</body>
</html>