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
    	margin-top: 15px;
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
	 	border-radius: 4px;
	    width: 720px;
	    height: 155px;
	    	display: inline-block;
	    	color: #757272;
	        vertical-align: middle;
	        padding: 0px 10px;
	    border-radius: 4px;
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
	
	.radio_hr li {
	    display: inline-block;
	    
	    min-height: 26px;
	    margin-top: 3px;
	    margin-right: 25px;
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
	    margin-top : 10px;
	    margin-right : 350px;
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
    border-radius: 4px;
    vertical-align: middle;
    border: 1px solid #bbb;
    box-sizing: border-box;
    font-size: 14px;
    color: #757272;
    padding: 0px 10px;
    font-size: 14px;
}

.igrid {
    display: inline-block;
    width: 300px;
    height: 30px;
    border-radius: 4px;
    vertical-align: middle;
    border: 1px solid #bbb;
    box-sizing: border-box;
    font-size: 14px;
    color: #757272;
    padding: 0px 10px;
    font-size: 14px;
}

		
	
</style>
</head>
<body>
		<!-- 상단 메뉴바 include -->
	<%@ include file="../common/menubar.jsp" %>
	
	
		
    <div class="wrapper">
        <!--  <form action="../customerservice/sendMail.jsp" method="post"> -->
        <form action="/bbc/mail2.co" method="post">
            
            <div class="main-title">고객의견</div>
            <hr class="garo">
            <small>고객님의 의견을 성실하게 반영하여 더욱 편리하게 이용하실 수 있도록 최선을 다하겠습니다.</small>
            <label class="option-right-hr">개인정보</label>
            
            	<div class="grid noBorderT">
            	
                    <table class="tb-noBorder">
                        <colgroup>
                              <col style="width:110px">
                              <col style="width:auto">
                        </colgroup>

                        <tbody>
                            <tr>
                                <th scope="row">
                                    <label for="rdoGood">구분</label>
                                </th>
                                <td>
                                    <ul class="radio_hr">
                                        <li>
                                            <input type="radio" id="rdoGood" name="scate2" value="칭찬" checked="">
                                            <label for="rdoGood" class="mr20"><span class="icon"></span>칭찬</label>
                                        </li>
                                        <li>
                                            <input type="radio" id="rdoBad" name="scate2" value="불만">
                                            <label for="rdoBad"><span class="icon"></span>불만</label>
                                        </li>
                                    </ul> 
                                </td> 
                            </tr>

                            <tr>
                                <th>
                                    <label for="userName">이름</label>
                                </th>
                                <td>
                                    <input type="text" id="userName" name="userName"  class="igrid" value="" title="이름" placeholder="이름을 입력하세요." >
                                </td>
                            </tr>
                            
                            <tr>
                            

                            
                                <th>
                                    <label for="userEmail">이메일</label>
                                </th>
                                <td>
                                    <input type="text" name="userEmail" id="userEmail" maxlength="80" class="igrid" value="" title="이메일" placeholder="이메일을 입력하세요." maxlength="80">
                                </td>
                            </tr>                            
                       </tbody>
                    </table>
                    
                </div>
    			<br>
				<label class="option-right-hr">고객의견내용</label>        	
            	
            	<div class="grid noBorderT mb50">
		           <table class="tb_noBorder">
            	    <colgroup>
                        <col style="width:110px"> 
                        <col style="width:auto"> 
                    </colgroup>
                    
		                <tr>
		                	<th scope="row"><label for="title">제목</label></th>
		                	<td><input type="text" id="title" class="igrid" name="subject" value="" placeholder="제목을 입력하세요." style="width:100%;"  /></td>
		                </tr>
		                <tr>
		               		<th scope="row"><label for="contents">내용 </label></th>
		                	<td><textarea name="content" id="contents" class="chgs3"  placeholder="내용을 입력하세요." style="height:300px"></textarea></td>
		
		                </tr>
		                <tr>
		                	<td colspan="2" style="text-align:right;"><input type="submit" value="고객 의견 접수" class="btn-default-ok btn-phone"></td>
		                </tr>
		                
		                
		                
		                <tr>
		                	<td><input type="hidden" name="from"  value="bbc_manager@naver.com"/></td>
		                </tr>
		                <tr>
		                	<td><input type="hidden" name="to" value="bbc_manager@naver.com" /></td>
		                </tr>		         
		            </table>
		         </div>

        </form>
    </div>
</body>
</html>