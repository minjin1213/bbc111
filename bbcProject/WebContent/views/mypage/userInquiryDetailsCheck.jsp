<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    .board_view tbody td.content {

    width: 100%;
    overflow: hidden;
    text-align: left;
    background: none;
    margin: 0;
    word-break: break-all;
    }

    .board_view tbody tr th{
    border-bottom: 1px solid #ccc;
    border-left: 1px solid #ccc;
    padding: 11px 10px 8px 10px;
    }
    
    .board_view tbody tr td {
    border-bottom: 1px solid #ccc;
    border-left: 1px solid #ccc;


    }

    .board_view tbody tr th:first-child,
    .board_view tbody tr td:first-child {
        border-left: 0;
        
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
                    <td class="pl301">2019.12.01</td>
                </tr>
                <tr>
                    <th class="center" scope="row">성명</th>
                    <td class="pl30">비비씨</td>
                </tr>
                <tr>
                    <th class="center" scope="row">이메일</th>
                    <td class="pl30">dddddd</td>
                </tr>
                <tr>
                    <th class="center" scope="row">연락처</th>
                    <td class="pl30">010-0119-1112</td>
                </tr>
                <tr>
                    <th class="center" scope="row">제목 </th>
                    <td class="pl30">문의내역</td>
                </tr>
                <tr>
                    <th class="center" scope="row">문의내용 </th>
                    <td class="pl30">차량은 어떻게 빌리죠?</td>
                </tr>
            </tbody>
        </table>

        <div class="main-title">답변내용</div>	
        <hr class="garo">
        <table class="board_view">
            <caption></caption>
            <colgroup>
                <col style="width: 35%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th class="center">제목</th>
                    <td class="pl30">RE:차량은 어떻게 빌리죠?</td>
                </tr>
                <tr>
                    <td colspan="4" class="content">
               <div style=" margin-left: 5px; border:1px solid lightgray; width:100%; height:200px; overflow: auto;">
                  1. 수집/이용에 대한 동의<br><br>
                    가. 수집/이용 목적 <br>
                     ① 서비스 가입/변경/해지, AS, 청구서발송, 물품(단말기/경품 등)배송, 본인확인, 개인식별, 가입의사확인, 고지사항전달, 서비스제공관련 안내 , 명의도용방지를 위한 등록된 이동전화로 가입사실통보, 이용요금 상담 할인 청구(개별/통합/합산) 고지 결재 및 추심, 이용관련 문의.불만처리<br>
                     ② 이용요금 및 위탁수수료의 정산, 서비스이용 확인.점검, 위치기반서비스<br>
                     ③ 기타 법령에서 정한 내용<br><br>
                    나. 수집항목<br>
                      여권번호, 운전면허의 면허번호, 외국인등록번호, 주민등록번호, I-Pin번호<br><br>
                    다. 이용 및 보유기간<br>
                    서비스 가입기간(가입일~해지일) 또는 분쟁기간 동안 이용하고 지체없이 파기하며, 요금정산, 요금과오납 등 분쟁대비를 위해 해지후 6개월까지 , 요금의 미/과납이 있어 요금관련 분쟁이 계속될 경우에는 해결시 까지 보유(단, 법령에 특별한 규정이 있는 경우 관련 법령에 따라 보관)<br><br>
                    라. 부정가입 방지 관련<br>
                    부정가입 방지를 위해 고객(대리인 포함)이 제시한 신분증의 진위 여부 및 법정대리인 관계확인에 필요한 성명 , 주민등록번호(외국인은 외국인등록번호, 거소신고번호, 여권번호), 운전면허번호, 그 밖에 신분증 기재사항을 한국정보통신진흥협회, 행정자치부, 법원행정처 등 신분증 발급기관에 제공하여 진위 여부를 확인하는데 동의합니다.<br>
               </div>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="btn_wrap">
            <button type="button" class="btn-default-ok btn-opinion-list" onclick="">목록</button>
        </div>
        <br>

    </div>



</div>    

</body>
</html>