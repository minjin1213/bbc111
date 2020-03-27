<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    	margin-top: 17px;
    	font-size: 20px;
    	font-weight: 900;
	}
 	.wrapper{
    	width:850px;
   	 	margin-left:auto;
    	margin-right:auto;

	}
	 .grid .tb-noBorder tbody tr th {
	    height: 19px;
	    line-height: 19px;
	    padding: 9px 10px 5px 10px;
	    text-align: left;
	    background: #fafafa;
	    color: #000;
	    vertical-align: top;
	    background: url(../../resources/images/bul_black.png) 0 20px no-repeat;
	}
	.grid .tb_noBorder tbody tr th {
	     height:19px;
	     line-height:19px;
	     padding:9px 10px 5px 10px;
	     text-align: left;
	     background:#fafafa;
	     color:#000;
	     vertical-align: top;
	     font-weight: normal;
	     background: url(../../resources/images/bul_black.png) 0 15px no-repeat; 
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
	
	.option-right-hr2 {
    	width: 99%;
    	border-bottom: 1px solid #757272;
    	padding: 0px 0px 15px 0px;
    	margin-top:60px;

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
	    width: 720px;
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
	
	li {
	    list-style: none;
	}
	


	.btn-opinion {
	    width: 150px;
	    height: 30px;
	    font-size: 15px;
	    margin: 15px 5px 0px 5px;
	    margin-left: 365px;
	}
	
		.btn-phone {
	    width: 100px;
	    height: 30px;
	    font-size: 13px;
	    margin-left : 7px;
	}
	
	img ,textarea, select, button {
	    vertical-align: middle;
	    margin: 0;
	    padding: 0;
	    color: #313131;
	    font-size: 14px;
	    line-height: 1.5;
	    font-family: 'NanumBarunGothic','맑은 고딕','돋음', dotum, sans-serif;
	}
	
	.chgs {
    height: 25px !important;
    border-radius: 7%;
    text-align: center;
    margin-left: 4px !important;
    padding-right: 10px;
    padding-top: 1px;
}
	.chgs2 {
    border-radius: 3%;
    text-align: left;
}
	.chgs3 {
    border-radius: 1%;
    text-align: left;
    margin-top: 7px;
}
		


     

</style>
</head>
<body>
		<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>

    <div class="wrapper">
		<div class="contact-form">
            <div class="main-title">고객 문의</div>
            <hr class="garo">
            
            <label class="option-right-hr">문의사항</label>
            <!--  <div class="main-title">개인정보</div>
            <hr class="hr.yong"> -->
			<div class="input-fields">
                <div class="grid noBorderT">
                    <table class="tb-noBorder">
                        <colgroup>
                              <col style="width:110px">
                              <col style="width:auto">
                        </colgroup>

                        <tbody>
                            <tr>
                                <th>
                                    <label for="userName">이름</label>
                                </th>
                                <td>
                                    <input type="text" id="userName" name="userName"  class="chgs" value="" title="이름" placeholder="이름을 입력하세요." >
                                </td>
                            </tr>
                            
                            <tr>
                                <th>
                                    <label for="userEmail">이메일</label>
                                </th>
                                <td>
                                    <input type="text" name="userEmail" id="userEmail" class="chgs" value="" title="이메일" placeholder="이메일을 입력하세요." maxlength="80">
                                </td>
                            </tr>
                            
                            <tr>
                               <th>
                                   <label for="phone1">휴대전화</label>
                               </th>
                               <td>
                                    <input type="text" name="phone1" id="phone1" class="chgs" title="휴대폰 첫번째 숫자" style="width:70px;" value="" maxlength="4" onkeydown="" onkeypress="" onkeyup="">
                                    <span class="hyphen"> - </span>
                                    <input type="text" name="phone2" id="phone2" class="chgs" title="휴대폰 가운데 숫자" style="width:90px;" value="" maxlength="4" onkeydown="" onkeypress="" onkeyup="">
                                    <span class="hyphen"> - </span>
                                    <input type="text" name="phone3" id="phone3" class="chgs" title="휴대폰 마지막 숫자" style="width:90px;" value="" maxlength="4" onkeydown="" onkeypress="" onkeyup="">
                               </td>
                            </tr>
                            
                       </tbody>
                    </table>
                </div>

                <div class="grid noBorderT mb50">    
                <table class="tb_noBorder">

                    <colgroup>
                        <col style="width:110px"> 
                        <col style="width:auto"> 
                    </colgroup>

                    <tbody>
                        <tr>
                            <th scope="row"><label for="title">제목</label></th>
                            <td>
                                <input type="text" id="title" class="chgs2" name="title" value="" placeholder="제목을 입력하세요." style="width:100%;">
                            </td> 
                        </tr>

                        <tr>
                            <th scope="row"><label for="contents">내용 </label></th>
                            <td>
                                <textarea name="contents" id="contents" class="chgs3"  placeholder="내용을 입력하세요." style="height:300px"></textarea>
                            </td> 
                        </tr>
                    </tbody>

                </table>

                </div>
  
		  	<label class="option-right-hr2">개인정보 수집 및 이용 약관</label>
            <span><input type="checkbox" style="margin-left:5px;">개인정보 수집 및 이용 약관 조항에 동의하기(필수)</span>
    				
    			
    
               <div style=" margin-left: 5px; border:1px solid lightgray; width:100%; height:200px; overflow: auto;margin-top:10px; margin-bottom:40px;">
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


                 
                <div class="btn_wrap">
                    <button type="button" class="btn-default-ok btn-opinion" onclick="chkformreq();return false;">등록</button>
                </div>
			</div> <!--인풋필터 닫아주는거 ㅇㅇ-->
            <br>
            
        </div>
    </div>

</body>
</html>